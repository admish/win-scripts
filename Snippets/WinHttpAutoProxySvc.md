A bug in "Windows 11 24H2" has been reported to affect DHCP functionality, leading to no internet access for some users. Instead, of 
getting a valid IP address through DHCP, these users are receiving an Automatic Private IP Address (APIPA), which prevents internet 
connectivity. The following modifies the WcmSvc (Windows Connection Manager) service's dependencies and sets the WinHttpAutoProxySvc 
service to start manually.

## Quick fix
```powershell
cmd /c "sc config WcmSvc depend=RpcSs/NSI"
```

## Proper fix
Change WcmSvc Dependency
```powershell
if ((Get-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Services\Wcmsvc | Select-Object -ExpandProperty DependOnService) -contains "WinHTTPAutoProxySvc") {
    Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\Wcmsvc -Name DependOnService -Value @('RpcSs', 'NSI') -Type MultiString
}
```

Set Service WinHttpAutoProxySvc to Manual
```powershell
if ((Get-Service -Name WinHttpAutoProxySvc).StartType -ne 'Manual') {
    New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc -Name 'Start' -Value '3' -PropertyType DWORD -Force:$true
}
```

Restart services
```powershell
Restart-Service WcmSvc, WlanSvc -Force:$true -Confirm:$false
```

[Source](https://powershellisfun.com/2025/01/23/fixing-windows-11-24h2-no-internet-access-issue-using-powershell-and-intune-remediation/)

## Full copy/paste block
```powershell
if ((Get-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Services\Wcmsvc | Select-Object -ExpandProperty DependOnService) -contains "WinHTTPAutoProxySvc") {
    Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\Wcmsvc -Name DependOnService -Value @('RpcSs', 'NSI') -Type MultiString
}
if ((Get-Service -Name WinHttpAutoProxySvc).StartType -ne 'Manual') {
    New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc -Name 'Start' -Value '3' -PropertyType DWORD -Force:$true
}
Restart-Service WcmSvc, WlanSvc -Force:$true -Confirm:$false
```
