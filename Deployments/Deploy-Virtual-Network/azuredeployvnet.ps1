$ResourceGroupName = Read-Host 'Enter Resource Group Name'
$Location = Read-Host 'Enter Location'
New-AzResourceGroup -ResourceGroupName $ResourceGroupName -Location $Location
New-AzResourceGroupDeployment -Name 'Deploy-VNet' -ResourceGroupName $ResourceGroupName -TemplateUri 'https://raw.githubusercontent.com/elliottfieldsjr/KillerHomeLab-Training/main/Deployments/Deploy-Virtual-Network/azuredeployvnet.json'