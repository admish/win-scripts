#Requires -version 5.1
<#
██╗    ██╗██╗███╗   ██╗ ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ 
██║    ██║██║████╗  ██║██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ 
██║ █╗ ██║██║██╔██╗ ██║██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
██║███╗██║██║██║╚██╗██║██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
╚███╔███╔╝██║██║ ╚████║╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
 ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝ 

.DESCRIPTION
  Starter script to set standard preferences on  
  new computers running Microsoft Windows

.INPUTS
  Quick start script access to this script is available via the following command:
    irm win.xga.io | iex

#>

<#---------------------------------------------------------[Declarations]--------------------------------------------------------#>

### Options for Write-Host
$opt1 = @{ForegroundColor="Yellow"; BackgroundColor="DarkBlue"}


<#------------------------------------------------------[Beginning of Script]----------------------------------------------------#>

### Update and sync time with time server 
Write-Host @opt1 " [+] Setting Timezone to Eastern" 
tzutil /s "Eastern Standard Time"
Write-Host @opt1 " [+] Stopping windows time services" 
net stop w32time
Write-Host @opt1 " [+] Unregistering windows time services" 
w32tm /unregister
Write-Host @opt1 " [+] Registering windows time services again" 
w32tm /register
Write-Host @opt1 " [+] Restarting windows time services" 
net start w32time
Write-Host @opt1 " [+] Resynchronizing Windows time" 
w32tm /resync /nowait
Write-Host "$(Get-Date -Format u) `n" -ForegroundColor Green

### Restore default power schemes
powercfg -restoredefaultschemes

### Configure power management settings
Write-Host @opt1 " [+] Disabling the hibernate feature" 
powercfg /hibernate off
Write-Host @opt1 " [+] Disabling timeouts while using AC power" 
powercfg -Change monitor-timeout-ac 0
powercfg -Change disk-timeout-ac 0
powercfg -Change standby-timeout-ac 0
powercfg -Change hibernate-timeout-ac 0
powercfg -setACvalueIndex scheme_current sub_buttons lidAction 0

# Write-Host @opt1 "...Disable timeouts while using battery" 
# powercfg -Change monitor-timeout-dc 10
# powercfg -Change disk-timeout-dc 0
# powercfg -Change standby-timeout-dc 0
# powercfg -Change hibernate-timeout-dc 0
# powercfg -setDCvalueIndex scheme_current sub_buttons lidAction 0

### Remove password expiration from enabled local Administrators 
Write-Host @opt1 " [+] Removing password expiration from Administrators" 
$localAdmins = Get-LocalGroupMember -Group administrators | Where-Object {($_.PrincipalSource -eq "Local")}
foreach ($localuser in $localAdmins){
    if ($localuser.enabled){
        Set-LocalUser -Name $localuser -PasswordNeverExpires $true
    }
}

### Enable System Restore Points
Write-Host @opt1 " [+] Enabling System Restore Points" 
Enable-ComputerRestore -Drive "C:\"

Write-Host @opt1 " [+] Show extensions for known file types" 
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -value 0

Write-Host @opt1 " [+] Open Windows Explorer to This PC"
Set-Itemproperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'LaunchTo' -Value 1

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

<#---------------------------------------------------------[Finalization]--------------------------------------------------------#>

### Pausing to allow user to close script window manually after reviewing output
Pause