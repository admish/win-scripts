#Requires -version 5

## Download and install online version of MS Office 365 Business Retail

$Destination = "C:\Windows\Temp\OfficeSetup.exe"
$Source = "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=O365BusinessRetail&platform=x64&language=en-us&version=O16GA"

Write-Output "Installing MS Office 365 Business Retail..."
$wc = New-Object System.Net.WebClient; $wc.DownloadFile("$Source", "$Destination")
Start-Process -FilePath $Destination -Wait -NoNewWindow -ErrorAction Stop
Write-Output "MS Office 365 Business Retail installation completed."
#Wait-Process -Name OfficeSetup, OfficeClickToRun

Remove-Item $Destination -Force -ErrorAction Stop

