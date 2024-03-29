echo "====================================================================="
echo "====                              list resource groups               ============="
echo "====================================================================="
az resource list --query "[].{resource:resourceGroup,name:name}" --output table
echo
echo
echo
IFS=$'\n' resource_group_names=($(az group list --query [].name -o tsv))
echo resource group names are ...
printf '%s\n' "${resource_group_names[@]}"
resource_group_valid_name=invalid
for resource_group_index in "${!resource_group_names[@]}"
do
    resource_group_name=${resource_group_names[$resource_group_index]}
    if [[ $resource_group_name = 'ResourceGroup'* ]]; then
        resource_group_valid_name=$resource_group_name
    fi
done
resource_group_name=$resource_group_valid_name
echo resource group $resource_group_name will be used to build servers in 
az resource list -g $resource_group_name -o table >> output-resource-groups.txt
resource_group_listed=true
echo
echo
echo