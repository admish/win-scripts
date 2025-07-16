Remove password expiration from enabled local Administrators 

```powershell
Write-Host @opt1 " [+] Removing password expiration from Administrators" 
$localAdmins = Get-LocalGroupMember -Group administrators | Where-Object {($_.PrincipalSource -eq "Local")}
foreach ($localuser in $localAdmins){
    if ($localuser.enabled){
        Set-LocalUser -Name $localuser -PasswordNeverExpires $true
    }
}
```