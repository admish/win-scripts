Change the timezone to EST and force Windows to resync with the Internet time server
```powershell
tzutil /s "Eastern Standard Time"
net stop w32time
w32tm /unregister
w32tm /register
net start w32time
w32tm /resync /nowait
```

## Breakdown 
```powershell
## Set the timezone to "Eastern Standard Time"
tzutil /s "Eastern Standard Time"
## Stop windows time services" 
net stop w32time
## Unregister windows time services" 
w32tm /unregister
## Registering windows time services again" 
w32tm /register
## Restarting windows time services" 
net start w32time
## Resynchronizing Windows time" 
w32tm /resync /nowait
```

## Various Time Queries
Display current date & time 
```powershell
Get-Date
```

### in 'ISO 8601' format
```powershell
Get-Date -Format u
```

#### In batch
```msshell
:: ISO-8601
echo %date:~10,4%%date:~7,2%%date:~4,2%T%time:~0,2%%time:~3,2%%time:~6,2% 
:: CURRENT_DATE
echo %date:~10,4%-%date:~4,2%-%date:~7,2% 

date /t && time /t && tzutil /g
```

### Show current Timezone
```powershell
[System.TimeZoneInfo]::Local
### Variations
[System.TimeZoneInfo]::Local.Id
[System.TimeZoneInfo]::Local.DisplayName
[System.TimeZoneInfo]::Local.StandardName
```


