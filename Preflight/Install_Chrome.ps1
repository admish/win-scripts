#Requires -version 5

$Path = "$env:TEMP\"
$Installer = "\chrome_installer.exe"
$URI = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"

$wc = New-Object System.Net.WebClient; $wc.DownloadFile("$URI", "$Path$Installer")
Start-Process -FilePath $Path$Installer -Args "/silent /install" -Verb RunAs -Wait
Remove-Item $Path$Installer