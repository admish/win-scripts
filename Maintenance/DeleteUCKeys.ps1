<#
.DESCRIPTION
    This script is intended to be used after migrating user profiles with tools like Transwiz
    that may not handle the protected UserChoice registry keys correctly due to the presence
    of the ucpd.sys driver (part of the Universal Windows Platform Deployment Client).
    
    The script identifies and deletes inaccessible UserChoice and UserChoiceLatest keys
    under FileExts and UrlAssociations for the currently logged-in user. These keys are
    protected by ucpd.sys, which can lead to issues such as flashing icons in the system tray.
    
    After deletion, Windows will recreate these keys on the next logon, resolving potential issues.

.NOTES
    The other workaround would be to disable the ucpd.sys driver, reboot the computer, run the migration and then reenable the driver.
    
    Temporarily Disable the UCPD Driver:
    
    ```
    sc config ucpd start= disabled
    schtasks /change /Disable /TN "\Microsoft\Windows\AppxDeploymentClient\UCPD velocity"
    ```

    Reboot the machine to unload the driver.  
    Run Transwiz and complete the migration.  
    Re-enable the driver afterwards:  
    
    ```
    sc config ucpd start= auto
    schtasks /change /Enable /TN "\Microsoft\Windows\AppxDeploymentClient\UCPD velocity"
    ```
#>

# Define the path for the temporary copy of reg.exe (to bypass ucpd.sys restrictions)
$tempReg = "$env:TEMP\upwreg.exe"
$regPath = "$env:windir\System32\reg.exe"
Copy-Item -Path $regPath -Destination $tempReg -Force

# Attempt to determine the currently logged-on shell user by querying the explorer process
try {
    $explorer = Get-Process explorer -ErrorAction Stop | Select-Object -First 1
    $explorerWMI = Get-WmiObject Win32_Process -Filter "ProcessId = $($explorer.Id)"
    $ownerInfo = $explorerWMI.GetOwner()
    $shellUser = "$($ownerInfo.Domain)\$($ownerInfo.User)"
} catch {
    Write-Error "Failed to get shell user."
    exit 1
}

# Resolve SID using .NET APIs (works for local, domain, AzureAD)
try {
    $ntAccount = New-Object System.Security.Principal.NTAccount($shellUser)
    $sid = $ntAccount.Translate([System.Security.Principal.SecurityIdentifier])
    $userSID = $sid.Value
    if (-not $userSID) { throw "SID not found" }
} catch {
    Write-Error "Failed to resolve SID for $shellUser"
    exit 1
}

# Function to remove inaccessible UserChoice or UserChoiceLatest keys
function Remove-InaccessibleKeys {
    param (
        [string]$basePath,
        [string[]]$keyNames
    )

    try {
        $subKeys = Get-ChildItem -Path "Registry::$basePath" -ErrorAction Stop | Select-Object -ExpandProperty PSChildName
        foreach ($sub in $subKeys) {
            foreach ($keyName in $keyNames) {
                $targetKey = "$basePath\$sub\$keyName"
                $regKey = "Registry::$targetKey"

                if (-not (Test-Path $regKey)) {
                    Write-Host "No key: $targetKey - skipping"
                    continue
                }

                $writeTestFailed = $false
                try {
                    Set-ItemProperty -Path $regKey -Name "TestWriteAccess" -Value "test" -ErrorAction Stop
                    Remove-ItemProperty -Path $regKey -Name "TestWriteAccess" -ErrorAction SilentlyContinue
                    Write-Host "Writable: $targetKey - skipping"
                } catch {
                    $writeTestFailed = $true
                    Write-Warning "Inaccessible (write failed): $targetKey - deleting"
                }

                if ($writeTestFailed) {
                    $exitCode = cmd.exe /c "`"$tempReg`" delete `"$targetKey`" /f"
                    if ($LASTEXITCODE -eq 0) {
                        Write-Host "Deleted: $targetKey"
                    } else {
                        Write-Warning "Delete command failed (exit $LASTEXITCODE) for $targetKey"
                    }
                }
            }
        }
    } catch {
        Write-Warning "Could not process `${basePath}`: $($_.Exception.Message)"
    }
}

# Define registry paths to scan
$fileExts = "HKEY_USERS\$userSID\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts"
$urlAssoc = "HKEY_USERS\$userSID\Software\Microsoft\Windows\Shell\Associations\UrlAssociations"

# Remove both UserChoice and UserChoiceLatest keys
Remove-InaccessibleKeys -basePath $fileExts -keyNames @("UserChoice", "UserChoiceLatest")
Remove-InaccessibleKeys -basePath $urlAssoc -keyNames @("UserChoice", "UserChoiceLatest")

# Cleanup reg.exe and restart explorer
Remove-Item -Path $tempReg -Force -ErrorAction SilentlyContinue
Stop-Process -Name explorer -Force
Start-Process explorer.exe

Write-Host "`nDone."
