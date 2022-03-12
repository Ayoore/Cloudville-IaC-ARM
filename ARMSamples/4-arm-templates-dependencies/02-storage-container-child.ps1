$rg = 'arm-demo-04-02'
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
    -TemplateFile '.\02-storage-container-child.json'