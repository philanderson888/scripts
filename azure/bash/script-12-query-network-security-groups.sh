echo "====================================================================="
echo "====                  network security group                     ===="
echo "====================================================================="
echo "az network nsg list"
echo az network nsg list --resource-group $resource_group_name --query "[].id" -o tsv
az network nsg list --resource-group $resource_group_name --query "[].id" -o tsv
echo az network nsg list --resource-group $resource_group_name -o table
az network nsg list --resource-group $resource_group_name -o table
echo az network nsg list --resource-group $resource_group_name
az network nsg list --resource-group $resource_group_name
echo "====================================================================="
echo "====                       az vm list                            ===="
echo "====================================================================="
echo "az vm list"
echo az vm list -g $resource_group_name --query "[].id" -o tsv
az vm list -g $resource_group_name --query "[].id" -o tsv
echo
echo
echo
echo "az vm list -g $resource_group_name -o table"
az vm list -g $resource_group_name -o table
echo
echo
echo
az vm list -g $resource_group_name -o table --show-details
az vm list -g $resource_group_name --show-details
echo
echo
echo  
echo "=============================================================="
echo "====          query network security group                ===="
echo "=============================================================="
echo az network nsg list ...
az network nsg list --resource-group $resource_group_name --output table
echo
echo
echo
echo az network nsg show ...
az network nsg show -g $resource_group_name -n $network_security_group_name --output table
echo
echo
echo
echo az network nsg rule list ...
az network nsg rule list --nsg-name $network_security_group_name --resource-group $resource_group_name --output table
echo
echo
echo
echo "====================================================================="
echo "====                 az network nsg rule create                  ===="
echo "====================================================================="
echo az network nsg rule create vm01NGSRuleAllowAll priority 1010 Open to internet
az network nsg rule create -g $resource_group_name --nsg-name vm01NSG --name vm01NGSRuleAllowAll --priority 1010 --source-address-prefixes '*' --source-port-ranges '*' --destination-address-prefixes '*' --destination-port-ranges '*' --access Allow --protocol Tcp --description "Open to internet" --output table
echo
echo
echo
echo "====================================================================="
echo "====                 az network nsg rule list                    ===="
echo "====================================================================="
echo az network nsg rule list -g $resource_group_name --nsg-name vm01NSG --output table
az network nsg rule list -g $resource_group_name --nsg-name vm01NSG --output table
echo
echo
echo


