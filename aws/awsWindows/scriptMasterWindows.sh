echo
echo
echo
echo
echo
echo
startTimeOnMasterScript=$(date +%s)
SECONDS=0
echo "=============================================================="
echo "=============================================================="
echo "=============================================================="
echo "============              azure                  ============="
echo "============        build windows server         ============="
echo "============         build ubuntu server         ============="
echo "============       run web servers on both       ============="
echo ============ script starts at unix time $startTimeOnMasterScript
echo ============ script starts at $startTimeOnMasterScript | perl -pe 's/(\d+)/localtime($1)/e'
echo "=============================================================="
echo "=============================================================="
echo "=============================================================="
echo
echo
echo
echo
echo
echo
echo

# install
installing_powershell=false
installing_aws_cli=false

# authentication
logging_in_to_azure_portal=false
email_address=philanderson888@hotmail.com
webhook_address=https://notifyme.com

# rebuild option
tearing_down_and_building_up_from_scratch_every_time=true

# resource group
resource_group_prefix=ResourceGroup
resource_group_index=01
resource_group_name=$resource_group_prefix$resource_group_index
resource_group_location=uksouth
list_resource_groups=true

# images
list_vm_image_sizes=false
size=Standard_D2_v2
size02=Standard_D2as_v5
image=MicrosoftWindowsDesktop:office-365:20h2-evd-o365pp-g2:19042.2846.230411

# vms
create_vm_windows_client=false
windows_server_vm_name=winServerVm01
network_security_group_name=winServerVm01NSG
windows_server_vm_ip_name=winServerVm01PublicIP    
windows_client_vm_name=winClientVm01
ubuntu_vm_name=ubuntuVm01
ubuntu_vm_name_02=ubuntuVm02
red_hat_vm_name=redHatVm01
debian_vm_name="debianVm01"
centos_vm_name="centosVm01"
open_suse_vm_name="openSuseVm01"
flatCarVmName="flatCarVm01"

# credentials
admin_username=azureuser
admin_password_file=adminPassword.txt
admin_password=$(cat $admin_password_file)
echo user $admin_username
echo pass $admin_password

# vm listings
list_vms=true
list_vm_details=false
list_kubernetes_clusters=false

# vm details
query_vm_windows_server=true
query_vm_ubuntu_linux=true

# manage vms
manage_vms=true

# vm cleanup
delete_vms=false
delete_resource_group=false

# wipe output file
echo erasing all data in output.txt before run begins
echo > output.txt
>| output.txt


echo
echo
echo
if [ "$installing_aws_cli" = true ] ; then
    echo
    echo
    echo
    echo ==============================================================
    echo "============          installing aws client      ============="
    echo ==============================================================
    echo
    echo
    echo
    brew update
    brew install azure-cli
else
    echo =======================================================================
    echo "============      aws client is already installed         ============="
    echo =======================================================================
fi
if [ "$installing_powershell" = true ] ; then
    echo
    echo
    echo
    echo ==============================================================
    echo "============       installing powershell         ============="
    echo ==============================================================
    echo
    echo
    echo
    echo installing standard version of powershell
    brew update
    brew install powershell/tap/powershell
    brew upgrade powershell
    pwsh
    echo
    echo
    echo
    echo installing powershell preview edition
    brew install powershell/tap/powershell-preview
    pwsh-preview
    brew upgrade powershell-preview
else
    echo =======================================================================
    echo "============      powershell is already instsalled        ============="
    echo =======================================================================
fi
if [ "$logging_in_to_azure_portal" = true ] ; then
    echo
    echo
    echo
    echo ==============================================================
    echo "============      logging in to azure portal     ============="
    echo ==============================================================
    echo
    echo
    echo
    az login
    # [
    #  {
    #    "cloudName": "AzureCloud",
    #    "homeTenantId": "84db59c8-e4f2-4a8b-9c4a-2f6be457ceba",
    #    "isDefault": true,
    #    "id": "29a6dc31-f2c3-4caa-a935-2a7158618df5",
    #    "managedByTenants": [],
    #    "name": "Pay-As-You-Go",
    #    "state": "Enabled",
    #    "tenantId": "84db59c8-e4f2-4a8b-9c4a-2f6be457ceba",
    #    "user": {
    #      "name": "philanderson888@hotmail.com",
    #      "type": "user"
    #    }
    #  }
    #]
else
    echo =======================================================================
    echo "============     already logged in to azure portal        ============="
    echo =======================================================================
fi
echo
echo
echo
echo "===================================================================="
echo "============                azure status               ============="
echo "===================================================================="
echo azure logged in account is ...
az account show --query "user.name" --output tsv
echo
echo
echo
echo "===================================================================="
echo "============             azure account list            ============="
echo "===================================================================="
az account list --query "[].{name:name, cloudName:cloudName, subscriptionId:subscriptionId, tenantId:tenantId}" --output table
echo
echo
echo
resource_group_name=invalid
if [ "$tearing_down_and_building_up_from_scratch_every_time" = true ] ; then
    echo ========================================================================
    echo "============     rebuilding from scratch every time        ============="
    echo ========================================================================
    echo tearing down and building up from scratch every time
    echo ... remove any resource groups if they contain the name 'Resource Group'
    echo ... parse the number of the last known resource group
    echo ... add one 
    echo ... create a fresh resource group with the new number incremented by one 
    echo ... create fresh servers from scratch each time
    deleting_resource_group_and_servers=true
else
    echo ========================================================================
    echo "============        reusing servers if they exist          ============="
    echo ========================================================================
    echo preserving existing resource group and servers so not tearing anything down ...
    echo
    echo
    echo
    echo ==============================================================
    echo "============           resource groups           ============="
    echo ==============================================================
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
    create_vm_windows_server=false
    create_vm_ubuntu_linux=false
    create_vm_linux_flavours=false
    set_auto_shutdown=false
    query_vm_ubuntu_linux=true
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
    echo "======================================================================================="
    echo "============      getting existing and new resource group names            ============"
    echo "======================================================================================="
    echo
    echo
    echo
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
    echo for each over array

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
    echo "======================================================================================="
    echo "============            deleting existing resource groups                  ============"
    echo "======================================================================================="
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

sleep $sleep_duration

if [ "$creating_resource_group_and_servers" = true ] ; then
    echo
    echo
    echo
    echo "=============================================================="
    echo "============       create resource group         ============="
    echo "=============================================================="
    resource_group_name=$resource_group_new_name
    if [[ "$resource_group_name" == "invalid" ]] ; then
        resource_group_name=ResourceGroup01
    fi
    echo creating resource group $resource_group_name in uk south region
    az group create --name $resource_group_name --location $resource_group_location
    echo
    echo
    echo
    echo resource group $resource_group_name was just created, so servers have to be created also
    create_vm_windows_server=true
    create_vm_ubuntu_linux=true
    create_vm_linux_flavours=true
    set_auto_shutdown=true
    echo
    echo
    echo
