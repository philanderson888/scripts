if [ "$creating_resource_group_and_servers" = true ] ; then
    resource_group_name=$resource_group_new_name
    if [[ "$resource_group_name" == "invalid" ]] ; then
        resource_group_name=ResourceGroup02
    fi
    echo creating resource group $resource_group_name in uk south region
    az group create --name $resource_group_name --location $resource_group_location
    echo
    echo
    echo
    echo resource group $resource_group_name was just created, so servers have to be created also
    resource_group_created=true
    create_vm_windows_server=true
    create_vm_ubuntu_linux=true
    create_vm_linux_flavours=true
    set_auto_shutdown=true
    echo
    echo
    echo
else
    resource_group_already_created=true
fi
