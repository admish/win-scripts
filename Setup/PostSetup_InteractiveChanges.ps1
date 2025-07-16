#Requires -version 5.1

### Response Variables
$No = @("no","nah","nope","n","false")
$Yes = @("yes","yup","yeah","y","ok","sure","true")

### Change the local user password
do { $Answ = read-host "Change or set password now? (yes/no)"
}
until($Yes -contains $Answ -or $No -contains $Answ)

if($Yes -contains $Answ) {
    $SetPass = Read-Host 'What is the new password?' -AsSecureString
    net user $env:UserName $SetPass
}
elseif($No -contains $Answ) {
     Write-Output "No password change requested, continuing..."
}

### Change the PC System Name
do { Write-Output "This system is currently named: $env:COMPUTERNAME"
     $Answ = read-host "Do you wish to change the PC System Name now? (yes/no)"
}
until($Yes -contains $Answ -or $No -contains $Answ)

if($Yes -contains $Answ) {
    $PCName = Read-Host 'What is the new System Name?'
    Rename-Computer -NewName $PCName #-Restart
}
elseif($No -contains $Answ) {
     Write-Output "No name change requested, continuing..."
}

### Restart the computer to apply all changes
do { $Answ = read-host "Would you like to reboot the computer now? (yes/no)"
}
until($Yes -contains $Answ -or $No -contains $Answ)

if($Yes -contains $Answ) {
    shutdown /r /f /t 0
}
elseif($No -contains $Answ) {
     Write-Output "Don't forget to restart the computer at some point, so that all changes can take effect."
}