fi
echo
echo
echo
echo "=========================================================================="
echo "============          resource group resources               ============="
echo "=========================================================================="
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
az resource list -g $resource_group_name -o table >> output.txt
echo
echo
echo










if [ "$list_vm_image_sizes" = true ] ; then
    echo
    echo
    echo
    echo ==============================================================
    echo "============                images               ============="
    echo ==============================================================
    echo see echo https://learn.microsoft.com/en-us/azure/virtual-machines/generation-2 for image sizes
    echo 1 Windows Server 2022
    echo 2 Windows 11 Enterprise
    echo 3 SUSE Linux Enterprise Server 15 SP3
    echo 4 Ubuntu Server 22.04 LTS
    echo 5 RHEL 8.5
    echo 6 Cent OS 8.4
    echo 7 Oracle Linux 8.4 LVM
    echo
    echo
    echo
    echo all images by canonical
    az vm image list --publisher Canonical --sku gen2 --output table --all
    echo
    echo
    echo
    echo all images
    az vm image list --sku gen2 --output table --all
    echo
    echo
    echo
    echo listing vm image sizes
    az vm list-sizes --location $resource_group_location --output table
    echo
    echo
    echo
    echo azure vm list skus
    az vm list-skus --output table
    echo
    echo
    echo
    az vm list-skus -l westus --output table
    echo 
    echo
    echo
    echo >> azure-image-list.txt
    echo >> azure-image-list.txt
    echo >> azure-image-list.txt
    echo ======================================== >> azure-image-list.txt
    echo ==== images by publisher Microsoft ===== >> azure-image-list.txt
    echo ======================================== >> azure-image-list.txt
    echo > azure-image-list.txt 
    echo find all Gen2 SKUs published by Microsoft Windows Desktop - output to azure-image-list.txt
    echo Gen2 SKUs published by Microsoft Windows Desktop >> azure-image-list.txt
    az vm image list --publisher MicrosoftWindowsDesktop --sku g2 --output table --all >> azure-image-list.txt
    echo
    echo
    echo
    echo find all Gen2 SKUs published by Microsoft Windows Desktop - output to azure-image-list.txt
    az vm image list --publisher MicrosoftWindowsDesktop --sku gen2 --output table --all >> azure-image-list.txt
    echo 
    echo
    echo
    echo find all Gen2 SKUs published by Canonical  - output to azure-image-list.txt
    az vm image list --publisher Canonical --sku gen2 --output table --all >> azure-image-list.txt
    echo
    echo
    echo
    echo find all images - output to azure-image-list.txt
    echo >> azure-image-list.txt
    echo >> azure-image-list.txt
    echo >> azure-image-list.txt
    echo ===================== >> azure-image-list.txt
    echo ==== all images ===== >> azure-image-list.txt
    echo ===================== >> azure-image-list.txt
    az vm image list >> azure-image-list.txt
    echo >> azure-image-list.txt
    echo >> azure-image-list.txt
    echo >> azure-image-list.txt
    echo azure image templates to use are
    echo - valid image URN
    echo - custom image name
    echo - custom image id
    echo - VHD blob URI
    echo - image from 
    echo     - CentOS85Gen2
    echo     - Debian11
    echo     - FlatcarLinuxFreeGen2
    echo     - OpenSuseLeap154Gen2
    echo     - RHELRaw8LVMGen2
    echo     - SuseSles15SP3
    echo     - Ubuntu2204
    echo     - Win2022Datacenter
    echo     - Win2022AzureEditionCore
else
    echo =======================================================================
    echo "============       vm image templates - skipped            ============"
    echo =======================================================================
fi


if [ "$list_vms" = true ] ; then
    echo
    echo
    echo
    echo ==============================================================
    echo "============              list vms                ============="
    echo ==============================================================
    echo
    echo
    echo
    az vm list -o table
    echo
    echo
    echo
else
    echo =======================================================================
    echo "============               list vm - skipped               ============"
    echo =======================================================================
fi


if [ "$list_vm_details" = true ] ; then
    echo
    echo
    echo
    echo ===================================================================
    echo "============              list vm details             ============="
    echo ===================================================================
    echo
    echo
    echo
    az vm list 
    az vm list -g $resource_group_name -o table
    az vm list -g $resource_group_name
    az vm list -g $resource_group_name -o table --show-details
    az vm list -g $resource_group_name --show-details
fi




if [ "$create_vm_linux_flavours" = true ] ; then
    echo
    echo
    echo
    echo =============================================================================
    echo "============               create linux flavours                 ============="
    echo =============================================================================
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo =============================================================================
    echo "============               create $ubuntu_vm_name_02                 ============="
    echo "============                  $minutes:$seconds                            ============="
    echo =============================================================================
    az vm create  --name $ubuntu_vm_name_02 --resource-group $resource_group_name --image Ubuntu2204  --admin-username $admin_username --admin-password $admin_password --ssh-key-value ~/.ssh/azureCliUbuntuLogin.pub --no-wait
    query_vm_ubuntu_02=false
    log_in_to_ubuntu_02=false
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo =============================================================================
    echo "============               create $red_hat_vm_name                 ============="
    echo "============                  $minutes:$seconds                            ============="
    echo =============================================================================
    az vm create --name $red_hat_vm_name --resource-group $resource_group_name --image RHELRaw8LVMGen2 --admin-username $admin_username --admin-password $admin_password --ssh-key-value ~/.ssh/azureCliUbuntuLogin.pub --no-wait
    query_vm_redhat=false
    log_in_to_red_hat=false
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo =============================================================================
    echo "============               create $debian_vm_name                 ============="
    echo "============                  $minutes:$seconds                            ============="
    echo =============================================================================  
    az vm create --name $debian_vm_name --resource-group $resource_group_name --image Debian11 --admin-username $admin_username --admin-password $admin_password --ssh-key-value ~/.ssh/azureCliUbuntuLogin.pub --no-wait
    query_vm_debian=true
    log_in_to_debian=true
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo =============================================================================
    echo "============               create $centos_vm_name                 ============="
    echo "============                  $minutes:$seconds                            ============="
    echo =============================================================================  
    az vm create --name $centos_vm_name --resource-group $resource_group_name --image CentOS85Gen2 --admin-username $admin_username --admin-password $admin_password --ssh-key-value ~/.ssh/azureCliUbuntuLogin.pub --no-wait
    query_vm_centos=true
    log_in_to_centos=true
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo =============================================================================
    echo "============               create $open_suse_vm_name                ============="
    echo "============                  $minutes:$seconds                            ============="
    echo =============================================================================  
    az vm create --name $open_suse_vm_name --resource-group $resource_group_name --image OpenSuseLeap154Gen2 --admin-username $admin_username --admin-password $admin_password --ssh-key-value ~/.ssh/azureCliUbuntuLogin.pub --no-wait
    query_vm_open_suse=true
    log_in_to_open_suse=true
    echo
    echo
    echo 
