#Requires -version 999.9
exit 0
<#
THIS IS NOT A SCRIPT.
Very generic troubleshooting steps that should be done before getting heavily invested into unknown problems.

Basic troubleshooting steps in the order that is best they be completed, which includes
several system reboots that would be overly complicated to be done PowerShell, if possible at all.

Use only as a guide, by copy and pasting each line in order on the problematic system.
#>

## Delete the Recycle Bin on the system drive, forcing it to empty for all users; and reset itself
rd /s /q %SystemDrive%\$Recycle.bin

## Use with NTFS only. 
## Bypass all online repair. Any defects found are queued for offline repair
chkdsk C: /scan /forceofflinefix

## Reboot system so chkdsk can run offline repairs
shutdown /r /f /t 0

############################
### Reboot......
############################

## Use the SFC command tool to repair system problems
sfc /scannow

## "CheckHealth" simply outputs any errors that are currently outstanding and need repair
## Only run this if you're curious.....
dism /Online /Cleanup-Image /CheckHealth

## The "ScanHealth" option runs a full scan to find out whether the image has any issues.
dism /Online /Cleanup-Image /ScanHealth

## The "RestoreHealth" option automatically repairs issues the scan has uncovered
dism /Online /Cleanup-Image /RestoreHealth

## Use the SFC command tool again, to repair any issues found by DISM
sfc /scannow

## Reboot to confirm we have loaded into a clean Windows image with no issues that are known/detectable/disclosed by Microsoft... 
shutdown /r /f /t 0

############################
### Reboot......
############################

## Disk Clean up Tool. Doesn't always run or complete when initiated from CLI
## Microsoft documentation on registry key numbering is virtually non-existant.
### https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/cleanmgr
cleanmgr /sagerun:1 /VeryLowDisk /AUTOCLEAN | Out-Null


