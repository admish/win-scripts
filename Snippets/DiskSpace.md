## Assessment
Quick one-line Assessment 
```powershell
$env:COMPUTERNAME;Get-PSDrive C;"`n";diskusage /g:1 /x /h /t:5 C:\;"`n";diskusage /g:1 /x /h /u:5 C:\ 
```

View system disk details, including free space available
```powershell
Get-PSDrive 'C'
```
```powershell
Get-Volume -DriveLetter C
```

## Manage Shadow Copies
### Reduce Restore Point Size
List restore points (Newest first)
```powershell
Get-ComputerRestorePoint | Sort-Object CreationTime -Descending
```
Details on restore points
```powershell
vssadmin list shadows
vssadmin list shadows /For=C:
## or
Get-ComputerRestorePoint | Format-List
```

Set maximal size allowed for restore points
```powershell
vssadmin resize shadowstorage /for=C: /on=C: /maxsize=5%
```
Delete the oldest shadow copy of volume C
```powershell
vssadmin delete shadows /for=C: /oldest
```

### Remove Dell SARemediation
Uninstall all Dell pre-installed bloatware.... 
```powershell
$xPath = "$env:ProgramData\Dell\SARemediation\SystemRepair\Snapshots\Backup"
Get-ChildItem -Path "$xPath\*" -Force -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue  
```

## Clean Windows & System Files
Microsoft has minimal documentation for their Disk Cleanup Utility. But when it works it will clear out a lot of unnecessary files.
```PowerShell
cleanmgr /SAGERUN:1 /VeryLowDisk /AUTOCLEAN | Out-Null
```

Remove downloads for **Windows Updates**
```powershell
Remove-Item -Path "$env:SystemRoot\SoftwareDistribution\Download" -Recurse -Force
```
#### Remove System Temp Files
```powershell
Get-ChildItem -Path "$env:SystemRoot\Temp\*" -Force -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue  
```
#### Empty/Reset System Recycle Bin
Deleting the `C:\$Recycle.Bin\` folder will empty it for all users on the system. (Will also reset it and fix any issues.)
```powershell
Get-ChildItem -LiteralPath 'C:\$Recycle.Bin\' -Force | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
```

## Empty Recycle Bin
Normal methods like `dir` won't work for this folder. Use the following to view the contents of Recycle Bin
```powershell
Get-ChildItem -LiteralPath 'C:\$Recycle.Bin\' -Force | gci -Force
```

Using the "Force" parameter doesn't prompt for confirmation to clear all recycle bins. An alternative is to replace `-Force` with `-Confirm:$false`.
```powershell
Clear-RecycleBin -Force
Clear-RecycleBin -Confirm:$false

Clear-RecycleBin -Force -Confirm:$false
```

Deleting the Recycle Bin folder will also force it to reset itself
```powershell
Get-ChildItem -LiteralPath 'C:\$Recycle.Bin\' -Force | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue  
## or in batch
cmd /c "rd /s /q %SystemDrive%\$Recycle.bin"
```

## Clean User Profile Folders

```powershell
$ClrProf = "https://raw.githubusercontent.com/My-Random-Thoughts/Various-Code/refs/heads/master/CleanUserProfileFolders.ps1"
$wc = New-Object System.Net.WebClient; $wc.DownloadFile("$ClrProf", "C:\Windows\Temp\CleanUserProfiles.ps1")
PowerShell.exe -ExecutionPolicy Bypass -File "C:\Windows\Temp\CleanUserProfiles.ps1"
del "C:\Windows\Temp\CleanUserProfiles.ps1"
```