fi









if [ "$create_vm_ubuntu_linux" = true ] ; then
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo ======================================================================
    echo "============                 create $ubuntu_vm_name           ============="
    echo "============                  $minutes:$seconds                       ============="
    echo ======================================================================
    az vm create --name $ubuntu_vm_name --resource-group $resource_group_name  --image Ubuntu2204 --admin-username $admin_username --admin-password $admin_password --ssh-key-value ~/.ssh/azureCliUbuntuLogin.pub
    echo
    echo
    echo
    subscription=$(az account show --query "id" -o tsv)
    ubuntu_vm_id="/subscriptions/$subscription/resourceGroups/VMResources/providers/Microsoft.Compute/virtualMachines/$ubuntu_vm_name"
    echo ubuntu server vm id is $ubuntu_vm_id
    echo
    echo
    echo
    query_vm_ubuntu_linux=true
fi




if [ "$query_vm_ubuntu_linux" = true ] ; then
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo ======================================================================
    echo "============            query $ubuntu_vm_name               ============="
    echo "============                  $minutes:$seconds                       ============="
    echo ======================================================================
    echo resource group name $resource_group_name
    subscription=$(az account show --query "id" -o tsv)
    ubuntu_vm_id="/subscriptions/$subscription/resourceGroups/VMResources/providers/Microsoft.Compute/virtualMachines/$ubuntu_vm_name"
    echo ubuntu server vm id is $ubuntu_vm_id
    ubuntu_machine_id=$(az vm show --resource-group $resource_group_name --name $ubuntu_vm_name --query vmId -o tsv)
    echo ubuntu machine id $ubuntu_machine_id
    ubuntu_user_name=$(az vm show --resource-group $resource_group_name --name $ubuntu_vm_name --query osProfile.adminUsername -o tsv)
    echo ubuntu user name $ubuntu_user_name
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
    ubuntu_vm_public_ip_address=$(az vm show -d --resource-group $resource_group_name --name $ubuntu_vm_name --query publicIps -o tsv)
    echo ubuntu vm public ip is $ubuntu_vm_public_ip_address
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
fi











print_windows_server_ssh_provisioning_json=false
if [ "$print_windows_server_ssh_provisioning_json" = true ] ; then
    echo
    echo
    echo
    echo ======================================================================
    echo "============       windows server json provisioning      ============="
    echo ======================================================================
    echo provision windows server to allow ssh through the firewall on network security group winServerVm01NSG - see file 
    echo not currently working yet
    cat ./networkSecurityGroupJsonProvision.json
else
    echo ======================================================================
    echo "============       windows server json provisioning      ============="
    echo "============         output sent to ./output.txt         ============="
    echo ======================================================================
    echo " " >> output.txt
    echo " " >> output.txt
    echo " " >> output.txt
    echo ====================================================================== >> output.txt
    echo ============       windows server json provisioning      ============= >> output.txt
    echo ====================================================================== >> output.txt
    cat ./networkSecurityGroupJsonProvision.json >> output.txt
fi







log_in_to_ubuntu=true
if [ "$log_in_to_ubuntu" = true ] ; then
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo ======================================================================
    echo "============           logging in to $ubuntu_vm_name               ============="
    echo "============                  $minutes:$seconds                       ============="
    echo ======================================================================
    echo
    echo
    echo working directory
    pwd   
    echo ip address
    echo $ubuntu_vm_public_ip_address  
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo ==============================================================================
    echo "============   running script 04 query linux on $ubuntu_vm_name               ============="
    echo "============                  $minutes:$seconds                       ============="
    echo ==============================================================================
    echo
    echo
    echo
    ssh -i ~/.ssh/azureCliUbuntuLogin.pem $admin_username@$ubuntu_vm_public_ip_address 'bash -s' < ../awsLinux/script-04a-query-linux.sh
    echo
    echo
    echo
    duration=$SECONDS
    echo "$((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
    echo
    echo
    echo
fi












manage_vms=true
if [ "$manage_vms" = true ] ; then
    echo
    echo
    echo
    echo ======================================================================
    echo "============                  manage vms                 ============="
    echo ======================================================================
    #echo starting windows vm
    #echo
    #echo
    #echo
    #az vm start --resource-group $resource_group_name --name $windows_server_vm_name
    #echo
    #echo
    #echo
    #echo starting ubuntu vm
    #echo
    #echo
    #echo
    #az vm start --resource-group $resource_group_name --name $ubuntu_vm_name
    #echo
    #echo
    #echo
    #echo stopping windows vm
    #echo
    #echo
    #echo
    #az vm stop --resource-group $resource_group_name --name $windows_server_vm_name
    #echo
    #echo
    #echo
    #echo stopping ubuntu vm
    #echo
    #echo
    #echo
    #az vm stop --resource-group $resource_group_name --name $ubuntu_vm_name
    #echo
    #echo
    #echo
    #echo starting ubuntu vm
    #echo
    #echo
    #echo
    #az vm start --resource-group $resource_group_name --name $ubuntu_vm_name
    #echo
    #echo
    #echo
    #echo restarting ubuntu vm
    #echo
    #echo
    #echo
    #az vm restart --resource-group $resource_group_name --name $ubuntu_vm_name
    #echo
    #echo
    #echo   
    echo list vms output to azure_vm_list.txt
    az vm list >> azure_vm_list.txt
    echo vm info
    az vm show --resource-group $resource_group_name --name $ubuntu_vm_name >> output.txt
    echo vm resource usage to output.txt
    az vm list-usage --location eastus >> output.txt
    #Add a data disk to a VM	az vm disk attach --resource-group $resource_group_name --vm-name $ubuntu_vm_name --disk myDataDisk --size-gb 128 --new
    echo list disks sent to output.txt
    echo list disks >> output.txt
    echo list disks --resource-group $resource_group_name >> output.txt
    echo storage profile sent to output.txt
    echo 
    echo storage profile >> output.txt
    echo 
    az vm show --resource-group $resource_group_name --name $ubuntu_vm_name --query "storageProfile" >> output.txt
    #Resize a disk	az disk update --resource-group $resource_group_name --name myDataDisk --size-gb 256
    #Snapshot a disk	az snapshot create --resource-group $resource_group_name --name mySnapshot --source myDataDisk
    #Remove a data disk from a VM	az vm disk detach --resource-group $resource_group_name --vm-name $ubuntu_vm_name --disk myDataDisk
    #Create image of a VM	az image create --resource-group $resource_group_name --source $ubuntu_vm_name --name myImage
    #Create VM from image	az vm create --resource-group $resource_group_name --name myNewVM --image myImage
