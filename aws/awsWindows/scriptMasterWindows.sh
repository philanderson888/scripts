# listing
list_resource_groups=true
resource_group_name=ResourceGroup02
resource_group_location=uksouth
list_vm_image_sizes=false
list_vms=true
list_vm_details=false
list_kubernetes_clusters=false
# creating
create_resource_group=false
create_vm_windows_server=true
create_vm_ubuntu_linux=false
create_vm_windows_client=false
# vm details
adminuser=azureuser
adminpass=
size=Standard_D2_v2
size02=Standard_D2as_v5
image=MicrosoftWindowsDesktop:office-365:20h2-evd-o365pp-g2:19042.2846.230411
# vm details windows
windows_server_vm_name=winServerVm01
windows_server_vm_ip_name=winServerVm01PublicIP    
winServerUser=azureuser
winServerPass=
windows_client_vm_name=winClientVm01
# vm details linux
ubuntu_vm_name=ubuntuVm01
ubuntu_vm_name_02=ubuntuVm02
red_hat_vm_name=redHatVm01
debian_vm_name="debianVm01"
centos_vm_name="centosVm01"
open_suse_vm_name="openSuseVm01"
flatCarVmName="flatCarVm01"
# query
query_vm_windows_server=true
query_vm_ubuntu_linux=true
# manage vms
manage_vms=true
# script timing
startTimeOnMasterScript=$(date +%s)


## use rdp to connect to Windows instance
## also available is aws nitro connection
## you don't need a public ipv4 address to connect  - see https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html for picture on how aws instance is set up 


## mac - install RDP client https://apps.apple.com/us/app/microsoft-remote-desktop/id1295203466?mt=12


## aws instance ec2 windows server - connect via aws session manager


## aws session manager - enable explorer as well - is this required?



#ec2-54-86-149-140.compute-1.amazonaws.com
#Administrator
#?tuaKBbW9H7U@;c@l4tJKzBckk!mu?XH


## giving up on aws

## instead installing azure cli
#brew update
#brew install azure-cli

## log in
#echo logging in to azure client
#az login 
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


## Who Is Logged In
az account list -o table
#read -p "press any key"


if [ "$list_resource_groups" = true ] ; then
    echo
    echo
    echo
    echo ==============================================================
    echo ============           resource groups           =============
    echo ==============================================================
    echo list resource groups
    az group list -o table
    echo
    echo
    echo
else
    echo =======================================================================
    echo ============         resource groups - skipped             ============
    echo =======================================================================
fi

if [ "$create_resource_group" = true ] ; then
    echo
    echo
    echo
    echo ==============================================================
    echo ============           resource groups           =============
    echo ==============================================================
    echo list resource groups
    az group list -o table
    echo
    echo
    echo
    echo creating resource group $resource_group_name in uk south region
    az group create --name $resource_group_name --location $resource_group_location
    echo
    echo
    echo
    echo listing resource groups after creating new one ...
    az group list -o table
    echo
    echo
    echo
else
    echo =======================================================================
    echo ============       creating resource group - skipped         ==========
    echo =======================================================================
fi



echo ==========================================================================
echo ============          list resource group resources          =============
echo ==========================================================================
az resource list -o table
az resource list -g $resource_group_name -o table
echo
echo
echo



if [ "$list_vm_image_sizes" = true ] ; then
    echo
    echo
    echo
    echo ==============================================================
    echo ============                images               =============
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
    az vm list-sizes -l $resource_group_location -o table
    echo
    echo
    echo
    echo azure vm list skus
    az vm list-skus
    echo
    echo
    echo
    az vm list-skus -l westus
    echo 
    echo
    echo
    echo find all Gen2 SKUs published by Microsoft Windows Desktop - skipped as huge output
    #az vm image list --publisher MicrosoftWindowsDesktop --sku g2 --output table --all
    echo
    echo
    echo
    echo find all Gen2 SKUs published by Microsoft Windows Desktop - skipped as huge output
    #az vm image list --publisher MicrosoftWindowsDesktop --sku gen2 --output table --all
    echo 
    echo
    echo
    echo find all Gen2 SKUs published by Canonical  - skipping for now as huge output ...
    # az vm image list --publisher Canonical --sku gen2 --output table --all
    echo
    echo
    echo
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
    echo ============       vm image templates - skipped            ============
    echo =======================================================================
