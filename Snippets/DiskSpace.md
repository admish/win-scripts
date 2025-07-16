
```powershell
Get-PSDrive C
Get-Volume -DriveLetter C
Get-WmiObject -Class Win32_LogicalDisk 
```

```powershell
## Top 5 largest folders
diskusage /t=5 /h C:\

## Top 5 Largest files
diskusage /u=5 /h c:\

diskusage /t=5 /h C:\Users\

## Folders greater than 1GB
diskusage /minFileSize=1073741824 /h c:\windows
```

Show free space for all drives
```powershell
Get-WmiObject -Class Win32_LogicalDisk | Format-Table DeviceId, MediaType, @{n="Size";e={[math]::Round($_.Size/1GB,2)}},@{n="FreeSpace";e={[math]::Round($_.FreeSpace/1GB,2)}}
```

total disk space and free percentage on each drive
```powershell
Get-WmiObject -Class Win32_LogicalDisk | Select-Object -Property DeviceID, VolumeName, @{Label='FreeSpace (Gb)'; expression={($_.FreeSpace/1GB).ToString('F2')}}, @{Label='Total (Gb)'; expression={($_.Size/1GB).ToString('F2')}}, @{label='FreePercent'; expression={[Math]::Round(($_.freespace / $_.size) * 100, 2)}}|ft
```

PowerShell Get Disk Space via Get-CimInstance Command
```powershell
Get-CimInstance -Class win32_logicaldisk | Format-Table DeviceId, MediaType, @{n="Size";e={[math]::Round($_.Size/1GB,2)}},@{n="FreeSpace";e={[math]::Round($_.FreeSpace/1GB,2)}}
```

```powershell
Get-CimInstance -Class Win32_LogicalDisk |Select-Object -Property DeviceID, VolumeName, @{Label='FreeSpace (Gb)'; expression={($_.FreeSpace/1GB).ToString('F2')}},@{Label='Total (Gb)'; expression={($_.Size/1GB).ToString('F2')}},@{label='FreePercent'; expression={[Math]::Round(($_.freespace / $_.size) * 100, 2)}}|ft
```

