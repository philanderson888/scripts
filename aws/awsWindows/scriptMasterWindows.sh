echo
echo
echo
echo which shell am i using
echo $SHELL 
$SHELL --version
echo
echo
echo
startTimeOnMasterScript=$(date +%s)
SECONDS=0
echo "=============================================================="
echo "=============================================================="
echo "=============================================================="
echo "====                                   azure                  ============="
echo "====                             build windows server         ============="
echo "====                              build ubuntu server         ============="
echo "====                            run web servers on both       ============="
echo "====                      script starts at unix time $startTimeOnMasterScript
echo "====                      script starts at $startTimeOnMasterScript | perl -pe 's/(\d+)/localtime($1)/e'
echo "=============================================================="
echo "=============================================================="
echo "=============================================================="
echo "=============================================================="
echo "====                  set functions                       ===="
echo "=============================================================="
getElapsedTime () {
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
}
print_status_of_progress () {
    getElapsedTime
    echo "=============================================================="
    echo "====                waypoint $waypoint $1"
    echo "====                         $minutes:$seconds                       ===="
    echo "=============================================================="
    if [ "$aws_cli_installed" = true ] ; then
        echo aws cli installed of version $aws_version
    elif [ "$aws_cli_already_installed" = true ] ; then
        echo aws cli already installed of version $aws_version
    fi
    if [ "$powershell_installed" = true ] ; then
        echo powershell version $powershell_version installed
    elif [ "$powershell_already_installed" = true ] ; then
        echo powershell version $powershell_version already installed=
    fi
    if [ "$environment_has_been_cleaned_before_start" = true ] ; then
        echo environment cleaned
    elif [ "$environment_has_been_cleaned_before_start" = false ] ; then
        echo environment not cleaned
    fi
    if [ "$resource_group_created" = true ] ; then
        echo resource group $resource_group_name created
    elif [ "$resource_group_already_created" = false ] ; then
        echo resource group $resource_group_name already created
    fi
    if [ "$resource_group_listed" = true ] ; then
        echo resource group listing done
    fi
    if [ "$vm_templates_queried" = true ] ; then
        echo vm templates queried
    elif [ "$vm_templates_queried" = false ] ; then
        echo vm templates not queried
    fi
    if [ "$vm_created" = true ] ; then
        echo vm $vm_name created from image $vm_image
        echo vm ip $public_ip_address
        echo os $os is of type $os_type
    fi
    if [ "$vm_queried" = true ] ; then
        echo vm $vm_name queried
    fi
    if [ "$query_network_security_group" = true ] ; then
        echo network security group queried
    fi
    if [ "$python_installed" = true ] ; then
        echo python is installed of version $python_version
        echo python platform is $python_platform_version
    fi
    if [ "$dnf_installed" = true ] ; then
        echo dnf installed on vm $vm_name
    elif [ "$dnf_installed" = false ] ; then
        echo dnf not installed on vm $vm_name as os is $os
    fi
    if [ "$os_updated" = true ] ; then
        echo os has been updated and upgraded
        echo os version is $python_platform_version
    fi
    if [ "$zsh_installed" = true ] ; then
        echo zsh $zsh_remote_version has been installed on $vm_name
    fi
    if [ "$git_installed" = true ] ; then
        echo git has been installed
    fi
    if [ "$install_services" = true ] ; then
        echo the following services will be installed ...
        if [ "$install_apache" = true ] ; then
            echo "    apache"
        fi
        if [ "$install_nginx" = true ] ; then
            echo "    nginx"
        fi
        if [ "$restart_services" = true ] ; then
            echo "    services restarted"
        fi
        if [ "$install_node" = true ] ; then
            echo "    node"
        fi
        if [ "$install_express" = true ] ; then
            echo "    express"
        fi
        if [ "$install_vue" = true ] ; then
            echo "    vue"
        fi
        if [ "$install_bun" = true ] ; then
            echo "    bun"
        fi
        if [ "$install_react" = true ] ; then
            echo "    react"
        fi
        unset install_services
    elif [ "$install_services" = false ] ; then
        echo services will not be installed
    fi
    if [ "$c_installed" = true ] ; then
        echo c compiler installed ... of version ...
        echo "${c_version:0:30}"
    fi
    if [ "$git_installed" = true ] ; then
        echo git has been installed
    fi
    if [ "$apache_installed" = true ] ; then
        echo apache has been installed
    fi
    if [ "$nginx_installed" = true ] ; then
        echo nginx has been
    fi
    if [ "$services_restarted" = true ] ; then
        echo services have been
    fi
    if [ "$node_installed" = true ] ; then
        echo node has been installed
    fi
    if [ "$express_installed" = true ] ; then
        echo express has been installed
    fi
    if [ "$vue_installed" = true ] ; then
        echo vue has been
    fi
    if [ "$bun_installed" = true ] ; then
        echo bun has been installed
    fi
    if [ "$react_installed" = true ] ; then
        echo react has been installed
    fi
}

