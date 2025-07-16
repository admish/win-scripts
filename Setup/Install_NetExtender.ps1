#Requires -version 5

## Download and install NetExtender for Windows (64 bit)
## https://www.sonicwall.com/products/remote-access/vpn-clients
$Source = "https://software.sonicwall.com/NetExtender/NetExtender-x64-10.3.2.msi"
$Destination = "C:\Windows\Temp\NetExtender-x64-10.3.2.msi"

Write-Output "Installing NetExtender for Windows (64 bit)..."
$wc = New-Object System.Net.WebClient; $wc.DownloadFile("$Source", "$Destination")
msiexec /i $Destination /qn /norestart
Write-Output "Installion Complete."