clear
echo screen cleared
echo
echo
echo
echo shell running on mac
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
echo "====                      azure                           ===="
echo "====                build windows server                  ===="
echo "====                 build ubuntu server                  ===="
echo "====               run web servers on both                ===="
echo "====        script starts at unix time $startTimeOnMasterScript
echo "====        script starts at $startTimeOnMasterScript | perl -pe 's/(\d+)/localtime($1)/e'
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
printTime () {
    getElapsedTime
    echo "====                         $minutes:$seconds"
}
printHeading () {
    echo
    echo
    echo
    echo "=============================================================="
    echo "=============================================================="
    echo $1
    printTime
    echo "=============================================================="
    echo "=============================================================="
    echo
    echo
    echo
}
print_status_of_progress () {
    echo "=============================================================="
    echo "====                waypoint $waypoint $1"
    printTime
    echo "=============================================================="
    if [ "$aws_cli_installed" = true ] ; then
        echo aws cli installed of version $aws_version
    elif [ "$aws_cli_already_installed" = true ] ; then
        echo aws cli already installed of version $aws_version
    fi
    if [ "$powershell_installed" = true ] ; then
        echo powershell version $powershell_version installed
    elif [ "$powershell_already_installed" = true ] ; then
        echo powershell version $powershell_version already installed
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
    if [ "$vm_created" = true ] ; then
        echo vm $vm_name ... image $vm_image .. os $os type $os_type
        echo vm $vm_name has ip $public_ip_address
    fi
    if [ "$query_network_security_group" = true ] ; then
        echo network security group queried
    fi
    if [ "$remote_shell_obtained" = true ] ; then
        echo remote shell version $remote_shell
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
    if [ "$linux_details_obtained" = true ] ; then
        echo linux version $linux_version
        echo linux os details $linux_details
        echo linux codename $linux_codename
        echo linux id_like $linux_id_like
        echo python version $python_version
        echo python platform version $python_platform_version
    fi
    if [ "$zsh_installed" = true ] ; then
        echo zsh version $zsh_remote_version
    fi
    if [ "$fish_installed" = true ] ; then
        echo fish version $fish_version
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
        echo "c version ${c_version:0:30}"
    fi
    if [ "$cpp_installed" = true ] ; then
        echo "c++ version ${cpp_version:0:30}"
    fi
    if [ "$git_installed" = true ] ; then
        echo "git version $git_version"
    fi
    if [ "$services_restarted" = true ] ; then
        echo services have been
    fi
    if [ "$node_installed" = true ] ; then
        echo "node version $node_version"
    fi
    if [ "$npm_installed" = true ] ; then
        echo "npm version $npm_version"
    fi
    if [ "$npx_installed" = true ] ; then
        echo "npx version $npx_version"
    fi
    if [ "$maria_db_installed" = true ] ; then
        echo "maria db version $maria_db_version"
        echo "maria db version $maria_db_version_mysqladmin"
    fi
    if [ "$mongo_db_installed" = true ] ; then
        echo "mongo db version $mongo_db_version"
    fi
    if [ "$mongo_shell_installed" = true ] ; then
        echo "mongo shell version $mongo_shell_version"
    fi
    if [ "$dot_net_installed" = true ] ; then
        echo "dot net sdks $dot_net_sdks"
        echo "dot net runtimes $dot_net_runtimes"
    fi
    if [ "$docker_installed" = true ] ; then
        echo "docker version client $docker_version_client"
        echo "docker version server $docker_version_server"
    fi
    if [ "$apache_installed" = true ] ; then
        echo "apache version $apache_version"
    fi
    if [ "$nginx_installed" = true ] ; then
        echo "nginx version $nginx_version"
    fi
    if [ "$express_installed" = true ] ; then
        echo "express version   $express_version"
        echo "express version 2 $express_version_2"
    fi
    if [ "$vue_installed" = true ] ; then
        echo "vue version $vue_version"
    fi
    if [ "$bun_installed" = true ] ; then
        echo "bun version $bun_version"
    fi
    if [ "$react_installed" = true ] ; then
        echo "react version $react_version"
    fi
    if [ "$end_of_script" = true ] ; then
        echo list files and hidden files
        echo $list_files_and_hidden_files
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
resource_group_index=02
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
ubuntu_version=Ubuntu_2204_Jammy
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

# root directory
root_directory=~/github/scripts/aws/awsWindows
cd $root_directory

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



if [ "$os" == "$os_ubuntu" ] ; then
    vm_name=$ubuntu_vm_name
    vm_image=$ubuntu_image_name
    vm_os_set=true
    create_vm=true
fi
waypoint=09
print_status_of_progress "set vm type to be $os"

source ./script-10-create-vm.sh
waypoint=10
print_status_of_progress "vm created"

source ./script-11-query-vm.sh
waypoint=11
print_status_of_progress "query vm using azure cli"

source ./script-12-query-network-security-groups.sh
waypoint=12
print_status_of_progress "query network security group performed"

printHeading "====                    who am i USER"
remote_user=$(ssh -i $ssh_key $admin_username@$public_ip_address "whoami")
echo username $remote_user


printHeading "====                    get remote shell"
remote_shell=$(ssh -i $ssh_key $admin_username@$public_ip_address "bash --version")
remote_shell=${remote_shell:0:57}
remote_shell_obtained=true


printHeading "====                     query linux"
ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ./script-13-get-linux-version.sh
ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ../awsLinux/script-04a-query-linux.sh
linux_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "grep '^VERSION=' /etc/os-release")
linux_details=$(ssh -i $ssh_key $admin_username@$public_ip_address "hostnamectl")
linux_codename=$(ssh -i $ssh_key $admin_username@$public_ip_address "grep 'VERSION_CODENAME' /etc/os-release")
linux_id_like=$(ssh -i $ssh_key $admin_username@$public_ip_address "grep '^ID_LIKE' /etc/os-release")
python_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "python3 --version")
python_platform_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "python3 -mplatform")
linux_details_obtained=true
waypoint=13
print_status_of_progress "query linux"


