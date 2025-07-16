<#
References: 
- https://powershellisfun.com/2025/01/23/fixing-windows-11-24h2-no-internet-access-issue-using-powershell-and-intune-remediation/
#>

## Change WcmSvc Dependency
if ((Get-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Services\Wcmsvc | Select-Object -ExpandProperty DependOnService) -contains "WinHTTPAutoProxySvc") {
    Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\Wcmsvc -Name DependOnService -Value @('RpcSs', 'NSI') -Type MultiString
}
else {
    Write-Output "WinHTTPAutoProxySvc key not found"
}


## Set Service WinHttpAutoProxySvc to Manual
if ((Get-Service -Name WinHttpAutoProxySvc).StartType -ne 'Manual') {
    New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc -Name 'Start' -Value '3' -PropertyType DWORD -Force:$true
}
else {
    Write-Output "WinHTTP Web Proxy Auto-Discovery Service already configured as Manual"
    exit 1
}

## Restart services
Restart-Service WcmSvc, WlanSvc -Force:$true -Confirm:$false