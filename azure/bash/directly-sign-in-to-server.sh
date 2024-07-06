azure=true
aws=false
echo "=============================================================="
echo "====              sign in to running server               ===="
echo "=============================================================="
if [ "$azure" = true ] ; then
    echo "=============================================================="
    echo "====                 get resource group                   ===="
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
    echo "=============================================================="
    echo "====                     sign in                          ===="
    echo "=============================================================="
    ssh_key=~/.ssh/azureCliUbuntuLogin.pem
    admin_username=azureuser
    vm_name=vm01
    public_ip_address=$(az vm show -d --resource-group $resource_group_name --name $vm_name --query publicIps -o tsv)
    echo sign in with ...
    echo resource group $resource_group_name
    echo vm $vm_name
    echo user $admin_username
    echo ip $public_ip_address
    ssh -i $ssh_key $admin_username@$public_ip_address  
elif [ "$aws" = true ] ; then
    instance_public_ip=$(aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)
    echo instance public ip is $instance_public_ip

    ip=$instance_public_ip
    certificatePath='~/.ssh/alpine.pem'
    sshLoginUsername=$userName@$ip

    echo signing in to $ip with user $sshLoginUsername ...
    ssh -i ~/.ssh/alpine.pem $sshLoginUsername
fi

echo check which web servers are running locally

echo apache web server on port 80
curl localhost -s

echo server 06 node     
curl localhost:3006 -s