# install
installing_powershell=false
installing_aws_cli=false

# authentication
logging_in_to_azure_portal=false
email_address=philanderson888@hotmail.com
webhook_address=https://notifyme.com

# rebuild option
clean_before_start=true

# resource group
resource_group_prefix=ResourceGroup
resource_group_index=01
resource_group_name=$resource_group_prefix$resource_group_index
resource_group_location=uksouth
list_resource_groups=true

# images
query_vm_image_templates=false
size=Standard_D2_v2
size02=Standard_D2as_v5
image=MicrosoftWindowsDesktop:office-365:20h2-evd-o365pp-g2:19042.2846.230411
os_type_debian=debian
os_type_fedora=fedora
os_ubuntu=ubuntu
ubuntu_image_name=Ubuntu2204
os=$os_ubuntu
if [[  "$os" == "$os_ubuntu" ]]; then
    os_type=$os_type_debian
fi

# vms
create_vm_windows_client=false
windows_server_vm_name=winServerVm01
network_security_group_name=winServerVm01NSG
windows_server_vm_ip_name=winServerVm01PublicIP    
windows_client_vm_name=winClientVm01
ubuntu_vm_name=ubuntuVm01
red_hat_vm_name=redHatVm01
debian_vm_name="debianVm01"
centos_vm_name="centosVm01"
suse_vm_name="openSuseVm01"
flatCarVmName="flatCarVm01"

# credentials
admin_username=azureuser
admin_password_file=adminPassword.txt
admin_password=$(cat $admin_password_file)
ssh_key_public=~/.ssh/azureCliUbuntuLogin.pub
ssh_key=~/.ssh/azureCliUbuntuLogin.pem
echo user $admin_username
echo pass $admin_password

# resource groups and vms
query_assets=true
query_vms=true
query_vm_windows_server=true
query_vm_ubuntu=true

# manage vms
list_vms=true

list_kubernetes_clusters=false

# vm cleanup
delete_vms=false
delete_resource_group=false

# output
touch output.txt
touch output-resource-groups.txt
touch output-network-security-group.txt 
touch output-azure-vm-image-templates.txt
touch output-azure_vms.txt

source ./script-01-install.sh

waypoint=01
print_status_of_progress "installing aws and powershell"

source ./script-02-log-in-to-azure.sh

waypoint=02
print_status_of_progress "log in to azure"

source ./script-03-query-azure-account.sh
waypoint=03
print_status_of_progress "query azure"

source ./script-04-clean-before-start.sh
waypoint=04
print_status_of_progress "clean environment"

source ./script-05-create-resource-group.sh
waypoint=05
print_status_of_progress "create resource group"

source ./script-06-list-resource-group-names.sh
waypoint=06
print_status_of_progress "list resource groups"

source ./script-07-query-vm-templates.sh
waypoint=07
print_status_of_progress "query vm templates"

echo "=============================================================="
echo "====                                   set vm                 ============="
echo "=============================================================="
if [ "$os" == "$os_ubuntu" ] ; then
    vm_name=$ubuntu_vm_name
    vm_image=$ubuntu_image_name
    vm_os_set=true
    create_vm=true
    echo we will be building a $os vm
fi
waypoint=09
print_status_of_progress "set vm type to be $os"

