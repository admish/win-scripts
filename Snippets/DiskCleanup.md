
### Remove Users AppData Temp Files
```powershell
Get-ChildItem -Path "$env:TEMP\*" -Force -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue  
```
### Remove System Temp Files
```powershell
Get-ChildItem -Path "$env:SystemRoot\Temp\*" -Force -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue  
```

## Empty Recycle Bin
Using the "Force" parameter doesn't prompt for confirmation to clear all recycle bins. An alternative is to replace `-Force` with `-Confirm:$false`.
```powershell
Clear-RecycleBin -Force
Clear-RecycleBin -Confirm:$false

Clear-RecycleBin -Force -Confirm:$false
```

### Deleting the Recycle Bin folder will also force it to reset itself
```powershell
Get-ChildItem -LiteralPath 'C:\$Recycle.Bin\' -Force | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue  
## or in batch
cmd /c "rd /s /q %SystemDrive%\$Recycle.bin"
```

## Disk Cleanup
```powershell
# USAGE
# cleanmgr [/SAGESET:n | /SAGERUN:n | TUNEUP:n | /LOWDISK | /VERYLOWDISK | /SETUP]

# Documentation on the SAGESET and SAGERUN switches.
# http://support.microsoft.com/default.aspx/kb/253597

cleanmgr /sagerun:1 /VeryLowDisk /AUTOCLEAN | Out-Null
```