printHeading "====                   dnf install"
ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ./script-14-install-dnf.sh
waypoint=14
print_status_of_progress "dnf install"


printHeading "====                   update os"
ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ./script-16-update-server-to-latest-versions.sh
python_platform_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "python3 -mplatform")
waypoint=16
print_status_of_progress "os updated"

install_services=true
if [ "$install_services" = true ] ; then
    install_apache=true
    install_nginx=true
    restart_services=true
    install_node=true
    install_express=true
    install_vue=true
    install_bun=true
    install_react=true
fi
waypoint=17
print_status_of_progress "deciding which services to install"


printHeading "====                       zsh                            ===="
ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ./script-18a-install-zsh.sh
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-18b-test-zsh.zsh
zsh_remote_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "zsh --version")    
zsh_installed=true
waypoint=18
print_status_of_progress zsh


printHeading "====                    oh my zsh                         ===="
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-18c-install-oh-my-zsh.zsh
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-18d-test-oh-my-zsh.zsh



printHeading "====          fish friendly interactive shell             ===="
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-19-fish.zsh
waypoint=19
fish_installed=true
fish_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "fish --version")
echo fish version $fish_version
print_status_of_progress fish


printHeading "====                      c                               ===="
scp -i $ssh_key script-20a-hello-world.c $admin_username@$public_ip_address:script-20a-hello-world.c 
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-20b-install-c-compiler.sh
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-20c-run-c-program.sh
waypoint=20
c_installed=true
c_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "gcc --version")
print_status_of_progress "c"


printHeading "====                      c++                             ===="
scp -i $ssh_key script-20d-hello-world.cpp $admin_username@$public_ip_address:script-20d-hello-world.cpp
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-20e-install-cpp-compiler.sh
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-20f-run-cpp-program.sh
waypoint=20
cpp_installed=true
cpp_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "g++ --version")
print_status_of_progress "c++"


printHeading "====                         git                          ===="
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-21-install-git.sh
git_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "git --version")
git_installed=true
waypoint=21
print_status_of_progress git