source ./script-10-create-vm.sh
waypoint=10
print_status_of_progress "vm created"

source ./script-11-query-vm.sh
waypoint=11
print_status_of_progress "vm queried"

source ./script-12-query-network-security-groups.sh
waypoint=12
print_status_of_progress "query network security group performed"


remote_shell_in_use=$(ssh -i $ssh_key $admin_username@$public_ip_address "$SHELL --version")
ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ../awsWindows/script-13-get-linux-version.sh
waypoint=13
echo test phil variable is $test_phil_variable
print_status_of_progress "log in and get linux version"

ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ../awsWindows/script-14-install-dnf.sh
waypoint=14
print_status_of_progress "dnf install"

ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ../awsWindows/script-16-update-server-to-latest-versions.sh
waypoint=16
print_status_of_progress "os updated"

install_services=true
if [ "$install_services" = true ] ; then
    install_apache=true
    install_nginx=true
    restart_services=true
    install_node=true
    install_express=false
    install_vue=false
    install_bun=false
    install_react=false
fi
waypoint=17
print_status_of_progress "deciding which services to install"



getElapsedTime
echo "=============================================================="
echo "====                                  install zsh                            ===="
echo "====                                   $minutes:$seconds                   ============="
echo "=============================================================="
ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ../awsWindows/script-18a-install-zsh.sh
zsh_installed=true
waypoint=18
print_status_of_progress zsh



echo "=============================================================="
echo "====                                  test zsh                               ===="
echo "====                                   $minutes:$seconds                   ============="
echo "=============================================================="
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ../awsWindows/script-18b-test-zsh.zsh
getElapsedTime
zsh_remote_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "zsh --version")    
echo yes i got the zsh remote version which is ...
echo $zsh_remote_version


echo "=============================================================="
echo "====                                  install oh my z                        ===="
echo "====                                   $minutes:$seconds                   ============="
echo "=============================================================="
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ../awsWindows/script-18c-install-oh-my-zsh.zsh
getElapsedTime
echo "=============================================================="
echo "====                                  test oh my zsh                         ===="
echo "====                                   $minutes:$seconds                   ============="
echo "=============================================================="
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ../awsWindows/script-18d-test-oh-my-zsh.zsh


getElapsedTime
echo "=============================================================="
echo "====                   install c compiler                            ===="
echo "====                             $minutes:$seconds                           ===="
echo "=============================================================="
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ../awsWindows/script-20-install-c-compiler.sh
echo "=============================================================="
echo "====                       upload c program                          ===="
echo "====                             $minutes:$seconds                           ===="
echo "=============================================================="
cd ../awsWindows
scp -i $ssh_key script-20a-hello-world.c $admin_username@$public_ip_address:script-20a-hello-world.c 
echo "=============================================================="
echo "====                          run c program                          ===="
echo "====                             $minutes:$seconds                           ===="
echo "=============================================================="
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ../awsWindows/script-20b-run-c-program.sh
waypoint=20
c_installed=true
c_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "gcc --version")
print_status_of_progress "c compiler"


echo "========================================================================"
echo "====                     install git                                ===="
echo "====                       $minutes:$seconds                        ===="
echo "========================================================================"
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ../awsWindows/script-21-install-git.sh
git_installed=true
waypoint=21
print_status_of_progress git


ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ../awsWindows/script-22-install-apache.sh
waypoint=22
apache_installed=true
print_status_of_progress apache


if [ "$install_nginx" = true ] ; then
    echo "=============================================================="
    echo "====                               install nginx               ============="
    echo "====                             $minutes:$seconds                           ===="
    echo "=============================================================="
    ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ../awsWindows/script-23-install-nginx.sh
    echo "=============================================================="
    echo "====                     install nginx complete                       ===="
    echo "=============================================================="
fi
if [ "$restart_services" = true ] ; then
    echo "=============================================================="
    echo "====                             update services              ============="
    echo "====                             $minutes:$seconds                           ===="
    echo "=============================================================="
    ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ../awsWindows/script-24-update-services.sh
    echo "=============================================================="
    echo "====                     update services complete                     ===="
    echo "=============================================================="
fi


