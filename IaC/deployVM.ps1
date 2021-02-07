Connect-AzAccount
$tempalteFile = "C:\Users\eirik\OneDrive - NTNU\Bachelor21\Main\hyper-V\Azure\VM\template.json"
$parameterFile = "C:\Users\eirik\OneDrive - NTNU\Bachelor21\Main\hyper-V\Azure\VM\parameters.json"
$adminPassword = Read-Host -Prompt "Enter admin password" -AsSecureString
New-AzResourceGroup `
    -Name automateDeployment `
    -Location "North Europe"
New-AzResourceGroupDeployment `
    -Name devenvironment `
    -ResourceGroupName automateDeployment `
    -TemplateFile $tempalteFile `
    -TemplateParameterFile $parameterFile `
    -adminPassword $adminPassword