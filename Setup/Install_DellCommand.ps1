#Requires -version 5.1
#Requires -RunAsAdministrator

## KB Doc: https://www.dell.com/support/kbdoc/en-us/000177325/dell-command-update

## Source: https://www.dell.com/support/home/en-us/drivers/driversdetails?driverid=p83k5
$DCU530 = "https://downloads.dell.com/FOLDER11563484M/1/Dell-Command-Update-Windows-Universal-Application_P83K5_WIN_5.3.0_A00.EXE"
## Source: https://www.dell.com/support/home/en-us/drivers/driversdetails?driverid=9m35m
$DCU540 = "https://dl.dell.com/FOLDER11914128M/1/Dell-Command-Update-Windows-Universal-Application_9M35M_WIN_5.4.0_A00.EXE"
## Source: https://www.dell.com/support/home/en-us/drivers/driversdetails?driverid=c8jxv
$DCU550 = "https://dl.dell.com/FOLDER13309588M/2/Dell-Command-Update-Windows-Universal-Application_C8JXV_WIN64_5.5.0_A00_01.EXE"


$dPath = "$env:SystemDrive\Support\"
$Installer = "\Dell-Command-Update_5.5.0.exe"
if(!(Test-Path -PathType Container $dPath))
{
      New-Item -ItemType Directory -Path $dPath
}

$wc = New-Object System.Net.WebClient; $wc.DownloadFile("$DCU550", "$dPath$Installer")
Start-Process -FilePath $dPath$Installer -ArgumentList '/s' -Wait -NoNewWindow -ErrorAction Stop