else
    echo =======================================================================
    echo "============            manage vms - skipped               ============"
    echo =======================================================================
fi
echo
echo
echo







if [ "$query_vm_ubuntu_02" = true ] ; then
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo ======================================================================
    echo "============            query $ubuntu_vm_name_02              ============="
    echo "============                  $minutes:$seconds                       ============="
    echo ======================================================================
    echo resource group name $resource_group_name
    subscription=$(az account show --query "id" -o tsv)
    ubuntu_vm_id="/subscriptions/$subscription/resourceGroups/VMResources/providers/Microsoft.Compute/virtualMachines/$ubuntu_vm_name_02"
    echo ubuntu server vm id is $ubuntu_vm_id
    ubuntu_machine_id=$(az vm show --resource-group $resource_group_name --name $ubuntu_vm_name_02 --query vmId -o tsv)
    echo ubuntu machine id $ubuntu_machine_id
    ubuntu_user_name=$(az vm show --resource-group $resource_group_name --name $ubuntu_vm_name_02 --query osProfile.adminUsername -o tsv)
    echo ubuntu user name $ubuntu_user_name
    ubuntu_computer_name=$(az vm show --resource-group $resource_group_name --name $ubuntu_vm_name_02 --query osProfile.computerName -o tsv)
    echo ubuntu computer name $ubuntu_computer_name
    ubuntu_vm_id_hash=$(az vm show -d --resource-group $resource_group_name --name $ubuntu_vm_name_02 --query "vmId" -o tsv)    
    echo ubuntu vm id hash ... $ubuntu_vm_id_hash
    ubuntu_vm_size=$(az vm show -d --resource-group $resource_group_name --name $ubuntu_vm_name_02 --query "hardwareProfile.vmSize" -o tsv)
    echo ubuntu vm size ... $ubuntu_vm_size
    ubuntu_vm_fqdn=$(az vm show -d --resource-group $resource_group_name --name $ubuntu_vm_name_02 --query "fqdns" -o tsv)
    if [ ! -z "$ubuntu_vm_fqdn" ] 
    then
        echo ubuntu vm fqdn is $ubuntu_vm_fqdn
    fi
    ubuntu_network_id=$(az vm show --resource-group $resource_group_name --name $ubuntu_vm_name_02 --query 'networkProfile.networkInterfaces[].id' -o tsv)
    echo ubuntu vm network id is $ubuntu_network_id
    network_card_name=$(az network nic show --ids $ubuntu_network_id --query "name" -o tsv)
    echo network card name $network_card_name
    ubuntu_vm_public_ip_address_02=$(az vm show -d --resource-group $resource_group_name --name $ubuntu_vm_name_02 --query publicIps -o tsv)
    echo ubuntu vm public ip is $ubuntu_vm_public_ip_address_02
    ubuntu_vm_private_ip=$(az vm show -d --resource-group $resource_group_name --name $ubuntu_vm_name_02 --query privateIps -o tsv)        
    echo ubuntu vm private ip is $ubuntu_vm_private_ip
    network_card_mac_address=$(az network nic show --ids $ubuntu_network_id --query macAddress -o tsv)
    echo network card mac address $network_card_mac_address
    network_card_location=$(az network nic show --ids $ubuntu_network_id --query location -o tsv)
    resource_group_name=$(az network nic show --ids $ubuntu_network_id --query resourceGroup -o tsv)
    resource_group_id=$(az network nic show --ids $ubuntu_network_id --query resourceGuid -o tsv)
    echo resource group name $resource_group_name
    echo resource group location $network_card_location
    echo resource group id $resource_group_id
fi

















if [ "$query_vm_redhat" = true ] ; then
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo ==============================================================================
    echo "============               query $red_hat_vm_name                      ============="
    echo "============                  $minutes:$seconds                       ============="
    echo ==============================================================================
    echo resource group name $resource_group_name
    subscription=$(az account show --query "id" -o tsv)
    red_hat_vm_id="/subscriptions/$subscription/resourceGroups/VMResources/providers/Microsoft.Compute/virtualMachines/$red_hat_vm_name"
    echo red_hat server vm id is $red_hat_vm_id
    red_hat_machine_id=$(az vm show --resource-group $resource_group_name --name $red_hat_vm_name --query vmId -o tsv)
    echo red_hat machine id $red_hat_machine_id
    red_hat_user_name=$(az vm show --resource-group $resource_group_name --name $red_hat_vm_name --query osProfile.adminUsername -o tsv)
    echo red_hat user name $red_hat_user_name
    red_hat_computer_name=$(az vm show --resource-group $resource_group_name --name $red_hat_vm_name --query osProfile.computerName -o tsv)
    echo red_hat computer name $red_hat_computer_name
    red_hat_vm_id_hash=$(az vm show -d --resource-group $resource_group_name --name $red_hat_vm_name --query "vmId" -o tsv)    
    echo red_hat vm id hash ... $red_hat_vm_id_hash
    red_hat_vm_size=$(az vm show -d --resource-group $resource_group_name --name $red_hat_vm_name --query "hardwareProfile.vmSize" -o tsv)
    echo red_hat vm size ... $red_hat_vm_size
    red_hat_vm_fqdn=$(az vm show -d --resource-group $resource_group_name --name $red_hat_vm_name --query "fqdns" -o tsv)
    if [ ! -z "$red_hat_vm_fqdn" ] 
    then
        echo red_hat vm fqdn is $red_hat_vm_fqdn
    fi
    red_hat_network_id=$(az vm show --resource-group $resource_group_name --name $red_hat_vm_name --query 'networkProfile.networkInterfaces[].id' -o tsv)
    echo red_hat vm network id is $red_hat_network_id
    network_card_name=$(az network nic show --ids $red_hat_network_id --query "name" -o tsv)
    echo network card name $network_card_name
    red_hat_vm_public_ip_address=$(az vm show -d --resource-group $resource_group_name --name $red_hat_vm_name --query publicIps -o tsv)
    echo red_hat vm public ip is $red_hat_vm_public_ip_address
    red_hat_vm_private_ip=$(az vm show -d --resource-group $resource_group_name --name $red_hat_vm_name --query privateIps -o tsv)        
    echo red_hat vm private ip is $red_hat_vm_private_ip
    network_card_mac_address=$(az network nic show --ids $red_hat_network_id --query macAddress -o tsv)
    echo network card mac address $network_card_mac_address
    network_card_location=$(az network nic show --ids $red_hat_network_id --query location -o tsv)
    resource_group_name=$(az network nic show --ids $red_hat_network_id --query resourceGroup -o tsv)
    resource_group_id=$(az network nic show --ids $red_hat_network_id --query resourceGuid -o tsv)
    echo resource group name $resource_group_name
    echo resource group location $network_card_location
    echo resource group id $resource_group_id
