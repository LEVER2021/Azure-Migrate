#installerer Hyper-v og restarter host
Install-WindowsFeature -Name Hyper-V -IncludeManagementTools -Restart

#nettverksadapter som virtuelle maskiner skal bruke
New-VmSwitch -Name "InternalNat" -SwitchType Internal

#kommando for å se interfaceIndex (som skal brukes senere)
Get-NetAdapter

#IP for NAT-gateway
New-NetIPAddress -IPAddress 192.168.0.1 -PrefixLength 24 -InterfaceIndex "index hentet fra 'Get-NetAdapter"

#Oppsett av virtuell switch for gi den gateway
New-NetNat -Name "InternalNat" -InternalIPInterfaceAddressPrefix 192.168.0.0/24