fi


if [ "$list_vms" = true ] ; then
    echo
    echo
    echo
    echo ==============================================================
    echo ============              list vms                =============
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
    echo ============               list vm - skipped               ============
    echo =======================================================================
fi


if [ "$list_vm_details" = true ] ; then
    echo
    echo
    echo
    echo ===================================================================
    echo ============              list vm details             =============
    echo ===================================================================
    echo
    echo
    echo
    az vm list 
    az vm list -g $resource_group_name -o table
    az vm list -g $resource_group_name
    az vm list -g $resource_group_name -o table --show-details
    az vm list -g $resource_group_name --show-details
    echo
    echo
    echo
else
    echo =======================================================================
    echo ============        list vm details - skipped              ============
    echo =======================================================================
fi



if [ "$create_vm_windows_server" = true ] ; then
    echo
    echo
    echo
    echo ======================================================================
    echo ============          create vm - windows server         =============
    echo ======================================================================
    echo
    echo
    echo
    echo "... creating windows server ... synchronously ... "
    az vm create --resource-group $resource_group_name \
        --name $windows_server_vm_name \
        --image Win2022AzureEditionCore \
        --public-ip-sku Standard \
        --admin-username $winServerUser \
        --admin-password $winServerPass
    echo
    echo
    echo
    echo "... waiting for vm to build ..."
    subscription=$(az account show --query "id" -o tsv)
    windows_server_vm_id="/subscriptions/$subscription/resourceGroups/VMResources/providers/Microsoft.Compute/virtualMachines/$windows_server_vm_name"
    windows_server_vm_ip=$(az vm show -d --resource-group $resource_group_name --name $windows_server_vm_name --query publicIps -o tsv)
    #az vm wait --created --ids $windows_server_vm_id
    echo vms have been created 
    echo windows server vm id is $windows_server_vm_id
    echo windows server vm ip is $windows_server_vm_ip
    echo
    echo
    echo
else
    echo
    echo
    echo
    echo =============================================================================
    echo ============       create vm - windows server - skipped         =============
    echo =============================================================================
fi





if [ "$query_vm_windows_server" = true ] ; then
    echo
    echo
    echo
    echo ======================================================================
    echo ============          query vm - windows server         =============
    echo ======================================================================
    echo
    echo
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
    windows_server_vm_public_ip=$(az vm show -d --resource-group $resource_group_name --name $windows_server_vm_name --query publicIps -o tsv)
    echo windows server vm public ip is $windows_server_vm_public_ip
    windows_server_vm_private_ip=$(az vm show -d --resource-group $resource_group_name --name $windows_server_vm_name --query privateIps -o tsv)        
    echo windows server vm private ip is $windows_server_vm_private_ip
    network_card_mac_address=$(az network nic show --ids $windows_server_network_id --query macAddress -o tsv)
    echo network card mac address $network_card_mac_address
    network_card_location=$(az network nic show --ids $windows_server_network_id --query location -o tsv)
    resource_group_name=$(az network nic show --ids $windows_server_network_id --query resourceGroup -o tsv)
    resource_group_id=$(az network nic show --ids $windows_server_network_id --query resourceGuid -o tsv)
    echo resource group location $network_card_location ... name $resource_group_name ... id $resource_group_id    
    echo
    echo
    echo
else
    echo
    echo
    echo
    echo =============================================================================
    echo ============        query vm - windows server - skipped         =============
    echo =============================================================================
    echo
    echo
    echo
fi






if [ "$create_vm_windows_client" = true ] ; then
    echo
    echo
    echo
    echo ======================================================================
    echo ============           create vm - windows client        =============
    echo ======================================================================
    echo
    echo
    echo
    image=MicrosoftWindowsDesktop:office-365:20h2-evd-o365pp-g2:19042.2846.230411
    az vm create \
        --name $windows_client_vm_name \
        --resource-group $resource_group_name  \
        --image $image \
        --admin-username $adminuser \
        --admin-password $adminpass \
        --size $size_02 \
        --public-ip-address "" \
        --nsg ""
    echo
    echo
    echo
    echo
    echo
    echo