fi





if [ "$query_vm_debian" = true ] ; then
    echo
    echo
    echo
    echo ======================================================================
    echo "============            query debian linux               ============="
    echo ======================================================================
    echo resource group name $resource_group_name
    subscription=$(az account show --query "id" -o tsv)
    debian_vm_id="/subscriptions/$subscription/resourceGroups/VMResources/providers/Microsoft.Compute/virtualMachines/$debian_vm_name"
    echo debian server vm id is $debian_vm_id
    debian_machine_id=$(az vm show --resource-group $resource_group_name --name $debian_vm_name --query vmId -o tsv)
    echo debian machine id $debian_machine_id
    debian_user_name=$(az vm show --resource-group $resource_group_name --name $debian_vm_name --query osProfile.adminUsername -o tsv)
    echo debian user name $debian_user_name
    debian_computer_name=$(az vm show --resource-group $resource_group_name --name $debian_vm_name --query osProfile.computerName -o tsv)
    echo debian computer name $debian_computer_name
    debian_vm_id_hash=$(az vm show -d --resource-group $resource_group_name --name $debian_vm_name --query "vmId" -o tsv)    
    echo debian vm id hash ... $debian_vm_id_hash
    debian_vm_size=$(az vm show -d --resource-group $resource_group_name --name $debian_vm_name --query "hardwareProfile.vmSize" -o tsv)
    echo debian vm size ... $debian_vm_size
    debian_vm_fqdn=$(az vm show -d --resource-group $resource_group_name --name $debian_vm_name --query "fqdns" -o tsv)
    if [ ! -z "$debian_vm_fqdn" ] 
    then
        echo debian vm fqdn is $debian_vm_fqdn
    fi
    debian_network_id=$(az vm show --resource-group $resource_group_name --name $debian_vm_name --query 'networkProfile.networkInterfaces[].id' -o tsv)
    echo debian vm network id is $debian_network_id
    network_card_name=$(az network nic show --ids $debian_network_id --query "name" -o tsv)
    echo network card name $network_card_name
    debian_vm_public_ip_address=$(az vm show -d --resource-group $resource_group_name --name $debian_vm_name --query publicIps -o tsv)
    echo debian vm public ip is $debian_vm_public_ip_address
    debian_vm_private_ip=$(az vm show -d --resource-group $resource_group_name --name $debian_vm_name --query privateIps -o tsv)        
    echo debian vm private ip is $debian_vm_private_ip
    network_card_mac_address=$(az network nic show --ids $debian_network_id --query macAddress -o tsv)
    echo network card mac address $network_card_mac_address
    network_card_location=$(az network nic show --ids $debian_network_id --query location -o tsv)
    resource_group_name=$(az network nic show --ids $debian_network_id --query resourceGroup -o tsv)
    resource_group_id=$(az network nic show --ids $debian_network_id --query resourceGuid -o tsv)
    echo resource group name $resource_group_name
    echo resource group location $network_card_location
    echo resource group id $resource_group_id
fi





if [ "$query_vm_centos" = true ] ; then
    echo
    echo
    echo
    echo ======================================================================
    echo "============            query centos linux               ============="
    echo ======================================================================
    echo resource group name $resource_group_name
    subscription=$(az account show --query "id" -o tsv)
    centos_vm_id="/subscriptions/$subscription/resourceGroups/VMResources/providers/Microsoft.Compute/virtualMachines/$centos_vm_name"
    echo centos server vm id is $centos_vm_id
    centos_machine_id=$(az vm show --resource-group $resource_group_name --name $centos_vm_name --query vmId -o tsv)
    echo centos machine id $centos_machine_id
    centos_user_name=$(az vm show --resource-group $resource_group_name --name $centos_vm_name --query osProfile.adminUsername -o tsv)
    echo centos user name $centos_user_name
    centos_computer_name=$(az vm show --resource-group $resource_group_name --name $centos_vm_name --query osProfile.computerName -o tsv)
    echo centos computer name $centos_computer_name
    centos_vm_id_hash=$(az vm show -d --resource-group $resource_group_name --name $centos_vm_name --query "vmId" -o tsv)    
    echo centos vm id hash ... $centos_vm_id_hash
    centos_vm_size=$(az vm show -d --resource-group $resource_group_name --name $centos_vm_name --query "hardwareProfile.vmSize" -o tsv)
    echo centos vm size ... $centos_vm_size
    centos_vm_fqdn=$(az vm show -d --resource-group $resource_group_name --name $centos_vm_name --query "fqdns" -o tsv)
    if [ ! -z "$centos_vm_fqdn" ] 
    then
        echo centos vm fqdn is $centos_vm_fqdn
    fi
    centos_network_id=$(az vm show --resource-group $resource_group_name --name $centos_vm_name --query 'networkProfile.networkInterfaces[].id' -o tsv)
    echo centos vm network id is $centos_network_id
    network_card_name=$(az network nic show --ids $centos_network_id --query "name" -o tsv)
    echo network card name $network_card_name
    centos_vm_public_ip_address=$(az vm show -d --resource-group $resource_group_name --name $centos_vm_name --query publicIps -o tsv)
    echo centos vm public ip is $centos_vm_public_ip_address
    centos_vm_private_ip=$(az vm show -d --resource-group $resource_group_name --name $centos_vm_name --query privateIps -o tsv)        
    echo centos vm private ip is $centos_vm_private_ip
    network_card_mac_address=$(az network nic show --ids $centos_network_id --query macAddress -o tsv)
    echo network card mac address $network_card_mac_address
    network_card_location=$(az network nic show --ids $centos_network_id --query location -o tsv)
    resource_group_name=$(az network nic show --ids $centos_network_id --query resourceGroup -o tsv)
    resource_group_id=$(az network nic show --ids $centos_network_id --query resourceGuid -o tsv)
    echo resource group name $resource_group_name
    echo resource group location $network_card_location
    echo resource group id $resource_group_id
fi






