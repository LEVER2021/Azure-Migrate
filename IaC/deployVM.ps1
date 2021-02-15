Connect-AzAccount
$tempalteFile = "C:\Users\eirik\OneDrive - NTNU\Bachelor21\Main\hyper-V\on-prem\hyper-V-Setup\template.json"
$parameterFile = "C:\Users\eirik\OneDrive - NTNU\Bachelor21\Main\hyper-V\on-prem\hyper-V-Setup\parameters.json"
$adminPassword = Read-Host -Prompt "Enter admin password" -AsSecureString

New-AzResourceGroupDeployment `
    -Name deploymentnavn `
    -ResourceGroupName on-premHyper-V `
    -TemplateFile $tempalteFile `
    -TemplateParameterFile $parameterFile `
    -adminPassword $adminPassword