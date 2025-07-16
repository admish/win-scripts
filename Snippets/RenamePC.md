
```powershell
WMIC ComputerSystem where Name="COMPUTER-NAME" call Rename Name=NewName

# rename the computer and restart.
"Rename-Computer -NewName NEWNAME -restart" 
# Rename the machine dynamically based off it's serial number.
"Rename-Computer -NewName (gwmi win32_bios).SerialNumber -restart" 

######
## Get-WMIObject is depricated, use Get-CimInstance. gwmi doesn't work in PS7

$(gwmi win32_computersystem).Rename("Bldg-SerialNum")

(gwmi win32_bios).SerialNumber
Get-WMIObject win32_bios
Get-CimInstance win32_bios

## get external monitor serial number
[System.Text.Encoding]::ASCII.GetString($(Get-CimInstance WmiMonitorID -Namespace root\wmi)[1].SerialNumberID -notmatch 0)

```