printHeading "====                        apache                        ===="
ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ./script-22-install-apache.sh
waypoint=22
apache_installed=true
apache_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "apache2 -v")
# For CentOS/RHEL/Fedora Linux server, type command: httpd -v
print_status_of_progress apache



if [ "$install_nginx" = true ] ; then
    printHeading "====                      nginx                           ===="
    ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ./script-23-install-nginx.sh
    nginx_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "nginx -v")
    waypoint=23
    nginx_installed=true
    print_status_of_progress nginx
fi


if [ "$restart_services" = true ] ; then
    printHeading "====               restart services                       ===="
    ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ./script-24-update-services.sh
fi


if [ "$install_node" = true ] ; then
    printHeading "====              node npm express                         ===="
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-25-install-node-npm.zsh
    waypoint=25
    node_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "node -v")
    npm_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "npm -v")
    express_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "npm list express")
    node_installed=true
    npm_installed=true
    express_installed=true
    print_status_of_progress node npm express
fi



if [ "$install_express" = true ] ; then
    printHeading "====                     express 26                        ===="
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-26-express.zsh
    express_version_2=$(ssh -i $ssh_key $admin_username@$public_ip_address "npm list express")
    express_installed_2=true
    echo "running express in second terminal"
    open -a Terminal ./script-26-launch-express.zsh
    waypoint=26
    print_status_of_progress "express 2"
fi

if [ "$install_vue" = true ] ; then
    printHeading "====                         vue                         ===="
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-28-install-vue.zsh
    waypoint=28
    vue_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "vue -v")
    vue_installed=true
    print_status_of_progress vue
fi

if [ "$install_bun" = true ] ; then
    printHeading "====                         bun                         ===="
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-30-install-bun.zsh
    waypoint=30
    bun_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "bun -v")
    bun_installed=true
    print_status_of_progress bun
fi
if [ "$install_react" = true ] ; then
    printHeading "====                        react                        ===="
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-32-install-react.zsh
    waypoint=32
    echo npx version is installed at way point 32 - install it earlier 
    npx_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "npx -v")
    react_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "react -v")
    npx_installed=true
    react_installed=true
    echo 
    echo
    echo
    echo - - - have a look at the file listing - does it contain package json files - - - 
    echo sleep 1
    sleep 1
    print_status_of_progress react
fi



printHeading "====                    running servers                  ===="
run_servers=true
if [ "$run_servers" = true ] ; then
    run_apache=true
    run_nginx=true
    run_node=true
    run_express=true
    run_vue=true
    run_bun=true
    run_react=true
fi
if [ "$apache_installed" = true ] && [ "$run_apache" = true ] ; then
    echo "=============================================================="
    echo "====                run apache web server                 ===="
    printTime
    echo "=============================================================="
    open -a Terminal ./script-40-run-apache-web-server.sh
fi
if [ "$nginx_installed" = true ] && [ "$run_nginx" = true ] ; then
    echo "=============================================================="
    echo "====               run nginx web server                   ===="
    printTime
    echo "=============================================================="
    echo nginx install works ... nothing to test at present
fi
if [ "$node_installed" = true ] && [ "$run_node" = true ] ; then
    echo "=============================================================="
    echo "====             running node web server                  ===="
    printTime
    echo "=============================================================="
    scp -i $ssh_key script-41-server.js $admin_username@$public_ip_address:script-41-server.js
    open -a Terminal ./script-41-launch-node.zsh
fi
if [ "$express_installed" = true ] && [ "$run_express" = true ] ; then
    echo "=============================================================="
    echo "====             run express web server                   ===="
    printTime
    echo "=============================================================="
    source ./script-42-run-express.sh
fi

run_vue=false
if [ "$vue_installed" = true ] && [ "$run_vue" = true ] ; then
    echo "=============================================================="
    echo "====               run vue web server                     ===="
    printTime
    echo "=============================================================="
    source ./script-44-run-vue-web-server.sh
fi
run_bun=false
if [ "$bun_installed" = true ] && [ "$run_bun" = true ] ; then
    echo "=============================================================="
    echo "====                 run bun web server                  ====="
    printTime
    echo "=============================================================="
    source ./script-46-run-bun-web-server.sh
