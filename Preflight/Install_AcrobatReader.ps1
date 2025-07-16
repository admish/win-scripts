#Requires -version 5

$Path = "$env:TEMP\"
$Installer = "Acrobat_Reader.exe"
$URI = "https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/2500120566/AcroRdrDCx642500120566_en_US.exe"

<# --- Latest version for macOS can be pulled with either of the first two commands below, but this doesn't always correlate with 
       the latest Windows version. Retaining this block until I have a more reliable method for using the latest Windows version.
$ReaderVersion = irm "https://armmf.adobe.com/arm-manifests/mac/AcrobatDC/reader/current_version.txt" 
#$AcrobatVersion = irm "https://armmf.adobe.com/arm-manifests/mac/AcrobatDC/acrobat/current_version.txt" 
$VerURI = $ReaderVersion -replace '[.]', ''
$AutoURI = "https://ardownload2.adobe.com/pub/adobe/acrobat/win/AcrobatDC/" + $VerURI + "/AcroRdrDCx64" + $VerSimp + "_en_US.exe"
#>

$wc = New-Object System.Net.WebClient; $wc.DownloadFile("$URI", "$Path$Installer")
Start-Process -FilePath $Path$Installer -Args "/sAll /rs /rps /msi /norestart /quiet EULA_ACCEPT=YES" -WorkingDirectory $Path -Wait
Remove-Item $Path$Installer
