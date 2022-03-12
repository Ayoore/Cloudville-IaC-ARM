$rg = 'arm-demo-03-03'
#Check if Resource Group Exists. If not create it.
$rgCheck = get-AzResourceGroup -Name $rg -ErrorAction SilentlyContinue
if ($null -eq $rgCheck) {
    New-AzResourceGroup -Name $rg -Location AustraliaEast -Force
}

# Generate a random number and add it to resource group name to generate a unique name for deployment.
$timestamp = Get-Date -UFormat "%s"
$deployName = "$rg" + "-" + "$timestamp"

# Invoke ARM Template Deployment.
New-AzResourceGroupDeployment `
    -Name $deployName `
    -ResourceGroupName $rg `
    -TemplateFile '.\03-storage.json' `
    -TemplateParameterFile '.\03-storage.parameters-prod.json'

    #-TemplateParameterFile '.\03-storage.parameters-dev.json'

<#
New-AzResourceGroupDeployment `
    -Name "deployment-03cv" `
    -ResourceGroupName 'arm-demo-03-03' `
    -TemplateFile '.\03-storage.json' `
    -TemplateParameterFile '.\03-storage.parameters-dev.json'



#>
    