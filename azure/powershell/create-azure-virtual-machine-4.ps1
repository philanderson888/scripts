#Connect-AzAccount
#$SubscriptionId = '39ff3502-0a96-4f31-9d65-093ab484da57'
# Set subscription 
# az account set --subscription $SubscriptionId
# Set-AzContext -SubscriptionId $SubscriptionId

$location = "UKSouth"
$resourceGroupName = "server2019-built-23-aug-2020"
$resourceGroup = New-AzResourceGroup -Name $resourceGroupName -Location $location
$VMSize = "Standard_D8s_v3"
New-AzVm `
    -ResourceGroupName $ResourceGroupName `
    -Name "server2019" `
    -Location $location `
    -OpenPorts 80,3389 `
    -Size $VMSize