else
    echo
    echo
    echo
    echo =============================================================================
    echo ============          create vm - windows client - skipped      =============
    echo =============================================================================
    echo
    echo
    echo
fi










if [ "$create_vm_ubuntu_linux" = true ] ; then
    echo
    echo
    echo
    echo ======================================================================
    echo ============                 create ubuntu               =============
    echo ======================================================================
    echo
    echo
    echo
    echo create ubuntu 01 ...
    az vm create --name $ubuntu_vm_name --resource-group $resource_group_name  --image Ubuntu2204 --admin-username $adminuser --admin-password $adminpass
    echo
    echo
    echo
    echo "... ubuntu vm has been built ..."
    subscription=$(az account show --query "id" -o tsv)
    ubuntu_vm_id="/subscriptions/$subscription/resourceGroups/VMResources/providers/Microsoft.Compute/virtualMachines/$ubuntu_vm_name"
    #az vm wait --created --ids $ubuntu_vm_id
    echo ubuntu server vm id is $ubuntu_vm_id
    echo
    echo
    echo
    echo create ubuntu 02 .. asynchronously ...
    az vm create --name $ubuntu_vm_name_02 --resource-group $resource_group_name --image Ubuntu2204 --generate-ssh-keys --no-wait
    echo
    echo
    echo
else
    echo
    echo
    echo
    echo =============================================================================
    echo ============             create ubuntu - skipped                =============
    echo =============================================================================
    echo
    echo
    echo
fi










if [ "$query_vm_ubuntu_linux" = true ] ; then
    echo
    echo
    echo
    echo ======================================================================
    echo ============            query ubuntu linux               =============
    echo ======================================================================
    echo
    echo
    # echo "... waiting for vm to build ..."
    subscription=$(az account show --query "id" -o tsv)
    ubuntu_vm_id="/subscriptions/$subscription/resourceGroups/VMResources/providers/Microsoft.Compute/virtualMachines/$ubuntu_vm_name"
    # az vm wait --created --ids $ubuntu_vm_id $ubuntu_server_vm_id
    # echo vm has been created
    echo ubuntu server vm id is $ubuntu_vm_id

    echo resource group name $resource_group_name

    az vm show --resource-group $resource_group_name

    ubuntu_machine_id=$(az vm show --resource-group $resource_group_name --name $ubuntu_vm_name --query vmId -o tsv)
    echo ubuntu machine id $ubuntu_machine_id
    read -p "press any key"
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
    ubuntu_vm_public_ip=$(az vm show -d --resource-group $resource_group_name --name $ubuntu_vm_name --query publicIps -o tsv)
    echo ubuntu vm public ip is $ubuntu_vm_public_ip
    ubuntu_vm_private_ip=$(az vm show -d --resource-group $resource_group_name --name $ubuntu_vm_name --query privateIps -o tsv)        
    echo ubuntu vm private ip is $ubuntu_vm_private_ip
    network_card_mac_address=$(az network nic show --ids $ubuntu_network_id --query macAddress -o tsv)
    echo network card mac address $network_card_mac_address
    network_card_location=$(az network nic show --ids $ubuntu_network_id --query location -o tsv)
    resource_group_name=$(az network nic show --ids $ubuntu_network_id --query resourceGroup -o tsv)
    resource_group_id=$(az network nic show --ids $ubuntu_network_id --query resourceGuid -o tsv)
    echo resource group location $network_card_location ... name $resource_group_name ... id $resource_group_id    

else
    echo
    echo
    echo
    echo =============================================================================
    echo ============            query ubuntu linux - skipped            =============
    echo =============================================================================
    echo
    echo
    echo
fi




