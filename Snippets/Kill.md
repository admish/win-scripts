## Force Kill
To suppress any error messages, append `2> nul` to the command:
```msshell
taskkill /f /im chrome.exe 2> nul
```

To reset the exit code (ErrorLevel), write `ver> nul` into the next line 
(this works because ver is a command that never fails and resets the ErrorLevel value):
```msshell
taskkill /f /im chrome.exe
ver > nul

:: Or as a single line:
taskkill /f /im chrome.exe & ver > nul
```

Can also combine everything as such:
```msshell
taskkill /f /im chrome.exe 2> nul & ver > nul
```

## PowerShell Equivilant
```powershell
Get-Process Chrome -ErrorAction SilentlyContinue | Stop-Process -Force
## or
Stop-Process Chrome -Force -ErrorAction SilentlyContinue
```