if [ "$query_vm_open_suse" = true ] ; then
    echo
    echo
    echo
    echo ======================================================================
    echo "============            query open_suse linux               ============="
    echo ======================================================================
    echo resource group name $resource_group_name
    subscription=$(az account show --query "id" -o tsv)
    open_suse_vm_id="/subscriptions/$subscription/resourceGroups/VMResources/providers/Microsoft.Compute/virtualMachines/$open_suse_vm_name"
    echo open_suse server vm id is $open_suse_vm_id
    open_suse_machine_id=$(az vm show --resource-group $resource_group_name --name $open_suse_vm_name --query vmId -o tsv)
    echo open_suse machine id $open_suse_machine_id
    open_suse_user_name=$(az vm show --resource-group $resource_group_name --name $open_suse_vm_name --query osProfile.adminUsername -o tsv)
    echo open_suse user name $open_suse_user_name
    open_suse_computer_name=$(az vm show --resource-group $resource_group_name --name $open_suse_vm_name --query osProfile.computerName -o tsv)
    echo open_suse computer name $open_suse_computer_name
    open_suse_vm_id_hash=$(az vm show -d --resource-group $resource_group_name --name $open_suse_vm_name --query "vmId" -o tsv)    
    echo open_suse vm id hash ... $open_suse_vm_id_hash
    open_suse_vm_size=$(az vm show -d --resource-group $resource_group_name --name $open_suse_vm_name --query "hardwareProfile.vmSize" -o tsv)
    echo open_suse vm size ... $open_suse_vm_size
    open_suse_vm_fqdn=$(az vm show -d --resource-group $resource_group_name --name $open_suse_vm_name --query "fqdns" -o tsv)
    if [ ! -z "$open_suse_vm_fqdn" ] 
    then
        echo open_suse vm fqdn is $open_suse_vm_fqdn
    fi
    open_suse_network_id=$(az vm show --resource-group $resource_group_name --name $open_suse_vm_name --query 'networkProfile.networkInterfaces[].id' -o tsv)
    echo open_suse vm network id is $open_suse_network_id
    network_card_name=$(az network nic show --ids $open_suse_network_id --query "name" -o tsv)
    echo network card name $network_card_name
    open_suse_vm_public_ip_address=$(az vm show -d --resource-group $resource_group_name --name $open_suse_vm_name --query publicIps -o tsv)
    echo open_suse vm public ip is $open_suse_vm_public_ip_address
    open_suse_vm_private_ip=$(az vm show -d --resource-group $resource_group_name --name $open_suse_vm_name --query privateIps -o tsv)        
    echo open_suse vm private ip is $open_suse_vm_private_ip
    network_card_mac_address=$(az network nic show --ids $open_suse_network_id --query macAddress -o tsv)
    echo network card mac address $network_card_mac_address
    network_card_location=$(az network nic show --ids $open_suse_network_id --query location -o tsv)
    resource_group_name=$(az network nic show --ids $open_suse_network_id --query resourceGroup -o tsv)
    resource_group_id=$(az network nic show --ids $open_suse_network_id --query resourceGuid -o tsv)
    echo resource group name $resource_group_name
    echo resource group location $network_card_location
    echo resource group id $resource_group_id
fi















if [ "$create_vm_windows_server" = true ] ; then
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo ======================================================================
    echo "============               create $windows_server_vm_name          ============="
    echo "============                  $minutes:$seconds                       ============="
    echo ======================================================================
    windows_server_enable_rdp=false
    windows_server_enable_ssh=false
    windows_server_enable_default=true
    if [ "$windows_server_enable_default" = true ] ; then
        az vm create --resource-group $resource_group_name \
            --name $windows_server_vm_name \
            --image Win2022AzureEditionCore \
            --public-ip-sku Standard \
            --admin-username $admin_username \
            --admin-password $admin_password 
    elif [ "$windows_server_enable_rdp" = true ] ; then
        az vm create --resource-group $resource_group_name \
            --name $windows_server_vm_name \
            --image Win2022AzureEditionCore \
            --public-ip-sku Standard \
            --nsg-rule RDP \
            --admin-username $admin_username \
            --admin-password $admin_password 
    elif [ "$windows_server_enable_ssh" = true ] ; then
        az vm create --resource-group $resource_group_name \
            --name $windows_server_vm_name \
            --image Win2022AzureEditionCore \
            --public-ip-sku Standard \
            --nsg-rule SSH \
            --admin-username $admin_username \
            --admin-password $admin_password
    fi
    echo
    echo
    echo
    duration=$SECONDS
    echo "$((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
    subscription=$(az account show --query "id" -o tsv)
    windows_server_vm_id="/subscriptions/$subscription/resourceGroups/VMResources/providers/Microsoft.Compute/virtualMachines/$windows_server_vm_name"
    windows_server_vm_ip=$(az vm show -d --resource-group $resource_group_name --name $windows_server_vm_name --query publicIps -o tsv)
    echo windows server vm id is $windows_server_vm_id
    echo windows server vm ip is $windows_server_vm_ip
    echo
    echo
    echo
    echo install ssh - not running
    # az vm extension set --resource-group $resource_group_name --vm-name $windows_server_vm_name --name WindowsOpenSSH --publisher Microsoft.Azure.OpenSSH --version 3.0
    echo opening firewall port 22 ssh 
    az network nsg rule create -g $resource_group_name --nsg-name $network_security_group_name -n allow-SSH --priority 1010 --source-address-prefixes Internet --destination-port-ranges 22 --protocol TCP
    query_vm_windows_server=true
    log_in_to_windows=true
fi




if [ "$set_auto_shutdown" = true ] ; then
    echo
    echo
    echo
    echo =============================================================================
    echo "============                  set auto shutdown                 ============="
    echo =============================================================================
    echo
    echo
    echo
    SHUTDOWN_TIME="18:00"
    AUTO_SHUTDOWN="true"
    AUTO_START="false"
    echo setting auto shutdown
    for VM_ID in $(az vm list -g $resource_group_name --query "[].id" -o tsv); do
        shut_down_object=$(az vm auto-shutdown --ids $VM_ID --time $SHUTDOWN_TIME --email $email_address --webhook $webhook_address)
        echo shut down object >> output.txt
        echo $shut_down_object >> output.txt
        echo shut down object name
        echo $shut_down_object | jq .name 
        echo $shut_down_object | jq .status
    done
    az vm auto-shutdown -g $resource_group_name -n $windows_server_vm_name --time 1730 --email $email_address --webhook $webhook_address
    az vm auto-shutdown -g $resource_group_name -n $ubuntu_vm_name --time 1730 --email $email_address --webhook $webhook_address
    az vm auto-shutdown -g $resource_group_name -n $ubuntu_vm_name_02 --time 1730 --email $email_address --webhook $webhook_address
    echo
    echo
    echo
    echo do it also for other machines ....
    sleep 20
    echo
    echo
    echo 
fi