if [ "$create_linux_flavours" = true ] ; then
    echo
    echo
    echo
    echo =============================================================================
    echo ============               create linux flavours                 =============
    echo =============================================================================
    echo
    echo
    echo
    echo create ubuntu 02 .. asynchronously ...
    az vm create --name $ubuntu_vm_name_02 --resource-group $resource_group_name --image Ubuntu2204 --generate-ssh-keys --no-wait
    echo
    echo
    echo
    echo create redhat linux .. asynchronously ...
    az vm create --name $red_hat_vm_name --resource-group $resource_group_name --image RHELRaw8LVMGen2 --generate-ssh-keys --no-wait
    echo
    echo
    echo
    echo create debian linux .. asynchronously ...
    az vm create --name $debian_vm_name --resource-group $resource_group_name --image Debian11 --generate-ssh-keys --no-wait
    echo
    echo
    echo
    echo create centos linux ... asynchronously ...
    az vm create --name $centos_vm_name --resource-group $resource_group_name --image CentOS85Gen2 --generate-ssh-keys --no-wait
    echo
    echo
    echo
    echo create open suse linux ... asynchronously ...
    az vm create --name $open_suse_vm_name --resource-group $resource_group_name --image OpenSuseLeap154Gen2 --generate-ssh-keys --no-wait
    echo
    echo
    echo 
else
    echo
    echo
    echo
    echo =============================================================================
    echo ============           create linux flavours - skipped           =============
    echo =============================================================================
fi




   




if [ "$manage_vms" = true ] ; then
    echo
    echo
    echo
    echo ======================================================================
    echo ============                  manage vms                 =============
    echo ======================================================================
    echo

    #Start a VM	az vm start --resource-group myResourceGroup --name myVM
    #Stop a VM	az vm stop --resource-group myResourceGroup --name myVM
    #Deallocate a VM	az vm deallocate --resource-group myResourceGroup --name myVM
    #Restart a VM	az vm restart --resource-group myResourceGroup --name myVM
    #Redeploy a VM	az vm redeploy --resource-group myResourceGroup --name myVM
    #Delete a VM	az vm delete --resource-group myResourceGroup --name myVM
    #Get VM info
    #Task	Azure CLI commands
    #List VMs	az vm list
    #Get information about a VM	az vm show --resource-group myResourceGroup --name myVM
    #Get usage of VM resources	az vm list-usage --location eastus
    #Get all available VM sizes	az vm list-sizes --location eastus
    #Disks and images
    #Task	Azure CLI commands
    #Add a data disk to a VM	az vm disk attach --resource-group myResourceGroup --vm-name myVM --disk myDataDisk --size-gb 128 --new
    #List attached disks to a VM	az vm show --resource-group groupName --name vmName --query "storageProfile"
    #Resize a disk	az disk update --resource-group myResourceGroup --name myDataDisk --size-gb 256
    #Snapshot a disk	az snapshot create --resource-group myResourceGroup --name mySnapshot --source myDataDisk
    #Remove a data disk from a VM	az vm disk detach --resource-group myResourceGroup --vm-name myVM --disk myDataDisk
    #Create image of a VM	az image create --resource-group myResourceGroup --source myVM --name myImage
    #Create VM from image	az vm create --resource-group myResourceGroup --name myNewVM --image myImage

else
    echo =======================================================================
    echo ============            manage vms - skipped               ============
    echo =======================================================================
fi
echo
echo
echo






if [ "$list_kubernetes_clusters" = true ] ; then
    echo
    echo
    echo
    echo ===================================================================
    echo ============              list kubernetes             =============
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
    echo ============          list kubernetes skipped             =============
    echo =======================================================================
    echo
    echo
    echo
fi





echo =======================================================================
echo ============                 delete vms                    ============
echo =======================================================================
echo
echo
echo
echo delete ubuntu vm by vm id $ubuntu_machine_id
echo az vm delete --ids $ubuntu_machine_id --yes
echo
echo
echo delete windows server vm by vm name $windows_server_vm_name
az vm delete --resource-group $resource_group_name --name $windows_server_vm_name --yes
echo delete ubuntu vm by vm name $ubuntu_vm_name_02
az vm delete --resource-group $resource_group_name --name $ubuntu_vm_name_02 --yes

echo
echo
echo
az vm delete --ids $(az vm list -g $resource_group_name --query "[].id" -o tsv) --force-deletion yes
echo
echo
echo

echo =======================================================================
echo ============            delete resource groups             ============
echo =======================================================================
echo
echo
echo
az group wait --deleted --resource-group $resource_group_name

echo =======================================================================
echo ============             azure script ended                ============
echo =======================================================================
