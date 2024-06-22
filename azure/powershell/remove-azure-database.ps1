$SubscriptionId = '39ff3502-0a96-4f31-9d65-093ab484da57'
# Set the resource group name and location for your server
$resourceGroupName = "SpartaTestDatabase-22-Aug-2020"
Remove-AzResourceGroup -ResourceGroupName $resourceGroupName -Force