## Evaluate
### Show drive use for C Drive
```powershell
Get-PSDrive C
```

### Top 5 Largest Folders
```powershell
diskusage /t=5 /h C:\
```

### Top 5 Largest Files
```powershell
diskusage /u=5 /h c:\
```

### Top 5 Largest User Folders
```powershell
diskusage /t=5 /h C:\Users\
```

### Folders greater than 1GB
```powershell
diskusage /minFileSize=1073741824 /h c:\windows
```

## Recover 
### Clean User Profile Folders
```powershell
irm xga.io/clrusr | iex
```

run same script above, but on Windows 10 or older systems without `Invoke-RestMethod`
```powershell
$wc = New-Object System.Net.WebClient; $wc.DownloadFile("https://raw.githubusercontent.com/My-Random-Thoughts/Various-Code/refs/heads/master/CleanUserProfileFolders.ps1", "C:\Windows\Temp\CleanUserProfiles.ps1")
cd C:\Windows\Temp
.\CleanUserProfiles.ps1
del CleanUserProfiles.ps1
```

Change execution policy to allow scripts to run, until exiting Powershell
```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
```

### Clear out system temp folder
```powershell
Get-ChildItem -Path "$env:SystemRoot\Temp\*" -Force -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue 
```

### Empty/Reset System Recycle Bin
```powershell
Get-ChildItem -LiteralPath 'C:\$Recycle.Bin\' -Force | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
```

Show contents of Recycle Bin
```powershell
Get-ChildItem -LiteralPath 'C:\$Recycle.Bin\' -Force | gci -Force
```

### Remove Windows Updates Download Cache
```powershell
Remove-Item -Path "$env:SystemRoot\SoftwareDistribution\Download" -Recurse -Force
```

## Other useful commands...
```powershell
Get-Volume -DriveLetter C 
```

```powershell
Get-WmiObject -Class Win32_LogicalDisk
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

### List all files
- `dir/a` list hidden folders
- `dir /a:d` list all directories
- `dir /a:h` list all hidden files

list all files and folders
```batch
dir /a:hd
```

```powershell
Function ls-alt {Invoke-Expression "gci $Args -Force" | sort LastWriteTime -Descending}
```