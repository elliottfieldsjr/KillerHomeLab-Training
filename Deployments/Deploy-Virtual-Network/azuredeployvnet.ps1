$ResourceGroupName = Read-Host 'Enter Resource Group Name'
$Location = Read-Host 'Enter Location'
New-AzResourceGroup -ResourceGroupName $ResourceGroupName -Location $Location

# Parent Deployment
New-AzResourceGroupDeployment -Name 'Deploy-VNet' -ResourceGroupName $ResourceGroupName -TemplateUri 'https://raw.githubusercontent.com/elliottfieldsjr/KillerHomeLab-Training/main/Deployments/Deploy-Virtual-Network/azuredeployvnet.json'

# Direct Deployment
New-AzResourceGroupDeployment -Name 'Deploy-VNet' -ResourceGroupName $ResourceGroupName -TemplateUri 'https://raw.githubusercontent.com/elliottfieldsjr/KillerHomeLab-Training/main/Deployments/Deploy-Virtual-Network/linkedtemplates/vnet.json'

# Using Parameter Object
$parameters = @{
    vnetName = 'KHL-VNet3'
    vnetPrefix = '10.3.0.0/16'
    subnet1Name = 'KHL-VNet3-Subnet1'
    subnet1Prefix = '10.3.1.0/24'
    location = 'usgovtexas'
}
 
New-AzResourceGroupDeployment -Name 'Deploy-VNet' -ResourceGroupName $ResourceGroupName -TemplateUri 'https://raw.githubusercontent.com/elliottfieldsjr/KillerHomeLab-Training/main/Deployments/Deploy-Virtual-Network/linkedtemplates/vnet.json' -TemplateParameterObject $parameters