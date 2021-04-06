#Innlogging Azure
Add-RdsAccount -DeploymentUrl "https://rdbroker.wvd.microsoft.com"
#Lager en ny tenant dedikert til WVD
New-RdsTenant -Name LeverWVDtenant -AadTenantId ***************** -AzureSubscriptionId *******************
#Gir brukeren lever_domeneadministrator eier-rolle for tenant
New-RdsRoleAssignment -RoleDefinitionName "RDS Owner" -UserPrincipalName `
lever_domeneadministrator@lever21.online -TenantGroupName "Default Tenant Group" -TenantName LeverWVDtenant
