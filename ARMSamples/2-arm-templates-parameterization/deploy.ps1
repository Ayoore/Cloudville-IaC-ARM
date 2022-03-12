$rg = 'arm-demo-02-01'
#Check if Resource Group Exists. If not create it.
$rgCheck = get-AzResourceGroup -Name $rg -ErrorAction SilentlyContinue
if ($null -eq $rgCheck) {
    New-AzResourceGroup -Name $rg -Location AustraliaEast -Force
}

# Generate a random number and add it to resource group name to generate a unique name for deployment.
$timestamp = Get-Date -UFormat "%s"
$deployName = "$rg" + "-" + "$timestamp"

# Invoke ARM Template Deployment. Note: Template File will be requested
New-AzResourceGroupDeployment `
    -Name $deployName `
    -ResourceGroupName $rg


# New-AzResourceGroupDeployment -name deployment1 -ResourceGroupName rg-1 -templateFile 06-variables.json -storageAccountName "cvdemosa020601" -storageAccountSKU "Standard_LRS"