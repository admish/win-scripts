Remove BS ad-browser Shift. (shift.com)

```msshell
taskkill /f /im shift.exe
rd /s /q "C:\Users\%USERNAME%\AppData\Local\Shift\"
del "C:\Windows\System32\Tasks\ShiftLaunchTask"
```
