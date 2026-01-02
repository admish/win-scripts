#Requires -version 5

$Path = "$env:TEMP\"
$Installer = "\7z2501-x64.exe"
$URI = "https://www.7-zip.org/a/7z2501-x64.exe"

$wc = New-Object System.Net.WebClient; $wc.DownloadFile("$URI", "$Path$Installer")
Start-Process -FilePath $Path$Installer -Args "/S" -Verb RunAs -Wait
Remove-Item $Path$Installer