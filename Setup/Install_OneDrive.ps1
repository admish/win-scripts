#Requires -version 5

## https://learn.microsoft.com/en-us/sharepoint/per-machine-installation

$Path = "$env:TEMP\"
$Installer = "OneDriveSetup.exe"
# https://oneclient.sfx.ms/Win/Prod/22.131.0619.0001/amd64/OneDriveSetup.exe
# https://oneclient.sfx.ms/Win/Installers/25.070.0413.0001/amd64/OneDriveSetup.exe
$URI = "https://go.microsoft.com/fwlink/?linkid=844652"

$wc = New-Object System.Net.WebClient; $wc.DownloadFile("$URI", "$Path$Installer")
Start-Process -FilePath $Path$Installer -Args "/silent /allusers" -WorkingDirectory $Path -Wait

### Uninstall OneDrive if it exists
# Start-Process -FilePath $Path$Installer -Args "/uninstall /allusers" -WorkingDirectory $Path -Wait
Remove-Item $Path$Installer