fi
run_react=false
if [ "$react_installed" = true ] && [ "$run_react" = true ] ; then
    echo "=============================================================="
    echo "====                run react web server                  ===="
    printTime
    echo "=============================================================="
    source ./script-48-run-react-web-server.sh
fi


install_go=true
if [ "$install_go" = true ] ; then
    printHeading "====                install go - failing                 ===="
    cd $root_directory
    scp -i $ssh_key script-34.go $admin_username@$public_ip_address:script-34.go
    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-34-go.zsh
fi


install_java=true
if [ "$install_java" = true ] ; then
    printHeading "====                  install java                       ===="
    scp -i $ssh_key script-38-java.java $admin_username@$public_ip_address:script-38-java.java
    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-38-install-java.zsh
    waypoint=38
    java_c_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "javac -version")
    java_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "java -version")
    print_status_of_progress "java installed"
fi



install_maria_db=true
if [ "$install_maria_db" = true ] ; then
    printHeading "====            install maria db                    ===="
    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-43-maria-db.zsh
    waypoint=43
    maria_db_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "mariadb -V")
    maria_db_version_mysqladmin=$(ssh -i $ssh_key $admin_username@$public_ip_address "sudo mysqladmin version")
    maria_db_version_mysqladmin=${maria_db_version_mysqladmin:0:80}
    maria_db_installed=true
    print_status_of_progress "maria db"
fi





install_mongo_db=true
if [ "$install_mongo_db" = true ] ; then
    printHeading "====            install mongo db                    ===="
    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-44-mongo-db.zsh
    waypoint=44
    mongo_db_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "mongod --version")
    mongo_db_installed=true
    print_status_of_progress "mongo db"
fi



install_mongo_shell=true
if [ "$install_mongo_shell" = true ] ; then
    printHeading "====            install mongo shell                    ===="
    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-45-mongo-shell.zsh
    waypoint=45
    mongo_shell_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "mongosh --version")
    mongo_shell_installed=true
    print_status_of_progress "mongo shell"
fi




install_dot_net=true
if [ "$install_dot_net" = true ] ; then
    printHeading "====               install .net core               ===="
    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-50-dot-net.zsh
    waypoint=50
    dot_net_installed=true
    dot_net_sdks=$(ssh -i $ssh_key $admin_username@$public_ip_address "dotnet --list-sdks")
    echo dot net sdks
    echo $dot_net_sdks
    dot_net_runtimes=$(ssh -i $ssh_key $admin_username@$public_ip_address "dotnet --list-runtimes")
    echo dot net runtimes
    echo $dot_net_runtimes
    print_status_of_progress "dot net installed"
fi




install_docker=true
if [ "$install_docker" = true ] ; then
    printHeading "====               install docker                 ===="
    echo "====    note - maybe work through kubectl and minikube using interactive shell first * * * "
    scp -i $ssh_key script-51-docker-compose.yaml $admin_username@$public_ip_address:script-51-docker-compose.yaml
    scp -i $ssh_key script-51-kubectl.yaml $admin_username@$public_ip_address:script-51-kubectl.yaml
    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-51-docker.zsh
    waypoint=51
    docker_installed=true
    docker_version_client=$(ssh -i $ssh_key $admin_username@$public_ip_address "docker version --format '{{.Client.Version}}'")
    docker_version_server=$(ssh -i $ssh_key $admin_username@$public_ip_address "docker version --format '{{.Server.Version}}'")
    docker version --format '{{.Client.APIVersion}}'


    print_status_of_progress "docker"
fi




express_version_2=$(ssh -i $ssh_key $admin_username@$public_ip_address "npm list express")
node_installed=true
npm_installed=true
express_installed=true
print_status_of_progress install node and npm and express



