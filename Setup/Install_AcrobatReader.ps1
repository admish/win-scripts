#Requires -version 5

## Scrape Adobe's release notes for the latest Windows release
$ReleaseURI = curl -s https://helpx.adobe.com/acrobat/release-note/release-notes-acrobat-reader.html
$RegexSyntax = [regex]::new('<a href="(https://www\.adobe\.com/devnet-docs/acrobatetk/tools/ReleaseNotesDC/[^"]+)"[^>]*>(DC [^<]+)</a>', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
$Version = $RegexSyntax.Match($ReleaseURI).Groups[2].Value | cut -d "(" -f2 | cut -d ")" -f1 | sed 's/\.//g'

## Set local enviroment
$Path = "$env:TEMP\"
$Installer = "Acrobat_Reader.exe"
$URI = "https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/" + $Version + "/AcroRdrDCx64" + $Version + "_en_US.exe"

$wc = New-Object System.Net.WebClient; $wc.DownloadFile("$URI", "$Path$Installer")
Start-Process -FilePath $Path$Installer -Args "/sAll /rs /rps /msi /norestart /quiet EULA_ACCEPT=YES" -WorkingDirectory $Path -Wait
Remove-Item $Path$Installer



####
## The following urls are exclusively for the macOS version, which doesn't always correlate with Windows releases

# $ReaderVersion = irm "https://armmf.adobe.com/arm-manifests/mac/AcrobatDC/reader/current_version.txt" 
# $AcrobatVersion = irm "https://armmf.adobe.com/arm-manifests/mac/AcrobatDC/acrobat/current_version.txt" 