if [ "$install_node" = true ] ; then
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ../awsWindows/script-25-install-node-npm.zsh
fi



if [ "$install_express" = true ] ; then
    echo "=============================================================="
    echo "====                            install express - remove this block               ============="
    echo "=============================================================="
    #ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ../awsWindows/script-26-test2.zsh
    #ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ../awsWindows/script-25-install-node.zsh
    #ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ../awsWindows/script-26-nothing.zsh
    #ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ../awsWindows/script-26-test.zsh
    #ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ../awsWindows/script-26-install-express.zsh
    #echo "=============================================================="
    #echo "====                     install express done                         ===="
    #echo "=============================================================="
fi
if [ "$install_vue" = true ] ; then
    echo "=============================================================="
    echo "====                               install vue                 ============="
    echo "=============================================================="
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ../awsWindows/script-28-install-vue.zsh
fi
if [ "$install_bun" = true ] ; then
    echo "=============================================================="
    echo "====                               install bun               ============="
    echo "=============================================================="
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ../awsWindows/script-30-install-bun.zsh
fi
if [ "$install_react" = true ] ; then
    echo "=============================================================="
    echo "====                   install react                      ===="
    echo "=============================================================="
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ../awsWindows/script-32-install-react.zsh
fi
echo "=============================================================="
echo "====                     running servers                  ===="
echo "=============================================================="
run_servers=true
if [ "$run_servers" = true ] ; then
    run_apache=false
    run_nginx=false
    run_node=true
    run_express=false
    run_vue=false
    run_bun=false
    run_react=false
fi
if [ "$apache_installed" = true ] && [ "$run_apache" = true ] ; then
    echo "=============================================================="
    echo "====                run apache web server                 ===="
    echo "=============================================================="
    open -a Terminal ./script-40-run-apache-web-server.sh
fi
if [ "$nginx_installed" = true ] && [ "$run_nginx" = true ] ; then
    echo "=============================================================="
    echo "====               run nginx web server                   ===="
    echo "=============================================================="
    source ./script-41-run-nginx-web-server.sh
fi
if [ "$node_installed" = true ] && [ "$run_node" = true ] ; then
    echo "======================================================================="
    echo ==================   running node web server  =====================
    echo "======================================================================="
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-41-run-node-web-server.sh
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ../awsLinux/script-06-run-node-web-server.sh
fi
if [ "$express_installed" = true ] && [ "$run_express" = true ] ; then
    echo "=============================================================="
    echo "====             run express web server                   ===="
    echo "=============================================================="
    source ../awsWindows/script-42-run-express-web-server.sh
fi
if [ "$vue_installed" = true ] && [ "$run_vue" = true ] ; then
    echo "=============================================================="
    echo "====               run vue web server                     ===="
    echo "=============================================================="
    source ../awsWindows/script-44-run-vue-web-server.sh
fi
if [ "$bun_installed" = true ] && [ "$run_bun" = true ] ; then
    echo "=============================================================="
    echo "====                 run bun web server                  ====="
    echo "=============================================================="
    source ../awsWindows/script-46-run-bun-web-server.sh
fi
if [ "$react_installed" = true ] && [ "$run_react" = true ] ; then
    echo "=============================================================="
    echo "====                run react web server                  ===="
    echo "=============================================================="
    source ../awsWindows/script-48-run-react-web-server.sh
fi
install_go=true
if [ "$install_go" = true ] ; then
    echo "=============================================================="
    echo "====                      upload go program"
    echo "====                         $minutes:$seconds"
    echo "=============================================================="
    cd ../awsWindows
    scp -i $ssh_key script-34.go $admin_username@$public_ip_address:script-34.go
    echo "=============================================================="
    echo "====                  install and run go                  ===="
    echo "=============================================================="
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-34-install-go.zsh
fi





