#Requires -version 5.1

### Update and sync time with time server 
tzutil /s "Eastern Standard Time"
net stop w32time
w32tm /unregister
w32tm /register
net start w32time
w32tm /resync /nowait

### Restore default power schemes
powercfg -restoredefaultschemes

### Configure timeouts while using AC power
powercfg -Change monitor-timeout-ac 0
powercfg -Change disk-timeout-ac 0
powercfg -Change standby-timeout-ac 0
powercfg -Change hibernate-timeout-ac 0
powercfg -setACvalueIndex scheme_current sub_buttons lidAction 0

### Configure timeouts while using battery
# powercfg -Change monitor-timeout-dc 10
# powercfg -Change disk-timeout-dc 0
# powercfg -Change standby-timeout-dc 0
# powercfg -Change hibernate-timeout-dc 0
# powercfg -setDCvalueIndex scheme_current sub_buttons lidAction 0

### Disable hibernation
powercfg /hibernate off

### Remove password expiration from enabled local Administrators 
$localAdmins = Get-LocalGroupMember -Group administrators | Where-Object {($_.PrincipalSource -eq "Local")}
foreach ($localuser in $localAdmins){
    if ($localuser.enabled){
        Set-LocalUser -Name $localuser -PasswordNeverExpires $true
    }
}

### Enable System Restore Points
Enable-ComputerRestore -Drive "C:\"
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -value 0
Set-Itemproperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'LaunchTo' -Value 1

### Disable Telemetry settings
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowDeviceNameInTelemetry" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
 
Get-Service -Name "DiagTrack" | Stop-Service -NoWait -Force
Get-Service -Name "DiagTrack" | Set-Service -StartupType Disabled

if ((Get-ItemProperty HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection | Select-Object -ExpandProperty AllowTelemetry) -contains "0") {
    Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name AllowTelemetry -Type DWord -Value 0
}

### Install "Microsoft Print to PDF" Printer
Enable-WindowsOptionalFeature -Online -FeatureName Printing-PrintToPDFServices-Features

### Install "Microsoft XPS Document Writer" Printer
Enable-WindowsOptionalFeature -Online -FeatureName Printing-XPSServices-Features


<#-----------------------------------------------[Windows 11 24H2 WiFi/APIPA Bugfix]-----------------------------------------------
A bug in "Windows 11 24H2" has been reported to affect DHCP functionality, leading to no internet access for some users. Instead, of 
getting a valid IP address through DHCP, these users are receiving an Automatic Private IP Address (APIPA), which prevents internet 
connectivity. The following modifies the WcmSvc (Windows Connection Manager) service's dependencies and sets the WinHttpAutoProxySvc 
service to start manually.

May also be resolved by running the following command:
    cmd /c "sc config WcmSvc depend=RpcSs/NSI"

Ref: https://powershellisfun.com/2025/01/23/fixing-windows-11-24h2-no-internet-access-issue-using-powershell-and-intune-remediation/
#>

### Change WcmSvc Dependency
if ((Get-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Services\Wcmsvc | Select-Object -ExpandProperty DependOnService) -contains "WinHTTPAutoProxySvc") {
    Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\Wcmsvc -Name DependOnService -Value @('RpcSs', 'NSI') -Type MultiString
}

### Set Service WinHttpAutoProxySvc to Manual
if ((Get-Service -Name WinHttpAutoProxySvc).StartType -ne 'Manual') {
    New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc -Name 'Start' -Value '3' -PropertyType DWORD -Force:$true
}

### Restart services
Restart-Service WcmSvc, WlanSvc -Force:$true -Confirm:$false

