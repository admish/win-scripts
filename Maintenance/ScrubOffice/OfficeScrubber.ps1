## Downloads and runs script that will fully clean any & all traces of installed versions of Office

## Original source:
# https://officedev.github.io/
# https://github.com/OfficeDev/Office-IT-Pro-Deployment-Scripts/

## Alternate mirrors
# https://web.archive.org/web/20251209063426/https://github.com/OfficeDev/Office-IT-Pro-Deployment-Scripts/
# https://github.com/abbodi1406/BatUtil/tree/master/OfficeScrubber
# https://github.com/abbodi1406/WHD/blob/master/scripts/OfficeScrubber_14.zip


$workPath = "$env:TEMP"
$downFile = "\OfficeScrubber.zip"
$sourceURI = "https://github.com/admish/win-scripts/blob/main/Maintenance/ScrubOffice/OfficeScrubber.zip"

$wc = New-Object System.Net.WebClient; $wc.DownloadFile("$sourceURI", "$workPath$downFile")

Expand-Archive -Path $workPath$downFile -DestinationPath "$workPath\ScrubOffice" -Force

cmd /c "$workPath\ScrubOffice\OfficeScrubber.cmd /A"