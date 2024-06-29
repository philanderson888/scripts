printHeading "query vm $vm_01_name"
echo resource group name $resource_group_name
subscription=$(az account show --query "id" -o tsv)
vm_id="/subscriptions/$subscription/resourceGroups/VMResources/providers/Microsoft.Compute/virtualMachines/$vm_01_name"
echo vm id is $vm_id
machine_id=$(az vm show --resource-group $resource_group_name --name $vm_01_name --query vmId -o tsv)
echo machine id $machine_id
user_name=$(az vm show --resource-group $resource_group_name --name $vm_01_name --query osProfile.adminUsername -o tsv)
echo user name $user_name
computer_name=$(az vm show --resource-group $resource_group_name --name $vm_01_name --query osProfile.computerName -o tsv)
echo computer name $computer_name
vm_id_hash=$(az vm show -d --resource-group $resource_group_name --name $vm_01_name --query "vmId" -o tsv)    
echo vm id hash ... $vm_id_hash
vm_size=$(az vm show -d --resource-group $resource_group_name --name $vm_01_name --query "hardwareProfile.vmSize" -o tsv)
echo vm size ... $vm_size
vm_fqdn=$(az vm show -d --resource-group $resource_group_name --name $vm_01_name --query "fqdns" -o tsv)
if [ ! -z "$vm_fqdn" ] 
then
    echo vm fqdn is $vm_fqdn
fi
network_id=$(az vm show --resource-group $resource_group_name --name $vm_01_name --query 'networkProfile.networkInterfaces[].id' -o tsv)
echo vm network id is $network_id
network_card_name=$(az network nic show --ids $network_id --query "name" -o tsv)
echo network card name $network_card_name
public_ip_address=$(az vm show -d --resource-group $resource_group_name --name $vm_01_name --query publicIps -o tsv)
echo vm public ip is $public_ip_address
vm_private_ip=$(az vm show -d --resource-group $resource_group_name --name $vm_01_name --query privateIps -o tsv)        
echo vm private ip is $vm_private_ip
network_card_mac_address=$(az network nic show --ids $network_id --query macAddress -o tsv)
echo network card mac address $network_card_mac_address
network_card_location=$(az network nic show --ids $network_id --query location -o tsv)
resource_group_name=$(az network nic show --ids $network_id --query resourceGroup -o tsv)
resource_group_id=$(az network nic show --ids $network_id --query resourceGuid -o tsv)
echo resource group name $resource_group_name
echo resource group location $network_card_location
echo resource group id $resource_group_id
vm_queried=true
