#Requires -version 5.1

$Path = "$env:TEMP\"
$Installer = "\Dell-Command-Update_5.5.0.exe"
## Source: https://www.dell.com/support/kbdoc/en-us/000177325/dell-command-update
$URI = "https://dl.dell.com/FOLDER13309338M/1/Dell-Command-Update-Application_Y5VJV_WIN64_5.5.0_A00.EXE"

$wc = New-Object System.Net.WebClient; $wc.DownloadFile("$URI", "$Path$Installer")
Start-Process -FilePath $Path$Installer -ArgumentList '/s' -Wait -NoNewWindow -ErrorAction Stop
