echo "=============================================================="
echo "====           launch vue web server                     ===="
echo "=============================================================="
IFS=$'\n' resource_group_names=($(az group list --query [].name -o tsv))
resource_group_valid_name=invalid
for resource_group_index in "${!resource_group_names[@]}"
do
    resource_group_name=${resource_group_names[$resource_group_index]}
    echo $resource_group_name
    if [[ $resource_group_name = 'ResourceGroup'* ]]; then
        resource_group_valid_name=$resource_group_name
    fi
done
resource_group_name=$resource_group_valid_name
ssh_key=~/.ssh/azureCliUbuntuLogin.pem
admin_username=azureuser
ubuntu_vm_name=ubuntuVm01
public_ip_address=$(az vm show -d --resource-group $resource_group_name --name $ubuntu_vm_name --query publicIps -o tsv)
#ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-28-vue.zsh
echo end of file
echo end of file
echo end of file
echo end of file
echo end of file
