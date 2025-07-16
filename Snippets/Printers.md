Show available printers
```powershell
Get-Printer
```
(Note: Group policy may install different printers for different users. Run this commands under the necessary users permissions)

Show full details of available printers
```powershell
Get-Printer | Format-List
```

Remove a printer
```powershell
Remove-Printer -Name "Microsoft XPS Document Writer"
Remove-Printer -Name "\\WindowsSVR\Xerox Printer" 
```

Install "Microsoft Print to PDF" Printer
```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Printing-PrintToPDFServices-Features
```
Install "Microsoft XPS Document Writer" Printer
```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Printing-XPSServices-Features
```


----- 

## Untested
Unable to finish exploring these commands, and are only saved here for future reference. They do not work in their current state, or have very specific use cases.
```powershell
$Printer = Get-Printer -Name "Xerox Printer"
Remove-Printer -InputObject $Printer

Get-Printer | Where-Object {$_.Type -eq 'Connection'}

Get-Printer | Where-Object {$_.Type -eq 'Local'} | Remove-Printer -WhatIf
```

Doesn't work when using `-ComputerName`
```powershell
Remove-Printer -ComputerName LPT-2025 -Name "Xerox Printer"
Remove-Printer -Name "\\WindowsSVR\Xerox Printer"
```


```powershell
Enter-PSSession LPT-2025 -Credential (Get-Credential -username DOMAIN\admin)

https://live.sysinternals.com/PsExec64.exe
psexec -u domain\user -h -i command [arguments]
```