list_vms=true
if [ "$list_vms" = true ] ; then
    echo
    echo
    echo
    echo "=============================================================="
    echo "====               list vms and storage                   ===="
    echo "=============================================================="
    echo list vms output to output-azure_vms.txt
    az vm list >> output-azure_vms.txt
    echo vm info >> output-azure_vms.txt
    az vm show --resource-group $resource_group_name --name $ubuntu_vm_name >> output-azure_vms.txt
    echo vm resource usage to >> output-azure_vms.txt
    az vm list-usage --location eastus >> output-azure_vms.txt
    echo list disks sent to >> output-azure_vms.txt
    echo list disks >> output-azure_vms.txt
    echo list disks --resource-group $resource_group_name >> output-azure_vms.txt
    echo storage profile sent to >> output-azure_vms.txt
    echo 
    echo storage profile >> output-azure_vms.txt
    az vm show --resource-group $resource_group_name --name $ubuntu_vm_name --query "storageProfile" >> output-azure_vms.txt
fi
echo
echo
echo
create_vm_windows_server=false
query_vm_windows_server=false
log_in_to_windows=false
if [ "$create_vm_windows_server" = true ] ; then
    getElapsedTime
    echo "=============================================================="
    echo "====                create $windows_server_vm_name"
    echo "====                    $minutes:$seconds"
    echo "=============================================================="
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
    echo "=============================================================="
    echo "====                                       set auto shutdown       ============="
    echo "=============================================================="
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
    shutdown_by_name=false
    if [ "$shutdown_by_name" = true ] ; then
        az vm auto-shutdown -g $resource_group_name -n $windows_server_vm_name --time 1730 --email $email_address --webhook $webhook_address
        az vm auto-shutdown -g $resource_group_name -n $ubuntu_vm_name         --time 1730 --email $email_address --webhook $webhook_address
    fi
fi
if [ "$query_vm_windows_server" = true ] ; then
    echo "=============================================================="
    echo "====                               query vm - windows server         ============="
    echo "=============================================================="
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
    echo "==============================================================" >> output.txt
    echo "====                               query network security group       =============" >> output.txt
    echo "==============================================================" >> output.txt
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
fi






if [ "$create_vm_windows_client" = true ] ; then
    echo "=============================================================="
    echo "====                                create vm - windows client        ============="
    echo "=============================================================="
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
    echo "=============================================================="
    echo "====                              create windows client vm - skipped        ============="
    echo "=============================================================="
    echo
    echo
    echo
fi
if [ "$log_in_to_windows" = true ] ; then
    getElapsedTime
    windows_server_login_start=$duration
    echo "=============================================================="
    echo "====                                log in to $windows_server_vm_name          ============="
    echo "====                                       $minutes:$seconds                       ============="
    echo "=============================================================="
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
    #ssh -i $ssh_key $admin_username@$windows_server_vm_public_ip_address 'bash -s' < script.sh
    #ssh -i $ssh_key $admin_username@$windows_server_vm_public_ip_address
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
    echo "=============================================================="
    echo "====                                list kubernetes           ============="
    echo "=============================================================="
    echo
    echo
    echo
    echo azure kubernetes clusters show
    az aks show --resource-group $resource_group_name --name iHaveToSupplyAValidNameHere
    echo
    echo
    echo
else
    echo "=============================================================="
    echo "====                             list kubernetes skipped      ============="
    echo "=============================================================="
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
echo "=============================================================="
echo "====                               list resource groups       ============="
echo "=============================================================="
source ./script-08-list-resource-groups.sh
echo
echo
echo
echo "=============================================================="
echo "====                                   list vms               ============="
echo "=============================================================="
source ./script-09-list-vms.sh
echo
echo
echo
if [ "$delete_vms" = true ] ; then
    getElapsedTime
    echo "=============================================================="
    echo "====                                      delete vms           ============"
    echo "====                                      $minutes:$seconds            ============="
    echo "=============================================================="
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
    getElapsedTime
    echo "====================================================================="
    echo "====                                 delete resource groups             ============"
    echo "====                                      $minutes:$seconds                    ============="
    echo "====================================================================="
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
getElapsedTime
endTimeOnMasterScript=$(date +%s)
echo "====================================================================="
echo "====                   azure script ended                        ===="
echo "====                   $minutes:$seconds"
echo "====                  unix time $endTimeOnMasterScript"
echo $endTimeOnMasterScript | perl -pe 's/(\d+)/localtime($1)/e'
echo "====================================================================="
