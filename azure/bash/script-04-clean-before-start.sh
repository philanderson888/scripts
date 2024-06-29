resource_group_name=invalid
if [ "$clean_before_start" = true ] ; then
    echo "=============================================================="
    echo "====        rebuilding from scratch every time            ===="
    echo "=============================================================="
    echo tearing down and building up from scratch every time
    echo ... remove any resource groups if they contain the name 'Resource Group'
    echo ... parse the number of the last known resource group
    echo ... add one 
    echo ... create a fresh resource group with the new number incremented by one 
    echo ... create fresh servers from scratch each time
    deleting_resource_group_and_servers=true
    environment_has_been_cleaned_before_start=true
else
    echo "=============================================================="
    echo "====            reusing servers if they exist             ===="
    echo "=============================================================="
    echo preserving existing resource group and servers so not tearing anything down ...
    echo
    echo
    echo
    echo "=============================================================="
    echo "====                  resource groups                     ===="
    echo "=============================================================="
    az group list      
    az group list -o table
    az group list --query [].name -o tsv
    echo
    echo
    echo
    echo putting into an array
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
    environment_has_been_cleaned_before_start=false
    create_vm_windows_server=false
    set_auto_shutdown=false
    query_vm_windows_server=true
    echo
    echo
    echo
fi





getting_existing_and_new_resource_group_names_before_deletion=true
resource_group_index=-1
resource_group_name=invalid
resource_group_new_index=-1
resource_group_new_name=invalid
if [ "$getting_existing_and_new_resource_group_names_before_deletion" = true ] ; then
    echo "=============================================================="
    echo "=============================================================="
    echo "====            list resource groups 004-070              ===="
    echo "=============================================================="
    az group list >> output-resource-groups.txt
    az group list -o table >> output-resource-groups.txt
    az group list --query [].name -o tsv
    echo "=============================================================="
    echo "====                get next resource group               ===="
    echo "=============================================================="
    echo putting into an array
    IFS=$'\n' resource_group_names=($(az group list --query [].name -o tsv))
    echo
    echo for each resource group in list of resource groups
    echo
    printf '%s\n' "${resource_group_names[@]}"
    for array_index in "${!resource_group_names[@]}"
    do
        resource_group_name=${resource_group_names[$array_index]}
        echo $resource_group_name
        if [[ $resource_group_name = 'ResourceGroup'* ]]; then
            resource_group_index=$(echo $resource_group_name | tr -dc '0-9')
            echo resource group $resource_group_name exists with index $resource_group_index  
        fi
    done

    if [ "$resource_group_index" -ne -1 ] ; then
        if [ "$resource_group_index" -eq 8 ] ; then
            resource_group_new_index="1"
        else
            resource_group_new_index="$((resource_group_index + 1))"
        fi
        resource_group_new_index=$(printf "%02d" $resource_group_new_index)
        resource_group_new_name=$resource_group_prefix$resource_group_new_index
        echo new resource group name will be $resource_group_new_name
    fi
fi


deleting_resource_group_and_servers=false
echo resource group new name is $resource_group_new_name
if [[ "$resource_group_new_name" != "invalid" ]] ; then
    deleting_resource_group_and_servers=true
else
    creating_resource_group_and_servers=true
fi

if [ "$deleting_resource_group_and_servers" = true ] ; then
    echo "====================================================================="
    echo "====            deleting existing resource groups                ===="
    echo "====================================================================="
    for array_index in "${!resource_group_names[@]}"
    do
        resource_group_name=${resource_group_names[$array_index]}
        echo $resource_group_name
        if [[ $resource_group_name = 'ResourceGroup'* ]]; then
            echo ... deleting resource group ... $resource_group_name
            az group delete --name $resource_group_name --yes --no-wait
            creating_resource_group_and_servers=true
        fi
    done
fi
