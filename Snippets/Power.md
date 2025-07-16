## Battery Health
```powershell
powercfg /batteryreport /output "C:\battery-report.html"
```


## Configure power management settings
### Disabling the hibernate feature
```powershell
powercfg /hibernate off
```

### Disabling timeouts while using AC power
```powershell
powercfg.exe -Change monitor-timeout-ac 0
powercfg.exe -Change disk-timeout-ac 0
powercfg.exe -Change standby-timeout-ac 0
powercfg.exe -Change hibernate-timeout-ac 0
```

### Adjust timeouts on battery power
These are ideal settings, but often best to let Windows automatically adjust them to prolong battery life.
```powershell
powercfg.exe -x -monitor-timeout-dc 10
powercfg.exe -x -disk-timeout-dc 0
powercfg.exe -x -standby-timeout-dc 30
powercfg.exe -x -hibernate-timeout-dc 45
```