if [ "$query_vm_windows_server" = true ] ; then
    echo
    echo
    echo
    echo ======================================================================
    echo "============          query vm - windows server         ============="
    echo ======================================================================
    subscription=$(az account show --query "id" -o tsv)
    windows_server_vm_id="/subscriptions/$subscription/resourceGroups/VMResources/providers/Microsoft.Compute/virtualMachines/$windows_server_vm_name"
    echo windows server vm id is $windows_server_vm_id 
    #az vm wait --created --ids $windows_server_vm_id
    windows_server_vm_id_hash=$(az vm show -d --resource-group $resource_group_name --name $windows_server_vm_name --query "vmId" -o tsv)    
    echo windows server vm id hash ... $windows_server_vm_id_hash
    windows_server_vm_size=$(az vm show -d --resource-group $resource_group_name --name $windows_server_vm_name --query "hardwareProfile.vmSize" -o tsv)
    echo windows server vm size ... $windows_server_vm_size
    windows_server_vm_fqdn=$(az vm show -d --resource-group $resource_group_name --name $windows_server_vm_name --query "fqdns" -o tsv)
    if [ ! -z "$windows_server_vm_fqdn" ] 
    then
        echo windows server vm fqdn is $windows_server_vm_fqdn
    fi
    windows_server_network_id=$(az vm show --resource-group $resource_group_name --name $windows_server_vm_name --query 'networkProfile.networkInterfaces[].id' -o tsv)
    echo windows server vm network id is $windows_server_network_id
    network_card_name=$(az network nic show --ids $windows_server_network_id --query "name" -o tsv)
    echo network card name $network_card_name
    windows_server_vm_public_ip_address=$(az vm show -d --resource-group $resource_group_name --name $windows_server_vm_name --query publicIps -o tsv)
    echo windows server vm public ip is $windows_server_vm_public_ip_address
    windows_server_vm_private_ip=$(az vm show -d --resource-group $resource_group_name --name $windows_server_vm_name --query privateIps -o tsv)        
    echo windows server vm private ip is $windows_server_vm_private_ip
    network_card_mac_address=$(az network nic show --ids $windows_server_network_id --query macAddress -o tsv)
    echo network card mac address $network_card_mac_address
    network_card_location=$(az network nic show --ids $windows_server_network_id --query location -o tsv)
    resource_group_name=$(az network nic show --ids $windows_server_network_id --query resourceGroup -o tsv)
    resource_group_id=$(az network nic show --ids $windows_server_network_id --query resourceGuid -o tsv)
    echo resource group location $network_card_location ... name $resource_group_name ... id $resource_group_id    
    echo querying network security group ... output sent to output.txt
    echo ====================================================================== >> output.txt
    echo ============          query network security group       ============= >> output.txt
    echo ====================================================================== >> output.txt
    echo az network nsg list ...
    az network nsg list > outputNetworkSecurityGroupInformation.txt
    echo >> output.txt
    echo >> output.txt
    echo >> output.txt
    echo az network nsg show ...
    az network nsg show -g $resource_group_name -n $network_security_group_name >> outputNetworkSecurityGroupInformation.txt
    echo >> output.txt
    echo >> output.txt
    echo >> output.txt
    echo az network nsg rule list ...
    az network nsg rule list --nsg-name $network_security_group_name --resource-group $resource_group_name
    echo >> output.txt
    echo >> output.txt
    echo >> output.txt
    echo
    echo
    echo
fi






if [ "$create_vm_windows_client" = true ] ; then
    echo
    echo
    echo
    echo ======================================================================
    echo "============           create vm - windows client        ============="
    echo ======================================================================
    echo
    echo
    echo
    image=MicrosoftWindowsDesktop:office-365:20h2-evd-o365pp-g2:19042.2846.230411
    az vm create \
        --name $windows_client_vm_name \
        --resource-group $resource_group_name  \
        --image $image \
        --admin-username $admin_username \
        --admin-password $admin_password \
        --size $size_02 \
        --public-ip-address "" \
        --nsg ""
    echo
    echo
    echo
else
    echo
    echo
    echo
    echo =============================================================================
    echo "============         create windows client vm - skipped        ============="
    echo =============================================================================
    echo
    echo
    echo
fi














if [ "$log_in_to_ubuntu_02" = true ] ; then
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo ======================================================================
    echo "============           logging in to $ubuntu_vm_name_02              ============="
    echo "============                  $minutes:$seconds                       ============="
    echo ======================================================================
    echo
    echo
    echo working directory
    pwd   
    echo ip address
    echo $ubuntu_vm_public_ip_address_02  
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo ==============================================================================
    echo "============   running script 04 query linux on $ubuntu_vm_name_02              ============="
    echo "============                  $minutes:$seconds                       ============="
    echo ==============================================================================
    echo
    echo
    echo
    ssh -i ~/.ssh/azureCliUbuntuLogin.pem $admin_username@$ubuntu_vm_public_ip_address_02 'bash -s' < ../awsLinux/script-04a-query-linux.sh
    echo
    echo
    echo
    duration=$SECONDS
    echo "$((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
    echo
    echo
    echo
fi








if [ "$log_in_to_red_hat" = true ] ; then
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo ======================================================================
    echo "============           logging in to $red_hat_vm_name             ============="
    echo "============                  $minutes:$seconds                       ============="
    echo ======================================================================
    echo
    echo
    echo working directory
    pwd   
    echo ip address
    echo $red_hat_vm_public_ip_address  
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo ==============================================================================
    echo "============   running script 04 query linux on $red_hat_vm_name             ============="
    echo "============                  $minutes:$seconds                       ============="
    echo ==============================================================================
    echo
    echo
    echo
    ssh -i ~/.ssh/azureCliUbuntuLogin.pem $admin_username@$red_hat_vm_public_ip_address 'bash -s' < ../awsLinux/script-04a-query-linux.sh
    echo
    echo
    echo
    duration=$SECONDS
    echo "$((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
    echo
    echo
    echo
fi













if [ "$log_in_to_debian" = true ] ; then
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo ======================================================================
    echo "============           logging in to $debian_vm_name              ============="
    echo "============                  $minutes:$seconds                       ============="
    echo ======================================================================
    echo
    echo
    echo working directory
    pwd   
    echo ip address
    echo $debian_vm_public_ip_address
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo ==============================================================================
    echo "============   running script 04 query linux on $debian_vm_name             ============="
    echo "============                  $minutes:$seconds                       ============="
    echo ==============================================================================
    echo
    echo
    echo
    ssh -i ~/.ssh/azureCliUbuntuLogin.pem $admin_username@$debian_vm_public_ip_address 'bash -s' < ../awsLinux/script-04a-query-linux.sh
    echo
    echo
    echo
    duration=$SECONDS
    echo "$((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
    echo
    echo
    echo
fi







if [ "$log_in_to_centos" = true ] ; then
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo ======================================================================
    echo "============           logging in to $centos_vm_name              ============="
    echo "============                  $minutes:$seconds                       ============="
    echo ======================================================================
    echo
    echo
    echo working directory
    pwd   
    echo ip address
    echo $centos_vm_public_ip_address
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo ==============================================================================
    echo "============   running script 04 query linux on $centos_vm_name              ============="
    echo "============                  $minutes:$seconds                       ============="
    echo ==============================================================================
    echo
    echo
    echo
    ssh -i ~/.ssh/azureCliUbuntuLogin.pem $admin_username@$centos_vm_public_ip_address 'bash -s' < ../awsLinux/script-04a-query-linux.sh
    echo
    echo
    echo
    duration=$SECONDS
    echo "$((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
    echo
    echo
    echo
