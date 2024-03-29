if [ "$query_assets" = true ] ; then
    echo "az vm list"
    az vm list -g $resource_group_name --query "[].id" -o tsv
    
    echo az vm list >> output.txt
    az vm list >> output.txt
    echo "az vm list -g $resource_group_name -o table" >> output.txt
    az vm list -g $resource_group_name -o table >> output.txt
    az vm list -g $resource_group_name >> output.txt
    az vm list -g $resource_group_name -o table --show-details >> output.txt
    az vm list -g $resource_group_name --show-details >> output.txt
fi
