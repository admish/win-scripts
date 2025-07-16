Remove the "Some settings are managed by your organization" message that prevents some changes

```powershell
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies" /f
reg delete "HKCU\Software\Microsoft\WindowsSelfHost" /f
reg delete "HKCU\Software\Policies" /f
reg delete "HKLM\Software\Microsoft\Policies" /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies" /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /f
reg delete "HKLM\Software\Microsoft\WindowsSelfHost" /f
reg delete "HKLM\Software\Policies" /f
reg delete "HKLM\Software\WOW6432Node\Microsoft\Policies" /f
reg delete "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Policies" /f
reg delete "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /f

# Reboot system
shutdown /r /f /t 0
```

[Source](https://answers.microsoft.com/en-us/windows/forum/windows_10-other_settings/some-of-these-settings-are-hidden-or-managed-by/0f43eb7c-b01b-4615-8cf7-db047ac044aa)