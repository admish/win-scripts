<#
.DESCRIPTION
    Forced removal of Huntress to repair a corrupted install.

    Reference:    
    https://github.com/huntresslabs/deployment-scripts/blob/main/Powershell/README.md
#>

## Download official script from Huntress' GitHub
$Source = "https://raw.githubusercontent.com/huntresslabs/deployment-scripts/refs/heads/main/Powershell/InstallHuntress.powershellv2.ps1"
$Destination = "C:\Windows\Temp\InstallHuntress.powershellv2.ps1"
$wc = New-Object System.Net.WebClient; $wc.DownloadFile("$Source", "$Destination")

## Execute script with uninstall flag.
powershell -ExecutionPolicy Bypass -f $Destination -uninstall

<#
### To Do:

Two entries in these registry folder that also need to be removed.

HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\

#>
