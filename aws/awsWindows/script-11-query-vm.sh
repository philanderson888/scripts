printHeading "====                     query vm $vm_name               "
echo resource group name $resource_group_name
subscription=$(az account show --query "id" -o tsv)
vm_id="/subscriptions/$subscription/resourceGroups/VMResources/providers/Microsoft.Compute/virtualMachines/$vm_name"
echo vm id is $vm_id
machine_id=$(az vm show --resource-group $resource_group_name --name $vm_name --query vmId -o tsv)
echo machine id $machine_id
user_name=$(az vm show --resource-group $resource_group_name --name $vm_name --query osProfile.adminUsername -o tsv)
echo user name $user_name
ubuntu_computer_name=$(az vm show --resource-group $resource_group_name --name $ubuntu_vm_name --query osProfile.computerName -o tsv)
echo ubuntu computer name $ubuntu_computer_name
ubuntu_vm_id_hash=$(az vm show -d --resource-group $resource_group_name --name $ubuntu_vm_name --query "vmId" -o tsv)    
echo ubuntu vm id hash ... $ubuntu_vm_id_hash
ubuntu_vm_size=$(az vm show -d --resource-group $resource_group_name --name $ubuntu_vm_name --query "hardwareProfile.vmSize" -o tsv)
echo ubuntu vm size ... $ubuntu_vm_size
ubuntu_vm_fqdn=$(az vm show -d --resource-group $resource_group_name --name $ubuntu_vm_name --query "fqdns" -o tsv)
if [ ! -z "$ubuntu_vm_fqdn" ] 
then
    echo ubuntu vm fqdn is $ubuntu_vm_fqdn
fi
ubuntu_network_id=$(az vm show --resource-group $resource_group_name --name $ubuntu_vm_name --query 'networkProfile.networkInterfaces[].id' -o tsv)
echo ubuntu vm network id is $ubuntu_network_id
network_card_name=$(az network nic show --ids $ubuntu_network_id --query "name" -o tsv)
echo network card name $network_card_name
public_ip_address=$(az vm show -d --resource-group $resource_group_name --name $ubuntu_vm_name --query publicIps -o tsv)
echo ubuntu vm public ip is $public_ip_address
ubuntu_vm_private_ip=$(az vm show -d --resource-group $resource_group_name --name $ubuntu_vm_name --query privateIps -o tsv)        
echo ubuntu vm private ip is $ubuntu_vm_private_ip
network_card_mac_address=$(az network nic show --ids $ubuntu_network_id --query macAddress -o tsv)
echo network card mac address $network_card_mac_address
network_card_location=$(az network nic show --ids $ubuntu_network_id --query location -o tsv)
resource_group_name=$(az network nic show --ids $ubuntu_network_id --query resourceGroup -o tsv)
resource_group_id=$(az network nic show --ids $ubuntu_network_id --query resourceGuid -o tsv)
echo resource group name $resource_group_name
echo resource group location $network_card_location
echo resource group id $resource_group_id
vm_queried=true
