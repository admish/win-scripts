## Turn on System Restore points 
This command will only work in Windows Recovery Environment. It will not work, when you're on Desktop and using administrative Command Prompt. The command will just open System Restore, which can also be directly opened, when you execute `rstrui.exe` command.
```msshell
rstrui.exe /offline:C:\windows=active
```

### .....but in PowerShell
```powershell
Enable-ComputerRestore -Drive "C:\"
```
