The following block, for Elevated Permissions

```powershell
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$currentUserPrincipal = new-object System.Security.Principal.WindowsPrincipal($currentUser)
if (! $currentUserPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator))
{
    $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
    $newProcess.Arguments = $myInvocation.MyCommand.Definition;
    $newProcess.Verb = "runas";
    [System.Diagnostics.Process]::Start($newProcess);
    exit;
}
```