list_vms=true
if [ "$list_vms" = true ] ; then
    echo
    echo
    echo
    echo "=============================================================="
    echo "====               list vms and storage                   ===="
    printTime
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
    echo "=============================================================="
    echo "====                create $windows_server_vm_name"
    printTime
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
    echo "====                  set auto shutdown                   ===="
    printTime
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
    echo "====               query vm - windows server              ===="
    printTime
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
    echo "====          query network security group                ====" >> output.txt
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
    echo "====            create vm - windows client                ===="
    printTime
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
else
    echo "=============================================================="
    echo "====        create windows client vm - skipped            ===="
    printTime
    echo "=============================================================="
fi
if [ "$log_in_to_windows" = true ] ; then
    windows_server_login_start=$duration
    echo "=============================================================="
    echo "====         log in to $windows_server_vm_name"
    printTime
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
    echo "=============================================================="
    echo "====                  list kubernetes                     ===="
    printTime
    echo "=============================================================="
    echo azure kubernetes clusters show
    az aks show --resource-group $resource_group_name --name iHaveToSupplyAValidNameHere
else
    echo "=============================================================="
    echo "====                list kubernetes skipped               ===="
    echo "=============================================================="
fi
deallocate_vms=false
if [ "$deallocate_vms" = true ] ; then
    az vm deallocate --resource-group $resource_group_name --name $ubuntu_vm_name
    az vm deallocate --resource-group $resource_group_name --name $windows_server_vm_name
fi
echo "=============================================================="
echo "====                 list resource groups                 ===="
printTime
echo "=============================================================="
source ./script-08-list-resource-groups.sh
echo
echo
echo
echo "=============================================================="
echo "====                      list vms                        ===="
printTime
echo "=============================================================="
source ./script-09-list-vms.sh
echo
echo
echo


printHeading "====           upload node teaching files                   ===="
cd ../awsWindows
scp -i $ssh_key script-90-teaching.js $admin_username@$public_ip_address:script-90-teaching.js
scp -i $ssh_key script-90-package.json $admin_username@$public_ip_address:script-90-package.json
printHeading "====           install and run teaching node                    ===="
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-90-teaching.zsh


printHeading "====              bash scripting a to z                    ===="
cd ../awsWindows
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-91-bash-commands.zsh



printHeading "====                     list files                        ===="
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-92-list-files.zsh





if [ "$delete_vms" = true ] ; then
    printHeading "====                      delete vms                      ===="
    echo delete ubuntu vm by vm id $ubuntu_machine_id
    az vm delete --ids $ubuntu_machine_id --yes
    #echo delete windows server vm by vm name $windows_server_vm_name
    #az vm delete --resource-group $resource_group_name --name $windows_server_vm_name --yes
    #echo delete ubuntu vm by vm name $ubuntu_vm_name
    #az vm delete --resource-group $resource_group_name --name $ubuntu_vm_name --yes
    #az vm delete --ids $(az vm list -g $resource_group_name --query "[].id" -o tsv) --force-deletion yes
fi
echo
echo
echo
delayBeforeEraseAllServers=120
delayInMinutesBeforeEraseAllServers=$(($delayBeforeEraseAllServers / 60))
echo ... waiting $delayInMinutesBeforeEraseAllServers minutes then deleting all servers and all resource groups so we start from scratch every time ...
sleep $delayBeforeEraseAllServers
delete_resource_groups=true
if [ "$delete_resource_groups" = true ] ; then
    echo "====================================================================="
    echo "====                  delete resource groups                     ===="
    printTime
    echo "====================================================================="
    IFS=$'\n' resource_group_names=($(az group list --query [].name -o tsv))
    echo resource group names are ...
    printf '%s\n' "${resource_group_names[@]}"
    for resource_group_index in "${!resource_group_names[@]}"
    do
        resource_group_name=${resource_group_names[$resource_group_index]}
        echo $resource_group_name
        if [[ $resource_group_name = 'ResourceGroup'* ]]; then
            echo found a resource group ... with name ... $resource_group_name
            az group delete --name $resource_group_name --yes
        fi
    done
fi
endTimeOnMasterScript=$(date +%s)
echo "====================================================================="
echo "====                   azure script ended                        ===="
printTime
echo "====                  unix time $endTimeOnMasterScript"
echo $endTimeOnMasterScript | perl -pe 's/(\d+)/localtime($1)/e'
echo "====================================================================="
