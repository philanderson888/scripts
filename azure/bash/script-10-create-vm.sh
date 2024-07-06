vm_name=$vm_01_name
echo "======================================================================="
echo "====             create vm $vm_name using image $vm_image"
printTime
echo "======================================================================="
az vm create --name $vm_name --resource-group $resource_group_name  --image $vm_image --admin-username $admin_username --admin-password $admin_password --ssh-key-value $ssh_key_public
echo
echo
echo
vm_created=true
query_vm=true
log_in_to_vm=true
update_vm=true
    