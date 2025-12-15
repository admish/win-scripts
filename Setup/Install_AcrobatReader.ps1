#Requires -version 5

## Scrape Adobe's release notes for the latest Windows release
$ReleaseURI = curl.exe -s https://www.adobe.com/devnet-docs/acrobatetk/tools/ReleaseNotesDC/index.html

## Parse $ReleaseURI to find the latest version
$ReleaseURI -match '\b\d{2}\.\d{3}\.\d{5}\b' 

## Format version to build static download URL
$Version = $matches[0] | cut -d "(" -f2 | cut -d ")" -f1 | sed 's/\.//g'
$URI = "https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/" + $Version + "/AcroRdrDCx64" + $Version + "_en_US.exe"

## Set local enviroment
$Path = "$env:TEMP\"
$Installer = "Acrobat_Reader.exe"

## Download and install latest version of Adobe Acrobat Reader
$wc = New-Object System.Net.WebClient; $wc.DownloadFile("$URI", "$Path$Installer")
Start-Process -FilePath $Path$Installer -Args "/sAll /rs /rps /msi /norestart /quiet EULA_ACCEPT=YES" -WorkingDirectory $Path -Wait
Remove-Item $Path$Installer
