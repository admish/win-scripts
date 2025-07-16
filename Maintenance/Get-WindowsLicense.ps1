#Requires -version 5.1

### Get Windows License Information
### Any of these commands can be used to retrieve the Windows product key.

wmic path softwarelicensingservice get OA3xOriginalProductKey


(Get-WmiObject -query 'select * from SoftwareLicensingService').OA3xOriginalProductKey


Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform' -Name BackupProductKeyDefault | Select-Object -property BackupProductKeyDefault



### The product key is also stored as binary in the registry under the following path:
$regPath = 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\DefaultProductKey'