fi











if [ "$log_in_to_open_suse" = true ] ; then
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo ======================================================================
    echo "============           logging in to $open_suse_vm_name             ============="
    echo "============                  $minutes:$seconds                       ============="
    echo ======================================================================
    echo
    echo
    echo working directory
    pwd   
    echo ip address
    echo $open_suse_vm_public_ip_address
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo ==============================================================================
    echo "============   running script 04 query linux on $open_suse_vm_name             ============="
    echo "============                  $minutes:$seconds                       ============="
    echo ==============================================================================
    echo
    echo
    echo
    ssh -i ~/.ssh/azureCliUbuntuLogin.pem $admin_username@$open_suse_vm_public_ip_address 'bash -s' < ../awsLinux/script-04a-query-linux.sh
    echo
    echo
    echo
    duration=$SECONDS
    echo "$((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
    echo
    echo
    echo
fi






















if [ "$log_in_to_windows" = true ] ; then
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    windows_server_login_start=$duration
    echo ======================================================================
    echo "============           logging in to $windows_server_vm_name          ============="
    echo "============                  $minutes:$seconds                       ============="
    echo ======================================================================
    echo
    echo
    echo
    # echo scripts to install on remote computer for remote management
    # pwsh -Command 'Install-Module -Name PSWSMan'
    # sudo pwsh -Command 'Install-WSMan'
    # Set-Item wsman:\localhost\Client\TrustedHosts -value 51.140.86.117
    # $passwd = convertto-securestring -AsPlainText -Force -String some_password_here
    # $cred = new-object -typename System.Management.Automation.PSCredential -argumentlist azureuser,$passwd
    # $session = new-pssession -computername 51.140.86.117 -credential $cred
    # echo attempt to log in to remote session
    # Enter-PSSession -ComputerName 51.140.86.117 -Credential (Get-Credential -UserName azureuser -Message "gimme the password")
    # Enter-PSSession -ComputerName 51.140.86.117 -Credential $cred
    # Enter-PSSession -HostName 51.140.86.117 -UserName azureuser
    echo working directory
    pwd   
    echo ip address
    echo $windows_server_vm_public_ip_address
    az vm extension set --resource-group $resource_group_name --vm-name $windows_server_vm_name --name WindowsOpenSSH --publisher Microsoft.Azure.OpenSSH --version 3.0
    duration=$SECONDS
    echo "$((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
    #ssh -i ~/.ssh/azureCliUbuntuLogin.pem $admin_username@$windows_server_vm_public_ip_address 'bash -s' < script.sh
    #ssh -i ~/.ssh/azureCliUbuntuLogin.pem $admin_username@$windows_server_vm_public_ip_address
    windows_server_output=$(az vm run-command invoke --resource-group $resource_group_name --name $windows_server_vm_name --command-id 'RunPowerShellScript' --scripts @scriptMaster.ps1)
    echo split this string
    echo $windows_server_output
    echo ddd
    duration=$SECONDS
    echo "$((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
    windows_server_login_end=$duration
    windows_server_login_duration=$(( $windows_server_login_end - $windows_server_login_start ))
    echo windows server login duration $windows_server_login_duration 
    echo "$(($windows_server_login_duration / 60)) : $(($windows_server_login_duration % 60))"
    echo
    echo
    echo
fi



















if [ "$list_kubernetes_clusters" = true ] ; then
    echo
    echo
    echo
    echo ===================================================================
    echo "============              list kubernetes             ============="
    echo ===================================================================
    echo
    echo
    echo
    echo azure kubernetes clusters show
    az aks show --resource-group $resource_group_name --name iHaveToSupplyAValidNameHere
    echo
    echo
    echo
else
    echo =======================================================================
    echo "============          list kubernetes skipped             ============="
    echo =======================================================================
    echo
    echo
    echo
fi
echo
echo
echo
deallocate_vms=false
if [ "$deallocate_vms" = true ] ; then
    az vm deallocate --resource-group $resource_group_name --name $ubuntu_vm_name
    az vm deallocate --resource-group $resource_group_name --name $windows_server_vm_name
fi
echo
echo
echo
if [ "$delete_vms" = true ] ; then
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo =======================================================================
    echo "============                 delete vms                    ============"
    echo "============                 $minutes:$seconds                       ============="
    echo =======================================================================
    echo
    echo
    echo
    echo delete ubuntu vm by vm id $ubuntu_machine_id
    az vm delete --ids $ubuntu_machine_id --yes
    echo
    echo
    echo
    echo delete windows server vm by vm name $windows_server_vm_name
    az vm delete --resource-group $resource_group_name --name $windows_server_vm_name --yes
    echo
    echo
    echo
    #echo delete ubuntu vm by vm name $ubuntu_vm_name
    #az vm delete --resource-group $resource_group_name --name $ubuntu_vm_name --yes
    echo
    echo
    echo
    #az vm delete --ids $(az vm list -g $resource_group_name --query "[].id" -o tsv) --force-deletion yes
    echo
    echo
    echo
fi
echo
echo
echo
echo ... waiting 2 minutes then deleting all servers and all resource groups so we start from scratch every time ...
sleep 120
delete_resource_groups=true
if [ "$delete_resource_groups" = true ] ; then
    echo
    echo
    echo
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
    echo "======================================================================="
    echo "============            delete resource groups             ============"
    echo "============                 $minutes:$seconds                       ============="
    echo "======================================================================="
    echo
    echo
    echo
    IFS=$'\n' resource_group_names=($(az group list --query [].name -o tsv))
    echo resource group names are ...
    printf '%s\n' "${resource_group_names[@]}"
    for resource_group_index in "${!resource_group_names[@]}"
    do
        resource_group_name=${resource_group_names[$resource_group_index]}
        echo $resource_group_name
        if [[ $resource_group_name = 'ResourceGroup'* ]]; then
            echo found a resource group ... with name ... $resource_group_name
            # az group wait --deleted --resource-group $resource_group_name
            az group delete --name $resource_group_name --yes
            # az group delete --name $resource_group_name --force-deletion-types Microsoft.Compute/virtualMachines
        fi
    done
fi
echo
echo
echo
duration=$SECONDS
minutes=$(( $duration / 60 ))
seconds=$(( $duration % 60 )) 
if [ "$seconds" -lt 10 ] ; then
    seconds="0"$seconds
fi
endTimeOnMasterScript=$(date +%s)
echo "======================================================================="
echo "============             azure script ended                ============"
echo "============                  $minutes:$seconds                       ============="
echo ============              unix time $endTimeOnMasterScript
echo ============              $endTimeOnMasterScript | perl -pe 's/(\d+)/localtime($1)/e'
echo "======================================================================="
echo
