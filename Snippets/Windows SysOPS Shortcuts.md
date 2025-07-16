| Application                                      | Command                                                                   |
| ------------------------------------------------ | ------------------------------------------------------------------------- |
| Authorization Manager                            | `azman.msc`                                                               |
| Certificates - Current User                      | `certmgr.msc`                                                             |
| Certificates - Local Computer                    | `certlm.msc`                                                              |
| Command Prompt                                   | `cmd.exe`                                                                 |
| Component Services                               | `comexp.msc`                                                              |
| Computer Management                              | `compmgmt.msc`                                                            |
| Device Manager                                   | `devmgmt.msc`                                                             |
|                                                  | `DevModeRunAsUserConfig.msc`                                              |
| DirectX Info and Diagnostic                      | `dxdiag.exe`                                                              |
| Disk Cleanup                                     | `cleanmgr.exe`                                                            |
| Disk Defragmenter                                | `dfrgui.exe`                                                              |
| Disk Management                                  | `diskmgmt.msc`                                                            |
| Event Viewer                                     | `eventvwr.msc`                                                            |
| Local Group Policy Editor                        | `gpedit.msc`                                                              |
| Local Security Policy                            | `secpol.msc`                                                              |
| Local Users and Groups                           | `lusrmgr.msc`                                                             |
| Malicious Software Removal Tool                  | `MRT.exe`                                                                 |
| Memory Diagnostics Tool                          | `MdSched.exe`                                                             |
| On Screen Keyboard                               | `osk.exe`                                                                 |
| Performance Monitor                              | `perfmon.msc /s`                                                          |
| RecoveryDrive                                    | `RecoveryDrive.exe`                                                       |
| Registry Editor                                  | `C:\Windows\regedit.exe`                                                  |
| Resource Monitor                                 | `resmon.exe /res`                                                         |
| Resultant Set of Policy                          | `rsop.msc`                                                                |
| Security Center                                  | `wscui.cpl`                                                               |
| Security Configuration Management                | `secpol.msc /s`                                                           |
| Services                                         | `services.msc`                                                            |
| Shared Folders                                   | `fsmgmt.msc`                                                              |
| System Configuration                             | `msconfig.exe`                                                            |
| System Information                               | `msinfo32.exe`                                                            |
| System Information                               | `C:\Program Files\Common Files\microsoft shared\MSInfo\msinfo32.exe`      |
| System Properties                                | `sysdm.cpl`                                                               |
| System Restore                                   | `rstrui.exe`                                                              |
| Task Manager                                     | `taskmgr.exe /7`                                                          |
| Task Scheduler                                   | `taskschd.msc /s`                                                         |
| TPM Management                                   | `tpm.msc`                                                                 |
| Windows Backup and Restore                       | `sdclt.exe`                                                               |
| Windows Defender Firewall with Advanced Security | `WF.msc`                                                                  |
| Windows Explorer                                 | `C:\Windows\explorer.exe`                                                 |
| Add-Remove Windows Components                    | `OptionalFeatures.exe`                                                    |
| Windows Features                                 | `%windir%\System32\rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl,,2` |
| Windows Management Instrumentation (WMI)         | `WmiMgmt.msc`                                                             |
| Control Panel ('God Mode')                       | `shell:::{ED7BA470-8E54-465E-825C-99712043E01C}`                          |
| ODBC Data Sources (32-bit)                       | `C:\Windows\syswow64\odbcad32.exe`                                        |
| ODBC Data Sources (64-bit)                       | `C:\Windows\System32\odbcad32.exe`                                        |
Default path is `C:\Windows\System32\` unless specified

## Control Panel

|                                     |                                                                           |
| ----------------------------------- | ------------------------------------------------------------------------- |
| Control Panel                       | `%WinDir%\System32\control.exe`                                           |
| Administrative Tools                | `control.exe /name Microsoft.AdministrativeTools`                         |
| Date and Time                       | `%WinDir%\System32\timedate.cpl`                                          |
| Region                              | `%WinDir%\System32\intl.cpl`                                              |
| Network Connections                 | `control.exe netconnections`                                              |
| Internet Options                    | `%WinDir%\System32\inetcpl.cpl`                                           |
| Console Root                        | `%WinDir%\System32\mmc.exe`                                               |
| Computer Management                 | `%WinDir%\System32\compmgmt.msc`                                          |
| Device Manager                      | `%WinDir%\System32\devmgmt.msc`                                           |
| Disk Management                     | `%WinDir%\System32\diskmgmt.msc`                                          |
| Event Viewer                        | `%WinDir%\System32\eventvwr.msc`                                          |
| Windows Firewall                    | `control.exe /name Microsoft.WindowsFirewall`                             |
| Windows Firewall Customize Settings | `control.exe /name Microsoft.WindowsFirewall /PAGE PageConfigureSettings` |
| Windows Defender                    | `control.exe /name Microsoft.WindowsDefender`                             |
| User Account Control                | `%WinDir%\System32\UserAccountControlSettings.exe`                        |
| Setting automatic login             | `control.exe userpasswords2`                                              |
| Windows Update                      | `control.exe /Name Microsoft.WindowsUpdate /page pageSettings`            |
| Swap file                           | `SystemPropertiesPerformance.exe /pagefile`                               |
| Programs and Features               | `control.exe appwiz.cpl`                                                  |
| System Restore                      | `control.exe /name Microsoft.Recovery`                                    |
| Switching monitors                  | `%WinDir%\System32\DisplaySwitch.exe`                                     |
| DirectX Diagnostic Tool             | `%WinDir%\System32\dxdiag.exe`                                            |
| Registry Editor                     | `%WinDir%\System32\regedt32.exe`                                          |
| Add-Remove Windows Components       | `%WinDir%\System32\OptionalFeatures.exe`                                  |
|                                     |                                                                           |


| Application                   | Command                                          |
| ----------------------------- | ------------------------------------------------ |
| Check Disk                    | `chkdsk.exe`                                     |
| DISM                          | `dism.exe /Online /Cleanup-Image /RestoreHealth` |
| Flush DNS Cache               | `ipconfig.exe /flushdns`                         |
| Network Information           | `ipconfig.exe /all`                              |
| TCP-IP Netstat Command        | `netstat -a -b`                                  |
| Reset windows sockets catalog | `netsh winsock reset catalog`                    |
| Sysinternals Live             | `\\live.sysinternals.com\tools`                  |
| System File Checker           | `sfc.exe /scannow`                               |
| Remote Desktop Connection     | `%WinDir%\System32\mstsc.exe`                    |





|                                       |                                                  |
| ------------------------------------- | ------------------------------------------------ |
| God Mode                              | `shell:::{ED7BA470-8E54-465E-825C-99712043E01C}` |
| Fonts                                 | `shell:::{93412589-74D4-4E4E-AD0E-E0CB621440FD}` |
| Taskbar and Navigation                | `shell:::{0DF44EAA-FF21-4412-828E-260A8728E7F1}` |
| Date and Time                         | `shell:::{E2E7934B-DCE5-43C4-9576-7FE4F75E7480}` |
| Location Settings                     | `shell:::{E9950154-C418-419e-A90A-20C5287AE24B}` |
| Region                                | `shell:::{62D8ED13-C9D0-4CE8-A914-47DD628FB1B0}` |
| Speech Recognition                    | `shell:::{58E3C745-D971-4081-9034-86E34B30836A}` |
| Ease of Access Center                 | `shell:::{D555645E-D4F8-4c29-A827-D93C859C4F2A}` |
| AutoPlay                              | `shell:::{9C60DE1E-E5FC-40f4-A487-460851A8D915}` |
| Device Manager                        | `shell:::{74246bfc-4c96-11d0-abef-0020af6b0b7a}` |
| Devices and Printers                  | `shell:::{A8A91A66-3A7D-4424-8D24-04E180695C7A}` |
| Infrared                              | `shell:::{A0275511-0E86-4ECA-97C2-ECD8F1221D08}` |
| Internet Options                      | `shell:::{A3DD4F92-658A-410F-84FD-6FBBBEF2FFFE}` |
| Power Options                         | `shell:::{025A5937-A6BE-4686-A844-36FE4BEC8B6D}` |
| Sound                                 | `shell:::{F2DDFC82-8F12-4CDD-B7DC-D4FE1425AA4D}` |
| Windows To Go                         | `shell:::{8E0C279D-0BD1-43C3-9EBD-31C3DC5B8A77}` |
| HomeGroup                             | `shell:::{67CA7650-96E6-4FDD-BB43-A8E774F73A57}` |
| Mouse                                 | `shell:::{6C8EEC18-8D75-41B2-A177-8831D59D2D50}` |
| Network and Sharing Center            | `shell:::{8E908FC9-BECC-40f6-915B-F4CA0E70D03D}` |
| Network Connections                   | `shell:::{7007ACC7-3202-11D1-AAD2-00805FC1270E}` |
| Administrative Tools                  | `shell:::{D20EA4E1-3957-11d2-A40B-0C5020524153}` |
| BitLocker Drive Encryption            | `shell:::{D9EF8727-CAC2-4e60-809E-86F80A666C91}` |
| File History                          | `shell:::{F6B6E965-E9B2-444B-9286-10C9152EDBC5}` |
| RemoteApp and <br>Desktop Connections | `shell:::{241D7C96-F8BF-4F85-B01F-E2B043341A4B}` |
| Storage Spaces                        | `shell:::{F942C606-0914-47AB-BE56-1321B8035096}` |
| System                                | `shell:::{BB06C0E4-D293-4f75-8A90-CB05B6477EEE}` |
| Troubleshooting                       | `shell:::{C58C4893-3BE0-4B45-ABB5-A63E4B8C8651}` |
| Windows Firewall                      | `shell:::{4026492F-2F69-46B8-B9BF-5654FC07E423}` |
| Work Folders                          | `shell:::{ECDB0924-4208-451E-8EE0-373C0956DE16}` |
| Default Programs                      | `shell:::{17cd9488-1228-4b2f-88ce-4298e93e0966}` |
| Programs and Features                 | `shell:::{7b81be6a-ce2b-4676-a29e-eb907a5126c5}` |
|                                       |                                                  |
