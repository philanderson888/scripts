echo "=============================================================="
echo "====           launch node web server                     ===="
echo "=============================================================="
IFS=$'\n' resource_group_names=($(az group list --query [].name -o tsv))
echo printing array
printf '%s\n' "${resource_group_names[@]}"
resource_group_valid_name=invalid
echo for each over array
for resource_group_index in "${!resource_group_names[@]}"
do
    resource_group_name=${resource_group_names[$resource_group_index]}
    echo $resource_group_name
    if [[ $resource_group_name = 'ResourceGroup'* ]]; then
        echo found a resource group ... with name ... $resource_group_name
        resource_group_valid_name=$resource_group_name
    fi
done
resource_group_name=$resource_group_valid_name
ssh_key=~/.ssh/azureCliUbuntuLogin.pem
admin_username=azureuser
ubuntu_vm_name=ubuntuVm01
public_ip_address=$(az vm show -d --resource-group $resource_group_name --name $ubuntu_vm_name --query publicIps -o tsv)
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-25-install-node-npm-yarn-express.zsh
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-25-run-node.zsh
