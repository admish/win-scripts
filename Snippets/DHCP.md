## DhcpServerv4Scope
Run this command on the DHCP server to poll the active scope of IPs DHCP can assign
```powershell
Get-DhcpServerv4Scope
```

### Output
```
ScopeId         SubnetMask      Name           State    StartRange      EndRange        LeaseDuration
-------         ----------      ----           -----    ----------      --------        -------------
192.168.1.0     255.255.255.0   HOME            Active   192.168.1.1     192.168.1.255   08:00:0
```

### DhcpServerv4Scope Attributes
Other examples referenced online have these attributes, but they do not work unless remote powershell has been enabled
```powershell
Get-DhcpServerv4Scope -ComputerName "SVR-vDC1"
Get-DhcpServerv4Scope -ComputerName "192.168.1.100"
Get-DhcpServerv4Scope -ComputerName "SVR-vDC1.home.local"
Get-DhcpServerv4Scope -ComputerName "SVR-vDC1.home.local" -ScopeID 192.168.1.100
```