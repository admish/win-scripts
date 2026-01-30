#Requires -version 5.1
#Requires -RunAsAdministrator

## Documentation to locate most recent version: https://www.dell.com/support/kbdoc/en-us/000177325/dell-command-update

$DCU = "https://dl.dell.com/FOLDER13922692M/1/Dell-Command-Update-Windows-Universal-Application_2WT0J_WIN64_5.6.0_A00.EXE"

$dPath = "$env:TEMP\"
$Installer = "Dell-Command-Update_5.6.0_A00.exe"

$wc = New-Object System.Net.WebClient; $wc.DownloadFile("$DCU", "$dPath$Installer")
Start-Process -FilePath $dPath$Installer -ArgumentList '/s' -Wait -NoNewWindow -ErrorAction Stop
