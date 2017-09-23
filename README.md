# PS-VirtBoxMan
PowerShell useful functions around VirtualBoxManage command-line tool

### Quick Tour
```
PS> Get-VBoxHostOnlyIf | where IPAddress -eq "192.168.56.1" | select Name, GUID

Name                                  GUID                                
----                                  ----                                
VirtualBox Host-Only Ethernet Adapter 7fb57b86-f6d3-413c-8ab8-f8143ae6c451
```

```
PS> Get-VBoxVm | select Name, Nic1, Nic2

name                    nic1    nic2
----                    ----    ----
Android x86 Marshmallow bridged none
Android Marshmallow     nat     none
```

__vboxmanage.exe__ needs to be accesible through _PATH_