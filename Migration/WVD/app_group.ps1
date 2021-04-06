New-RdsAppGroup LeverWVDtenant Hoost-Pool-Tenant-01 App-Group01 -ResourceType "RemoteApp"
New-RdsRemoteApp LeverWVDtenant Hoost-Pool-Tenant-01 App-Group01 -Name paint -AppAlias paint
Add-RdsAppGroupUser -TenantName LeverWVDtenant -HostPoolName `
 Hoost-Pool-Tenant-01 -AppGroupName "App-Group01" -UserPrincipalName wvduser4@lever21.online