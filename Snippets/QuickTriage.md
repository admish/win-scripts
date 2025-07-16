Run the following commands in this order to resolve any issues with data corruption within Windows.


```powershell
chkdsk C: /scan /forceOfflineFix
chkdsk C: /f /r
```

## Reboot..... then continue

Use the SFC command tool to repair system problems
```powershell
sfc /scannow
```

The "ScanHealth" option performs a more advanced scan to find out whether the image has any issues.
```powershell
dism.exe /Online /Cleanup-Image /ScanHealth
```

The "RestoreHealth" option will automatically scan and repair common issues.
```powershell
dism.exe /Online /Cleanup-Image /RestoreHealth
```

Use the SFC command tool again, to repair any issues found by DISM
```powershell
sfc /scannow
```

```powershell
dism.exe /Online /Cleanup-Image /AnalyzeComponentStore  
dism.exe /Online /Cleanup-Image /StartComponentCleanup  
```