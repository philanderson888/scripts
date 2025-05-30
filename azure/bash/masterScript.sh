#clear
echo screen cleared
echo
echo
echo
echo script 61 step 4 fails - file does not exist
echo script 62 failing docker
echo script 63 failing docker
echo script 64 failing docker
echo one of the scripts is running npm install on the root of the ubuntu machine - should not be this way!
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
custom_spaces='                '
SECONDS=0
echo "=============================================================="
echo "=============================================================="
echo "=============================================================="
echo "====                      azure                           ===="
echo "====                  build linux server                  ===="
echo "====        script starts at unix time $startTimeOnMasterScript"
echo "====        script starts at " $startTimeOnMasterScript | perl -pe 's/(\d+)/localtime($1)/e'
echo "=============================================================="
echo "=============================================================="
echo "=============================================================="
sleep 2
echo
echo
echo "=============================================================="
echo "====            initialise script functions               ===="
echo "=============================================================="
sleep 2
echo
echo
getMinutesAndSeconds() {
    duration=$SECONDS
    minutes=$(( $duration / 60 ))
    seconds=$(( $duration % 60 )) 
    if [ "$seconds" -lt 10 ] ; then
        seconds="0"$seconds
    fi
}
printTime() {
    getMinutesAndSeconds
    echo "====                script elapsed time $minutes:$seconds"
}

printHeading () {
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo
    echo "=============================================================="
    echo "=============================================================="
    echo "====${custom_spaces}${1}"
    if [[ $# -gt 2 ]]; then
        echo "Get arguments: $@"
        echo "====${custom_spaces}${2}"
        echo "====${custom_spaces}${3}"
    elif [[ $# -gt 1 ]]; then
        echo "Get arguments: $@"
        echo "====${custom_spaces}${2}"
    fi
    printTime
    echo "=============================================================="
    echo "=============================================================="
}



get_waypoint() {
    waypoint_time=$SECONDS
    waypoint_start=$waypoint_end
    waypoint_end=$SECONDS
    waypoint_duration=$(( waypoint_end - waypoint_start ))  
    waypoints_length=$( echo $waypoints | jq length )
    waypoint_index=$(( waypoints_length ))
    echo
    echo
    echo
    echo "=============================================================="
    echo "====             waypoint $waypoint_index at $waypoint_start s took $waypoint_duration s - $waypoint_name "   
    printTime
    echo "=============================================================="
}




add_waypoint_to_waypoints() {
    waypoints=$(
        echo $waypoints | jq '. += 
        [
            {  
                "waypoint_index": "'"$waypoint_index"'",
                "waypoint_name": "'"$waypoint_name"'",
                "waypoint_start": "'"$waypoint_start"'",
                "waypoint_end": "'"$waypoint_end"'",
                "waypoint_duration": "'"$waypoint_duration"'"
            }
        ]'
    )
}


print_waypoints() {
    echo "=============================="
    echo "====      waypoints      ===="
    echo "=============================="
    waypoint_index=-1
    echo $waypoints | jq -c '.[]' | while read i; do
        waypoint_index=$(( waypoint_index + 1 ))
        waypoint_start=$(echo $i | jq -r '.waypoint_start')
        if [ $waypoint_index -eq 0 ] ; then
            echo waypoint $waypoint_index at $waypoint_start s - script start
        else
            waypoint_name=$(echo $i | jq -r '.waypoint_name')
            waypoint_duration=$(echo $i | jq -r '.waypoint_duration')
            echo waypoint $waypoint_index at $waypoint_start s took $waypoint_duration s - $waypoint_name
        fi
    done       
}

initialise_first_waypoint(){
    sleep 2
    waypoint_time=$SECONDS
    waypoint_name="script start"
    waypoint_index=0
    waypoint_start=0
    waypoint_end=0
    waypoint_duration=0
    waypoints=$(jq -s '.' <<< '
        { 
            "waypoint_index": "'"$waypoint_index"'",
            "waypoint_name": "'"$waypoint_name"'",
            "waypoint_start": "'"$waypoint_start"'",
            "waypoint_end": "'"$waypoint_end"'",
            "waypoint_duration": "'"$waypoint_duration"'"
        }'
    )
    echo $waypoints | jq > /dev/null
}

display_progress () {
    waypoint_name=$1
    get_waypoint
    add_waypoint_to_waypoints
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
        echo vm $vm_name ... image $vm_image .. os $vm_os type $vm_os_type
        echo vm $vm_name has ip $public_ip_address
    fi
    if [ "$query_network_security_group" = true ] ; then
        echo network security group queried
    fi
    if [ "$remote_bash_version_obtained" = true ] ; then
        echo remote shell version $remote_bash_version
    fi
    if [ "$dnf_installed" = true ] ; then
        echo dnf installed on vm $vm_name
    elif [ "$dnf_installed" = false ] ; then
        echo dnf not installed on vm $vm_name as os is $vm_os
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
        echo python platform version $python_platform_version
        #echo remote shell version ${remote_shell_version:0:57}
    fi
    if [ "$zsh_installed" = true ] ; then
        echo zsh version $zsh_remote_version
    fi
    if [ "$fish_installed" = true ] ; then
        echo $fish_version
    fi
    if [ "$python_installed" = true ] ; then
        echo python 3 version $python_3_version
        echo python platform version $python_platform_version
    fi
    if [ "$git_installed" = true ] ; then    
        echo $git_version
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
        if [ "$install_vite" = true ] ; then
            echo "    vite"
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
    if [ "$services_restarted" = true ] ; then
        echo services have been
    fi
    if [ "$node_installed" = true ] ; then
        echo "node version $node_version"
    fi
    if [ "$npm_installed" = true ] ; then
        echo "npm version $npm_version"
    fi
    if [ "$yarn_installed" = true ] ; then
        echo "yarn version $yarn_version"
    fi
    if [ "$npx_installed" = true ] ; then
        echo "npx version $npx_version"
    fi
    if [ "$maria_db_installed" = true ] ; then
        echo "maria db version $maria_db_version"
        echo "maria db version $maria_db_version_mysqladmin"
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
        echo "docker compose version $docker_compose_version"
    fi
    if [ "$terraform_installed" = true ] ; then
        echo "terraform version $terraform_version"
    fi
    if [ "$ansible_installed" = true ] ; then
        echo "ansible version $ansible_version"
    fi
    if [ "$apache_installed" = true ] ; then
        echo "=============================="
        echo "====      fix these       ===="
        echo "=============================="
        echo "apache version $apache_version"
    fi
    if [ "$nginx_installed" = true ] ; then
        echo "nginx version $nginx_version"
    fi
    if [ "$express_installed" = true ] ; then
        echo "express version   $express_version"
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
    if [ "$mongo_db_installed" = true ] ; then
        echo "mongo db version $mongo_db_version"
    fi
    if [ "$github_actions_done" = true ] ; then
        echo "github actions completed"
    fi
    if [ "$end_of_script" = true ] ; then
        echo list files and hidden files
        echo $list_files_and_hidden_files
    fi
    echo " "
    echo " "
    echo " "
    print_waypoints
}
initialise_first_waypoint

# number of installs
run_counter=$(cat .script_data/run_counter)
run_counter=$(( run_counter + 1 ))
echo there have been $run_counter runs of this script
echo store new value for next time
echo $run_counter > .script_data/run_counter

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

# linux
vm_os_type_debian=debian
vm_os_type_fedora=fedora
vm_1_name=vm01
vm_2_name=vm02
vm_3_name=vm03
vm_name=$vm_1_name

# ubuntu
vm_os_ubuntu=ubuntu
vm_image_ubuntu=Ubuntu2204

# debian
vm_os_debian=debian
vm_image_debian=Debian11

# redhat
vm_redhat_name=vmRedhat
vm_os_redhat=redhat
vm_image_redhat=RHELRaw8LVMGen2


# centos
vm_centos_name=vmCentos
vm_os_centos=centos
vm_image_centos=CentOS85Gen2

# opensuse
vm_opensuse_name=vmOpenSuse
vm_os_opensuse=opensuse
vm_image_opensuse=OpenSuseLeap154Gen2

# flatcar
vm_flatcar_name=vmFlatCarLinux
vm_os_flatcar=flatcar
vm_image_flatcar=FlatcarLinuxFreeGen2

# network security group
network_security_group_name=vm01NSG

# windows
windows_server_vm_name=winServerVm01
windows_network_security_group_name=winServerVm01NSG
windows_server_vm_ip_name=winServerVm01PublicIP    
windows_client_vm_name=winClientVm01

# os
printHeading "choose vm image"
install_os_frequency=10
install_os_counter=$(($run_counter % $install_os_frequency))
if [ $install_os_counter -lt 9 ] ; then
    vm_os=$vm_os_ubuntu
    vm_os_type=$vm_os_type_debian
    vm_image=$vm_image_ubuntu
else
    vm_os=$vm_os_debian
    vm_os_type=$vm_os_type_debian
    vm_image=$vm_image_debian
fi
display_progress "vm image chosen $vm_image .. os $vm_os of type $vm_os_type"

# credentials
printHeading "set credentials"
admin_username=azureuser
admin_password_file=adminPassword.txt
admin_password=$(cat $admin_password_file)
ssh_key_public=~/.ssh/azureCliUbuntuLogin.pub
ssh_key=~/.ssh/azureCliUbuntuLogin.pem
display_progress "credentials set - user $admin_username .. pass .."
github_credentials_file=.env
github_token=$(cat $github_credentials_file)
github_username=philanderson888
github_email=philanderson888@hotmail.com
echo github token $github_token
echo github username $github_username
echo github email $github_email

# resource groups and vms
query_assets=true
query_vms=true
query_vm_windows_server=false

# manage vms
list_vms=true

# cleanup
deallocate_vms=true
delete_vms=true
delete_resource_groups=true

# output
touch output.txt
touch output-resource-groups.txt
touch output-network-security-group.txt 
touch output-azure-vm-image-templates.txt
touch output-azure-vms.txt

# root directory
root_directory=~/github/scripts/azure/bash
cd $root_directory



printHeading "install libraries"
source ./script-01-install.sh
aws_version=$(aws --version)
aws_version="${aws_version:0:16}"
powershell_version=$(pwsh --version)
display_progress "install libraries"

printHeading "log in to cloud"
source ./script-02-log-in-to-azure.sh
display_progress "log in to cloud"

printHeading "query cloud resources"
source ./script-03-query-azure-account.sh
display_progress "query cloud resources"

printHeading "delete existing environments"
source ./script-04-clean-before-start.sh
display_progress "clean environment"

printHeading "create resource group"
source ./script-05-create-resource-group.sh
display_progress "create resource group"

printHeading "resource group details"
source ./script-06-resource-group-details.sh
display_progress "resource group details"

printHeading "query vm templates"
source ./script-07-query-vm-templates.sh
display_progress "query vm templates"

printHeading "create vm $vm_name using image $vm_image .. os $vm_os of type $vm_os_type"
source ./script-10-create-vm.sh
display_progress "vm created"

printHeading "list vms"
az vm list -o table
display_progress "list vms"

printHeading "query vm"
source ./script-11-query-vm.sh
display_progress "query vm using cloud provider"


printHeading "query network security group"
source ./script-12-query-network-security-groups.sh
display_progress "query network security group performed"


printHeading "who am i USER"
remote_user=$(ssh -i $ssh_key $admin_username@$public_ip_address "whoami")
echo username $remote_user


printHeading "get remote shell"
remote_bash_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "bash --version")
remote_bash_version=${remote_bash_version:0:57}
remote_bash_version_obtained=true


printHeading "query linux"
ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ./script-13-get-linux-version.sh
linux_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "grep '^VERSION=' /etc/os-release")
linux_details=$(ssh -i $ssh_key $admin_username@$public_ip_address "hostnamectl")
linux_codename=$(ssh -i $ssh_key $admin_username@$public_ip_address "grep 'VERSION_CODENAME' /etc/os-release")
linux_id_like=$(ssh -i $ssh_key $admin_username@$public_ip_address "grep '^ID_LIKE' /etc/os-release")
python_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "python3 --version")
python_platform_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "python3 -mplatform")
linux_details_obtained=true
display_progress "query linux"




printHeading "dnf install"
ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ./script-14-install-dnf.sh
display_progress "dnf install"


printHeading "update os"
ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ./script-16-update-server-to-latest-versions.sh
python_platform_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "python3 -mplatform")
display_progress "os updated"


printHeading "installing services"
install_services=true

if [ "$install_services" = true ] ; then

    echo
    echo run counter is
    echo $run_counter

    install_zsh=true
    install_fish=false
    install_fish_frequency=10
    install_fish_counter=$(($run_counter % $install_fish_frequency))
    if [ $install_fish_counter -eq 0 ] ; then
        install_fish=true
    fi
    
    install_python=true
    install_git=true

    restart_services=true
    
    install_apache=true
    install_nginx=false

    install_node=true
    install_express=true
    install_vue=false
    install_vite=false
    install_bun=false
    install_react=false
    test_web_servers_via_curl=false
    test_web_servers_in_browser=false

    install_c=false
    install_cpp=false
    install_mongo_db=false
    install_mongo_shell=false
    install_dot_net=false
    install_maria_db=false
    install_java=false
    install_go=false

    install_docker=true
    install_terraform=true
    install_ansible=true
    list_kubernetes_clusters=false
    github_actions=true

    install_nginx_frequency=3
    install_nginx_counter=$(($run_counter % $install_nginx_frequency))
    if [ $install_nginx_counter -eq 0 ] ; then
        install_nginx=true
    fi

    install_frequency=30
    install_counter=$(($run_counter % $install_frequency))
    install_counter=-1

    if [ $install_counter -eq 1 ] ; then
        install_c=true
    elif [ $install_counter -eq 2 ] ; then
        install_cpp=true
    elif [ $install_counter -eq 4 ] ; then
        install_mongo_db=true
        install_mongo_shell=true
    elif [ $install_counter -eq 5 ] ; then
        install_dot_net=true
    elif [ $install_counter -eq 6 ] ; then
        install_maria_db=true
    elif [ $install_counter -eq 7 ] ; then
        install_java=true
    elif [ $install_counter -eq 8 ] ; then
        install_go=true
    elif [ $install_counter -eq 9 ] ; then
        install_docker=true
        install_terraform=true
        install_ansible=true
        github_actions=true
        list_kubernetes_clusters=true
    fi

    learning_mode=false
    install_learning_frequency=5
    install_learning_counter=$(($run_counter % $install_learning_frequency))
    if [ $install_learning_counter -eq 0 ] ; then
        learning_mode=true
    fi
    learning_mode=true

    create_vm_windows_server=false
    create_vm_windows_client=false
    install_windows_frequency=8
    install_windows_counter=$(($run_counter % $install_windows_frequency))
    if [ $install_windows_counter -lt -1 ] ; then
        create_vm_windows_server=true
        create_vm_windows_client=true
    fi

fi







if [ "$install_zsh" = true ] ; then
    printHeading "install zsh"
    ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ./script-18-install-zsh.sh
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-18-test-zsh.zsh
    zsh_remote_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "zsh --version")    
    zsh_installed=true
    display_progress zsh
fi





install_oh_my_zsh=true
if [ "$install_oh_my_zsh" = true ] ; then
    printHeading "install oh my zsh"
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-18-install-oh-my-zsh.zsh
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-18-test-oh-my-zsh.zsh
    display_progress "install zsh oh-my-zsh"
fi





if [ "$install_fish" = true ] ; then
    printHeading "fish friendly interactive shell"
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-18-fish.zsh
    fish_installed=true
    fish_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "fish --version")
    display_progress fish
fi





if [ "$install_python" = true ] ; then
    printHeading "python"
    scp -i $ssh_key script-19-pandas.py $admin_username@$public_ip_address:script-19-pandas.py
    scp -i $ssh_key script-19-numpy.py $admin_username@$public_ip_address:script-19-numpy.py
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-19-python.zsh
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-19-python-pip.zsh
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-19-pandas.zsh
    python_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "python3 --version")
    python_3_installed=true
    display_progress python
fi




if [ "$install_git" = true ] ; then
    printHeading "git"
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-21-install-git.sh
    git_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "git --version")
    git_installed=true
    display_progress git
fi



if [ "$install_c" = true ] ; then
    printHeading "c"
    scp -i $ssh_key script-20a-hello-world.c $admin_username@$public_ip_address:script-20a-hello-world.c 
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-20b-install-c-compiler.sh
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-20c-run-c-program.sh
    c_installed=true
    c_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "gcc --version")
    display_progress "c"
fi



if [ "$install_cpp" = true ] ; then
    printHeading "c++"
    scp -i $ssh_key script-20d-hello-world.cpp $admin_username@$public_ip_address:script-20d-hello-world.cpp
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-20e-install-cpp-compiler.sh
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-20f-run-cpp-program.sh
    cpp_installed=true
    cpp_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "g++ --version")
    display_progress "c++"
fi







if [ "$install_apache" = true ] ; then
    printHeading "apache"
    ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ./script-22-install-apache.sh
    apache_installed=true
    #apache_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "apache2 -v")
    apache_version="cant get apache version ..."
    display_progress apache
fi






if [ "$install_nginx" = true ] ; then
    printHeading "nginx"
    ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ./script-23-install-nginx.sh
    nginx_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "nginx -v")
    nginx_version="cant get nginx version ..."
    nginx_installed=true
    display_progress nginx
fi




if [ "$restart_services" = true ] ; then
    printHeading "restart services"
    ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ./script-24-update-services.sh
fi





if [ "$install_node" = true ] ; then
    printHeading "install node npm yarn - and express"
    ssh -i $ssh_key $admin_username@$public_ip_address 'bash -s' < ./script-25-install-node.sh

    chmod 777 ./script-25-phil.sh
    echo note ttab command must only be run from mac terminal not vscode shell
    ttab './script-25-phil.sh'
    
    sleep 2
    node_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "node -v")
    npm_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "npm -v")
    express_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "npm list express")
    express_version="cant get express version"
    yarn_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "yarn -v")
    node_installed=true
    npm_installed=true
    express_installed=true
    yarn_installed=true
    display_progress node npm yarn
fi












if [ "$install_express" = true ] ; then
    printHeading "express"

    echo express 01 is generated
    chmod 777 ./script-26-launch-express-01.sh
    echo note ttab command must only be run from mac terminal not vscode shell
    echo ttab script 26 launch express 01
    ttab './script-26-launch-express-01.sh'

    express_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "npm list express")
    express_version="cant get express version"
    express_installed=true

    echo express 02 is cloned from github
    chmod 777 ./script-26-launch-express-02.sh
    echo ttab script 26 launch express 02
    ttab './script-26-launch-express-02.sh'

    display_progress express
fi




if [ "$install_vue" = true ] ; then
    printHeading "install and run vue"
    cd $root_directory
    chmod 777 ./script-28-launch-vue.sh
    echo note ttab command must only be run from mac terminal not vscode shell
    echo ttab script 28 launch vue
    ttab './script-28-launch-vue.sh'
    vue_version="cant get vue version ..."
    vue_installed=true
    display_progress vue
fi







if [ "$install_vite" = true ] ; then
    printHeading "install and run vite"
    cd $root_directory
    sleep 1
    chmod 777 ./script-29-launch-vite.sh
    ttab './script-29-launch-vite.sh'
    vite_version="cant get vite version ..."
    vite_installed=true
    display_progress vite
fi








if [ "$install_bun" = true ] ; then
    printHeading "bun"
    cd $root_directory
    chmod 7777 ./script-30-launch-bun.sh
    echo note ttab command must only be run from mac terminal not vscode shell
    echo ttab script 30 launch bun
    ttab './script-30-launch-bun.sh'
    bun_version="cant get bun version ..."
    bun_installed=true
    display_progress bun
fi





if [ "$install_react" = true ] ; then
    printHeading "install and run react and npx"
    cd $root_directory
    chmod 7777 ./script-32-launch-react.sh
    echo note ttab command must only be run from mac terminal not vscode shell
    echo ttab script 32 launch react
    ttab './script-32-launch-react.sh'
    npx_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "npx -v")
    react_version="cant get react version ..."
    npx_installed=true
    react_installed=true
    display_progress react
fi













































if [ "$apache_installed" = true ] ; then
    printHeading "apache"
    open -a Terminal ./script-40-run-apache-web-server.sh
fi






if [ "$nginx_installed" = true ] ; then
    printHeading "nginx"
    echo nginx install works ... nothing to test at present
fi
















if [ "$install_go" = true ] ; then
    printHeading "install go is failing                 ===="
    cd $root_directory
    scp -i $ssh_key script-34.go $admin_username@$public_ip_address:script-34.go
    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-34-go.zsh
fi




if [ "$install_java" = true ] ; then
    printHeading "install java"
    scp -i $ssh_key script-38-java.java $admin_username@$public_ip_address:script-38-java.java
    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-38-install-java.zsh
    java_c_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "javac -version")
    java_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "java -version")
    display_progress "java installed"
fi



if [ "$install_maria_db" = true ] ; then
    printHeading "maria db"
    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-43-maria-db.zsh
    maria_db_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "mariadb -V")
    maria_db_version_mysqladmin=$(ssh -i $ssh_key $admin_username@$public_ip_address "sudo mysqladmin version")
    maria_db_version_mysqladmin=${maria_db_version_mysqladmin:0:80}
    maria_db_installed=true
    display_progress "maria db"
fi






if [ "$install_mongo_db" = true ] ; then
    printHeading "mongo db"
    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-44-mongo-db.zsh
    mongo_db_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "mongod --version")
    mongo_db_installed=true
    display_progress "mongo db"
fi






if [ "$install_mongo_shell" = true ] ; then
    printHeading "mongo shell"
    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-45-mongo-shell.zsh
    mongo_shell_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "mongosh --version")
    mongo_shell_installed=true
    display_progress "mongo shell"
fi





if [ "$install_dot_net" = true ] ; then
    printHeading ".net core"
    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-50-dot-net.zsh
    dot_net_installed=true
    dot_net_sdks=$(ssh -i $ssh_key $admin_username@$public_ip_address "dotnet --list-sdks")
    echo dot net sdks
    echo $dot_net_sdks
    dot_net_runtimes=$(ssh -i $ssh_key $admin_username@$public_ip_address "dotnet --list-runtimes")
    echo dot net runtimes
    echo $dot_net_runtimes
    display_progress "dot net installed"
fi




if [ "$install_docker" = true ] ; then
    printHeading "docker"
    echo "====    note - maybe work through kubectl and minikube using interactive shell first * * * "
    scp -i $ssh_key script-51-docker-compose.yaml $admin_username@$public_ip_address:script-51-docker-compose.yaml
    scp -i $ssh_key script-51-kubectl.yaml $admin_username@$public_ip_address:script-51-kubectl.yaml
    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-51-docker.zsh
    docker_installed=true
    docker_version_client=$(ssh -i $ssh_key $admin_username@$public_ip_address "docker version --format '{{.Client.Version}}'")
    docker_version_server=$(ssh -i $ssh_key $admin_username@$public_ip_address "docker version --format '{{.Server.Version}}'")
    docker version --format '{{.Client.APIVersion}}'
    docker_compose_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "docker-compose -v")
    display_progress "docker"
fi






if [ "$install_terraform" = true ] ; then
    printHeading "terraform"
    scp -i $ssh_key script-52-terraform.tf $admin_username@$public_ip_address:script-52-terraform.tf
    scp -i $ssh_key script-52-terraform-main.tf $admin_username@$public_ip_address:script-52-terraform-main.tf
    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-52-terraform.zsh
    terraform_installed=true
    terraform_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "terraform -v")
    display_progress "terraform"
fi





if [ "$install_ansible" = true ] ; then
    printHeading "ansible"
    scp -i $ssh_key script-53-ansible.yaml $admin_username@$public_ip_address:script-53-ansible.yaml
    scp -i $ssh_key script-53-inventory.ini $admin_username@$public_ip_address:script-53-inventory.ini 
    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-53-ansible.zsh
    ansible_installed=true
    ansible_version=$(ssh -i $ssh_key $admin_username@$public_ip_address "ansible --version")
    display_progress "ansible"
fi




printHeading "github actions"
echo github actions ... build test and deploy code 
echo github actions ... can add labels when issue is created, for example
echo github actions run on linux windows or macos machines called 'runners'
echo github actions ... workflow is triggered ... on event ...
echo ... workflow contains jobs ... in sequence or in parallel
echo ... each job runs in own runner vm or container
echo ... each job has a number of steps ...
echo ... each step runs a script or an action which is a reusable extension
echo event
echo ... triggers workflow ... defined in yaml ...
echo ... workflows in .github/workflows folder
echo ... event ... workflow ...  
echo ... vm runner 1 runs job 1 ... steps ... either actions or scripts ... 
echo ... jobs .. can have dependencies if desired ...
echo
echo run all my code on a commit, not just when i want to run it?
echo
echo
echo
echo github action links
echo https://docs.github.com/en/actions/quickstart
echo
echo
echo sample given 
echo ... installs bash testing framework 
echo https://www.npmjs.com/package/bats








if [ "$github_actions" = true ] ; then
    printHeading "github actions - deploy web app"
    echo firstly install and run web app on new tab
    chmod 777 ./script-54-github-actions-create-app.zsh
    echo note ttab command must only be run from mac terminal not vscode shell
    echo ttab script 54 create web app
    ttab './script-54-github-actions-create-app.zsh'
    sleep 10
    echo secondly test web app after waiting 10 seconds
    echo should get a curl back if successful
    chmod 777 ./script-54-github-actions-test-app.zsh
    ./script-54-github-actions-test-app.zsh
    echo now we know the web app works we can try to deploy it 
    echo request is to deploy it first to a docker container then deploy that container
    echo firstly then deploy web app to docker container
    echo docker image holds code
    echo dockerfile is used to build docker image using bash script
    echo docker container is the running app
    echo docker compose allows control over running app via yaml
    echo
    echo
    echo
    echo now lets try to deploy a web app
    echo first stage is to create a docker image
    echo
    echo
    echo
    printHeading "create hello world docker image"
    printHeading "script 61 - deploy app built on mac"
    scp -i $ssh_key script-61-dockerfile $admin_username@$public_ip_address:script-61-dockerfile
    scp -i $ssh_key -r ~/temp/myExpressApp $admin_username@$public_ip_address:myExpressApp
    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-61-create-docker.zsh

    printHeading "script 62 - deploy app build on ubuntu"
    scp -i $ssh_key script-62-dockerfile $admin_username@$public_ip_address:script-62-dockerfile
    scp -i $ssh_key -r ~/temp/myExpressApp $admin_username@$public_ip_address:myExpressApp
    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-62-create-docker.zsh

    printHeading "script 63 - deploy simple node app on docker"
    scp -i $ssh_key script-63-dockerfile $admin_username@$public_ip_address:script-63-dockerfile
    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-63-create-docker.zsh

    printHeading "script 64 - deploy simple node web app on docker"
    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-64-docker.zsh

    printHeading "script 65 - deploy medical app back end on docker"

    touch ./script-65-github-token.txt
    echo $github_token > ./script-65-github-token.txt
    scp -i $ssh_key ./script-65-github-token.txt $admin_username@$public_ip_address:script-65-github-token.txt

    touch ./script-65-github-username.txt
    echo $github_username > ./script-65-github-username.txt
    scp -i $ssh_key ./script-65-github-username.txt $admin_username@$public_ip_address:script-65-github-username.txt

    touch ./script-65-github-email.txt
    echo $github_email > ./script-65-github-email.txt
    scp -i $ssh_key ./script-65-github-email.txt $admin_username@$public_ip_address:script-65-github-email.txt

    ssh -T -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-65-build-medical-app-backend.sh

    rm ./script-65-github-token.txt
    rm ./script-65-github-username.txt
    rm ./script-65-github-email.txt

    github_actions_done=true
    display_progress "github actions"
fi







echo
echo
echo
if [ "$create_vm_windows_server" = true ] ; then
    printHeading "create $windows_server_vm_name"
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
    az network nsg rule create -g $resource_group_name --nsg-name $windows_network_security_group_name -n allow-SSH --priority 1010 --source-address-prefixes Internet --destination-port-ranges 22 --protocol TCP
    query_vm_windows_server=true
    log_in_to_windows_server=true
fi








if [ "$set_auto_shutdown" = true ] ; then
    sleep 1
    printHeading "set auto shutdown"
    SHUTDOWN_TIME="18:00"
    AUTO_SHUTDOWN="true"
    AUTO_START="false"
    echo setting auto shutdown at $SHUTDOWN_TIME
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
        az vm auto-shutdown -g $resource_group_name -n $vm_1_name         --time 1730 --email $email_address --webhook $webhook_address
        az vm auto-shutdown -g $resource_group_name -n $vm_2_name         --time 1730 --email $email_address --webhook $webhook_address
    fi
fi







if [ "$query_vm_windows_server" = true ] ; then
    printHeading "query vm - windows server"
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
if [ "$log_in_to_windows_server" = true ] ; then
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
    printHeading "list kubernetes"
    echo azure kubernetes clusters show
    az aks show --resource-group $resource_group_name --name iHaveToSupplyAValidNameHere
fi














if [ "$learning_mode" = true ] ; then
    sleep 1
    printHeading "upload node teaching files"
    scp -i $ssh_key script-90-learn-node.js $admin_username@$public_ip_address:script-90-learn-node.js
    scp -i $ssh_key script-90-package.json $admin_username@$public_ip_address:script-90-package.json
    printHeading "install and run teaching node"
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-90-learn-node-js.zsh
    sleep 1
    printHeading "bash scripting a to z"
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ~/github/scripts/bash/2025-01-learn-bash.sh
    sleep 1
    printHeading "python"
    ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-93-learn-python.zsh
fi







printHeading "list files"
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-95-list-files.zsh


















printHeading "confirm vm details"
IFS=$'\n' resource_group_names=($(az group list --query [].name -o tsv))
resource_group_valid_name=invalid
for resource_group_index in "${!resource_group_names[@]}"
do
    resource_group_name=${resource_group_names[$resource_group_index]}
    echo $resource_group_name
    if [[ $resource_group_name = 'ResourceGroup'* ]]; then
        resource_group_valid_name=$resource_group_name
    fi
done
resource_group_name=$resource_group_valid_name
ssh_key=~/.ssh/azureCliUbuntuLogin.pem
admin_username=azureuser
public_ip_address=$(az vm show -d --resource-group $resource_group_name --name $vm_name --query publicIps -o tsv)
echo 
echo sign in with ...
echo resource group $resource_group_name
echo vm $vm_name
echo user $admin_username
echo ip $public_ip_address





list_vms=true
if [ "$list_vms" = true ] ; then
    printHeading "list vms and storages"
    echo
    echo
    echo
    echo vm name 
    echo $vm_name
    echo
    echo
    echo
    echo resource group name
    echo $resource_group_name
    echo
    echo
    echo
    echo az vm list
    az vm list -o table
    echo
    echo
    echo az vm list-usage
    az vm list-usage --location eastus -o table
    echo
    echo
    echo
    echo az disk list
    az disk list --resource-group $resource_group_name -o table
    echo
    echo
    echo
    echo az vm show
    az vm show --resource-group $resource_group_name --name $vm_name -o table
    echo
    echo
    echo
    echo az vm show storage profile
    az vm show --resource-group $resource_group_name --name $vm_name --query "storageProfile" -o table
fi





query_vm() {
    subscription=$(az account show --query "id" -o tsv)
    id="/subscriptions/$subscription/resourceGroups/VMResources/providers/Microsoft.Compute/virtualMachines/$vm_name"
    machine_id=$(az vm show --resource-group $resource_group_name --name $vm_name --query vmId -o tsv)
    user_name=$(az vm show --resource-group $resource_group_name --name $vm_name --query osProfile.adminUsername -o tsv)
    computer_name=$(az vm show --resource-group $resource_group_name --name $vm_name --query osProfile.computerName -o tsv)
    id_hash=$(az vm show -d --resource-group $resource_group_name --name $vm_name --query "vmId" -o tsv)    
    size=$(az vm show -d --resource-group $resource_group_name --name $vm_name --query "hardwareProfile.vmSize" -o tsv)
    fqdn=$(az vm show -d --resource-group $resource_group_name --name $vm_name --query "fqdns" -o tsv)
    network_id=$(az vm show --resource-group $resource_group_name --name $vm_name --query 'networkProfile.networkInterfaces[].id' -o tsv)
    network_card_name=$(az network nic show --ids $network_id --query "name" -o tsv)
    public_ip=$(az vm show -d --resource-group $resource_group_name --name $vm_name --query publicIps -o tsv)
    private_ip=$(az vm show -d --resource-group $resource_group_name --name $vm_name --query privateIps -o tsv)        
    mac_address=$(az network nic show --ids $network_id --query macAddress -o tsv)
    network_card_location=$(az network nic show --ids $network_id --query location -o tsv)
    resource_group_name=$(az network nic show --ids $network_id --query resourceGroup -o tsv)
    resource_group_id=$(az network nic show --ids $network_id --query resourceGuid -o tsv)

    echo resource group name $resource_group_name
    echo resource group location $network_card_location
    echo resource group id $resource_group_id
    echo user name $user_name
    echo computer name $computer_name
    if [ ! -z "$fqdn" ] 
    then
        echo fqdn is $fqdn
    fi
    echo id $id
    echo id hash $id_hash
    echo machine id $machine_id
    echo public ip $public_ip
    echo private ip $private_ip
    echo network id $network_id
    echo network card name $network_card_name
    echo mac address $mac_address
    echo size $vm_size
}





printHeading "query vm $vm_name"
query_vm

vm_1_name=$vm_name
vm_1_id=$id
vm_1_machine_id=$machine_id
vm_1_public_ip=$public_ip
vm_1_private_ip=$private_ip




build_vm_2=false
if [ "$build_vm_2" = true ] ; then  
    vm_name=$vm_2_name
    vm_image=$vm_image_debian
    printHeading "create vm $vm_name using image $vm_image"
    az vm create --name $vm_name --resource-group $resource_group_name  --image $vm_image --admin-username $admin_username --admin-password $admin_password --ssh-key-value $ssh_key_public
    printHeading "query vm $vm_name"
    query_vm
    vm_2_id=$id
    vm_2_machine_id=$machine_id
    vm_2_public_ip=$public_ip
    vm_2_private_ip=$private_ip
fi

















build_redhat=false
if [ "$build_redhat" = true ] ; then  
    vm_name=$vm_redhat_name
    vm_image=$vm_image_redhat
    vm_os=$vm_os_redhat
    printHeading "create vm $vm_name using image $vm_image of type $vm_os"
    az vm create --name $vm_name --resource-group $resource_group_name  --image $vm_image --admin-username $admin_username --admin-password $admin_password --ssh-key-value $ssh_key_public

    printHeading "query vm $vm_name"
    query_vm
    vm_redhat_id=$id
    vm_redhat_machine_id=$machine_id
    vm_redhat_public_ip=$public_ip
    vm_redhat_private_ip=$private_ip
fi









build_opensuse=false
if [ "$build_opensuse" = true ] ; then  
    vm_name=$vm_opensuse_name
    vm_image=$vm_image_opensuse
    vm_os=$vm_os_opensuse

    printHeading "create vm $vm_name using image $vm_image of type $vm_os"
    az vm create --name $vm_name --resource-group $resource_group_name  --image $vm_image --admin-username $admin_username --admin-password $admin_password --ssh-key-value $ssh_key_public

    printHeading "query vm $vm_name"
    query_vm
    vm_opensuse_id=$id
    vm_opensuse_machine_id=$machine_id
    vm_opensuse_public_ip=$public_ip
    vm_opensuse_private_ip=$private_ip

fi






build_flatcar=false
if [ "$build_flatcar" = true ] ; then  
    vm_name=$vm_flatcar_name
    vm_os=$vm_os_flatcar
    vm_image=$vm_image_flatcar

    printHeading "create vm $vm_name using image $vm_image of type $vm_os"
    az vm create --name $vm_name --resource-group $resource_group_name  --image $vm_image --admin-username $admin_username --admin-password $admin_password --ssh-key-value $ssh_key_public

    printHeading "query vm $vm_name"

    query_vm
    vm_flatcar_id=$id
    vm_flatcar_machine_id=$machine_id
    vm_flatcar_public_ip=$public_ip
    vm_flatcar_private_ip=$private_ip
fi






























if [ "$build_vm_2" = true ] ; then  


    vm_name=$vm_2_name
    vm_image=$vm_image_debian
    id=$vm_2_id
    machine_id=$vm_2_machine_id
    public_ip=$vm_2_public_ip
    private_ip=$vm_2_private_ip



    printHeading "who am i USER for vm 2 debian"
    remote_user=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "whoami")
    echo username $remote_user


    printHeading "get remote shell vm 2 debian"
    remote_bash_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "bash --version")
    remote_bash_version=${remote_bash_version:0:57}
    remote_bash_version_obtained=true


    printHeading "query linux vm 2 debian"
    ssh -i $ssh_key $admin_username@$vm_2_public_ip 'bash -s' < ./script-13-get-linux-version.sh
    linux_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "grep '^VERSION=' /etc/os-release")
    linux_details=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "hostnamectl")
    linux_codename=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "grep 'VERSION_CODENAME' /etc/os-release")
    linux_id_like=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "grep '^ID_LIKE' /etc/os-release")
    python_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "python3 --version")
    python_platform_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "python3 -mplatform")
    linux_details_obtained=true
    display_progress "query linux vm 2 debian"





    printHeading "dnf install vm 2 debian"
    ssh -i $ssh_key $admin_username@$vm_2_public_ip 'bash -s' < ./script-14-install-dnf.sh
    display_progress "dnf install vm 2 debian"


    printHeading "update os vm 2 debian"
    ssh -i $ssh_key $admin_username@$vm_2_public_ip 'bash -s' < ./script-16-update-server-to-latest-versions.sh
    python_platform_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "python3 -mplatform")
    display_progress "os updated vm 2 debian"


    printHeading "installing services vm 2 debian"
    install_services=true

    if [ "$install_services" = true ] ; then

        echo
        echo run counter is
        echo $run_counter

        install_zsh=true
        install_fish=false
        install_fish_frequency=10
        install_fish_counter=$(($run_counter % $install_fish_frequency))
        if [ $install_fish_counter -eq 0 ] ; then
            install_fish=true
        fi
        
        install_python=true
        install_git=true

        restart_services=true
        
        install_apache=true
        install_nginx=false

        install_node=true
        install_express=true
        install_vue=true
        install_vite=true
        install_bun=true
        install_react=true
        test_web_servers_via_curl=false
        test_web_servers_in_browser=false

        install_c=false
        install_cpp=false
        install_mongo_db=false
        install_mongo_shell=false
        install_dot_net=false
        install_maria_db=false
        install_java=false
        install_go=false

        install_docker=false
        install_terraform=false
        install_ansible=false
        list_kubernetes_clusters=false

        install_nginx_frequency=3
        install_nginx_counter=$(($run_counter % $install_nginx_frequency))
        if [ $install_nginx_counter -eq 0 ] ; then
            install_nginx=true
        fi

        install_frequency=30
        install_counter=$(($run_counter % $install_frequency))

        if [ $install_counter -eq 1 ] ; then
            install_c=true
        elif [ $install_counter -eq 2 ] ; then
            install_cpp=true
        elif [ $install_counter -eq 4 ] ; then
            install_mongo_db=true
            install_mongo_shell=true
        elif [ $install_counter -eq 5 ] ; then
            install_dot_net=true
        elif [ $install_counter -eq 6 ] ; then
            install_maria_db=true
        elif [ $install_counter -eq 7 ] ; then
            install_java=true
        elif [ $install_counter -eq 8 ] ; then
            install_go=true
        elif [ $install_counter -eq 9 ] ; then
            install_docker=true
            install_terraform=true
            install_ansible=true
            github_actions=true
            list_kubernetes_clusters=true
        fi

        learning_mode=false
        install_learning_frequency=5
        install_learning_counter=$(($run_counter % $install_learning_frequency))
        if [ $install_learning_counter -eq 0 ] ; then
            learning_mode=true
        fi

        create_vm_windows_server=false
        create_vm_windows_client=false
        install_windows_frequency=8
        install_windows_counter=$(($run_counter % $install_windows_frequency))
        if [ $install_windows_counter -lt -1 ] ; then
            create_vm_windows_server=true
            create_vm_windows_client=true
        fi

    fi







    if [ "$install_zsh" = true ] ; then
        printHeading "install zsh vm 2 debian"
        ssh -i $ssh_key $admin_username@$vm_2_public_ip 'bash -s' < ./script-18-install-zsh.sh
        ssh -i $ssh_key $admin_username@$vm_2_public_ip 'zsh -s' < ./script-18-test-zsh.zsh
        zsh_remote_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "zsh --version")    
        zsh_installed=true
        display_progress zsh vm 2 debian
    fi





    install_oh_my_zsh=true
    if [ "$install_oh_my_zsh" = true ] ; then
        printHeading "install oh my zsh vm 2 debian"
        ssh -i $ssh_key $admin_username@$vm_2_public_ip 'zsh -s' < ./script-18-install-oh-my-zsh.zsh
        ssh -i $ssh_key $admin_username@$vm_2_public_ip 'zsh -s' < ./script-18-test-oh-my-zsh.zsh
        display_progress "install zsh oh-my-zsh vm 2 debian"
    fi





    if [ "$install_fish" = true ] ; then
        printHeading "fish friendly interactive shell vm 2 debian"
        ssh -i $ssh_key $admin_username@$vm_2_public_ip 'zsh -s' < ./script-18-fish.zsh
        fish_installed=true
        fish_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "fish --version")
        display_progress fish vm 2 debian
    fi





    if [ "$install_python" = true ] ; then
        printHeading "python vm 2 debian"
        scp -i $ssh_key script-19-pandas.py $admin_username@$vm_2_public_ip:script-19-pandas.py
        scp -i $ssh_key script-19-numpy.py $admin_username@$vm_2_public_ip:script-19-numpy.py
        ssh -i $ssh_key $admin_username@$vm_2_public_ip 'zsh -s' < ./script-19-python.zsh
        ssh -i $ssh_key $admin_username@$vm_2_public_ip 'zsh -s' < ./script-19-python-pip.zsh
        ssh -i $ssh_key $admin_username@$vm_2_public_ip 'zsh -s' < ./script-19-pandas.zsh
        python_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "python3 --version")
        python_3_installed=true
        display_progress python vm 2 debian
    fi




    if [ "$install_git" = true ] ; then
        printHeading "git vm 2 debian"
        ssh -i $ssh_key $admin_username@$vm_2_public_ip 'zsh -s' < ./script-21-install-git.sh
        git_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "git --version")
        git_installed=true
        display_progress git vm 2 debian
    fi



    if [ "$install_c" = true ] ; then
        printHeading "c vm 2 debian"
        scp -i $ssh_key script-20a-hello-world.c $admin_username@$vm_2_public_ip:script-20a-hello-world.c 
        ssh -i $ssh_key $admin_username@$vm_2_public_ip 'zsh -s' < ./script-20b-install-c-compiler.sh
        ssh -i $ssh_key $admin_username@$vm_2_public_ip 'zsh -s' < ./script-20c-run-c-program.sh
        c_installed=true
        c_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "gcc --version")
        display_progress "c vm 2 debian"
    fi



    if [ "$install_cpp" = true ] ; then
        printHeading "c++ vm 2 debian"
        scp -i $ssh_key script-20d-hello-world.cpp $admin_username@$vm_2_public_ip:script-20d-hello-world.cpp
        ssh -i $ssh_key $admin_username@$vm_2_public_ip 'zsh -s' < ./script-20e-install-cpp-compiler.sh
        ssh -i $ssh_key $admin_username@$vm_2_public_ip 'zsh -s' < ./script-20f-run-cpp-program.sh
        cpp_installed=true
        cpp_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "g++ --version")
        display_progress "c++ vm 2 debian"
    fi







    if [ "$install_apache" = true ] ; then
        printHeading "apache vm 2 debian"
        ssh -i $ssh_key $admin_username@$vm_2_public_ip 'bash -s' < ./script-22-install-apache.sh
        apache_installed=true
        #apache_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "apache2 -v")
        apache_version="cant get apache version ... vm 2 debian"
        display_progress apache vm 2 debian
    fi






    if [ "$install_nginx" = true ] ; then
        printHeading "nginx vm 2 debian"
        ssh -i $ssh_key $admin_username@$vm_2_public_ip 'bash -s' < ./script-23-install-nginx.sh
        nginx_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "nginx -v")
        nginx_version="cant get nginx version ... vm 2 debian"
        nginx_installed=true
        display_progress nginx vm 2 debian
    fi




    if [ "$restart_services" = true ] ; then
        printHeading "restart services vm 2 debian"
        ssh -i $ssh_key $admin_username@$vm_2_public_ip 'bash -s' < ./script-24-update-services.sh
    fi





    if [ "$install_node" = true ] ; then
        printHeading "install node npm yarn - and express vm 2 debian"
        ssh -i $ssh_key $admin_username@$vm_2_public_ip 'bash -s' < ./script-25-install-node.sh

        chmod 777 ./script-25-phil.sh
        echo note ttab command must only be run from mac terminal not vscode shell
        echo ttab script 25 phil.sh
        ttab './script-25-phil.sh'
        
        sleep 2
        node_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "node -v")
        npm_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "npm -v")
        express_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "npm list express")
        express_version="cant get express version vm 2 debian"
        yarn_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "yarn -v")
        node_installed=true
        npm_installed=true
        express_installed=true
        yarn_installed=true
        display_progress node npm yarn vm 2 debian
    fi












    if [ "$install_express" = true ] ; then
        printHeading "express vm 2 debian"

        echo express 01 is generated vm 2 debian
        chmod 777 ./script-26-launch-express-01.sh
        echo note ttab command must only be run from mac terminal not vscode shell
        echo ttab script 26 launch express 01.sh
        ttab './script-26-launch-express-01.sh'

        express_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "npm list express")
        express_version="cant get express version vm 2 debian"
        express_installed=true

        echo express 02 is cloned from github vm 2 debian
        chmod 777 ./script-26-launch-express-02.sh
        echo note ttab command must only be run from mac terminal not vscode shell
        echo ttab script 26 launch express 02.sh
        ttab './script-26-launch-express-02.sh'

        display_progress express vm 2 debian
    fi




    if [ "$install_vue" = true ] ; then
        printHeading "install and run vue vm 2 debian"
        cd $root_directory
        chmod 777 ./script-28-launch-vue.sh
        echo note ttab command must only be run from mac terminal not vscode shell
        echo ttab script 28 launch vue.sh
        ttab './script-28-launch-vue.sh'
        vue_version="cant get vue version ... vm 2 debian"
        vue_installed=true
        display_progress vue vm 2 debian
    fi







    if [ "$install_vite" = true ] ; then
        printHeading "install and run vite vm 2 debian"
        cd $root_directory
        sleep 1
        chmod 777 ./script-29-launch-vite.sh
        echo note ttab command must only be run from mac terminal not vscode shell
        echo ttab script 29 launch vite.sh
        ttab './script-29-launch-vite.sh'
        vite_version="cant get vite version ... vm 2 debian"
        vite_installed=true
        display_progress vite vm 2 debian
    fi








    if [ "$install_bun" = true ] ; then
        printHeading "bun vm 2 debian"
        cd $root_directory
        chmod 7777 ./script-30-launch-bun.sh
        echo note ttab command must only be run from mac terminal not vscode shell
        echo ttab script 30 launch bun.sh
        ttab './script-30-launch-bun.sh'
        bun_version="cant get bun version ... vm 2 debian"
        bun_installed=true
        display_progress bun vm 2 debian
    fi





    if [ "$install_react" = true ] ; then
        printHeading "install and run react and npx vm 2 debian"
        cd $root_directory
        chmod 7777 ./script-32-launch-react.sh
        echo note ttab command must only be run from mac terminal not vscode shell
        echo ttab script 32 launch react.sh
        ttab './script-32-launch-react.sh'
        npx_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "npx -v")
        react_version="cant get react version ... vm 2 debian"
        npx_installed=true
        react_installed=true
        display_progress react vm 2 debian
    fi













































    if [ "$apache_installed" = true ] ; then
        printHeading "apache vm 2 debian"
        open -a Terminal ./script-40-run-apache-web-server.sh
    fi






    if [ "$nginx_installed" = true ] ; then
        printHeading "nginx vm 2 debian"
        echo nginx install works ... nothing to test at present
    fi
















    if [ "$install_go" = true ] ; then
        printHeading "install go is failing vm 2 debian"
        cd $root_directory
        scp -i $ssh_key script-34.go $admin_username@$vm_2_public_ip:script-34.go
        ssh -T -i $ssh_key $admin_username@$vm_2_public_ip 'zsh -s' < ./script-34-go.zsh
    fi




    if [ "$install_java" = true ] ; then
        printHeading "install java vm 2 debian"
        scp -i $ssh_key script-38-java.java $admin_username@$vm_2_public_ip:script-38-java.java
        ssh -T -i $ssh_key $admin_username@$vm_2_public_ip 'zsh -s' < ./script-38-install-java.zsh
        java_c_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "javac -version")
        java_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "java -version")
        display_progress "java installed vm 2 debian"
    fi



    if [ "$install_maria_db" = true ] ; then
        printHeading "maria db vm 2 debian"
        ssh -T -i $ssh_key $admin_username@$vm_2_public_ip 'zsh -s' < ./script-43-maria-db.zsh
        maria_db_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "mariadb -V")
        maria_db_version_mysqladmin=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "sudo mysqladmin version")
        maria_db_version_mysqladmin=${maria_db_version_mysqladmin:0:80}
        maria_db_installed=true
        display_progress "maria db vm 2 debian"
    fi






    if [ "$install_mongo_db" = true ] ; then
        printHeading "mongo db vm 2 debian"
        ssh -T -i $ssh_key $admin_username@$vm_2_public_ip 'zsh -s' < ./script-44-mongo-db.zsh
        mongo_db_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "mongod --version")
        mongo_db_installed=true
        display_progress "mongo db vm 2 debian"
    fi






    if [ "$install_mongo_shell" = true ] ; then
        printHeading "mongo shell vm 2 debian"
        ssh -T -i $ssh_key $admin_username@$vm_2_public_ip 'zsh -s' < ./script-45-mongo-shell.zsh
        mongo_shell_version=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "mongosh --version")
        mongo_shell_installed=true
        display_progress "mongo shell vm 2 debian"
    fi





    if [ "$install_dot_net" = true ] ; then
        printHeading ".net core vm 2 debian"
        ssh -T -i $ssh_key $admin_username@$vm_2_public_ip 'zsh -s' < ./script-50-dot-net.zsh
        dot_net_installed=true
        dot_net_sdks=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "dotnet --list-sdks")
        echo dot net sdks
        echo $dot_net_sdks
        dot_net_runtimes=$(ssh -i $ssh_key $admin_username@$vm_2_public_ip "dotnet --list-runtimes")
        echo dot net runtimes
        echo $dot_net_runtimes
        display_progress "dot net installed vm 2 debian"
    fi

fi


































if [ "$test_web_servers_via_curl" = true ] ; then

    printHeading "test web servers from localhost ..." "ip is $vm_1_public_ip" "private ip is $vm_private_ip"
    ssh -i $ssh_key $admin_username@$vm_1_public_ip 'bash -s' < ./script-60-test-servers-from-localhost.sh
    printHeading "test web servers from machine on same local network ... ip is $vm_2_public_ip"


    touch ~/temp/vm_1_public_ip.txt
    echo $vm_1_public_ip > ~/temp/vm_1_public_ip.txt
    echo vm 1 public ip text file holds 
    cat ~/temp/vm_1_public_ip.txt
    echo
    echo
    echo
    scp -i $ssh_key ~/temp/vm_1_public_ip.txt $admin_username@$vm_2_public_ip:vm_1_public_ip.txt
    ssh -i $ssh_key $admin_username@$vm_2_public_ip 'bash -s' < ./script-60-test-servers-from-server-2.sh
    display_progress test web servers
fi









if [ "$test_web_servers_in_browser" = true ] ; then
    printHeading "test web servers in browser ... ip is $vm_1_public_ip"
    for port in 80 3000 57329 58262 54892 63892 51547 51279 
    do
        echo open $vm_1_public_ip:$port
        open http://$vm_1_public_ip:$port
        sleep 3
    done
    display_progress test web servers in browser
fi






echo
echo
echo
delay_before_erase_all_servers=900
delay_in_minutes_before_erase_all_servers=$(( $delay_before_erase_all_servers / 60 ))
echo ... waiting $delay_in_minutes_before_erase_all_servers minutes then deleting all servers and all resource groups so we start from scratch every time ...
sleep $delay_before_erase_all_servers




if [ "$deallocate_vms" = true ] ; then
    printHeading "deallocate vms"

    IFS=$'\n' resource_group_names=($(az group list --query [].name -o tsv))
    resource_group_valid_name=invalid
    for resource_group_index in "${!resource_group_names[@]}"
    do
        resource_group_name=${resource_group_names[$resource_group_index]}
        if [[ $resource_group_name = 'ResourceGroup'* ]]; then
            resource_group_valid_name=$resource_group_name
        fi
    done
    resource_group_name=$resource_group_valid_name
    echo resource group name $resource_group_name
    az vm deallocate --name $vm_1_name --resource-group $resource_group_name 
    az vm deallocate --name $vm_2_name --resource-group $resource_group_name 
    if [ "$build_redhat" = true ] ; then  
        az vm deallocate --name $vm_redhat_name --resource-group $resource_group_name 
    fi
    if [ "$build_opensuse" = true ] ; then  
        az vm deallocate --name $vm_opensuse_name --resource-group $resource_group_name 
    fi
    if [ "$build_flatcar" = true ] ; then
        az vm deallocate --name $vm_flatcar_name --resource-group $resource_group_name 
    fi
fi


if [ "$delete_vms" = true ] ; then
    printHeading "delete vms"
    echo delete vm by id 

    echo 
    echo delete vm by id $vm_1_machine_id
    az vm delete --ids $vm_1_machine_id --yes

    echo
    echo delete vm by id $vm_2_machine_id
    az vm delete --ids $vm_2_machine_id --yes


    if [ "$build_redhat" = true ] ; then 
        echo delete vm by id $vm_redhat_machine_id 
        az vm delete --ids $vm_redhat_machine_id --yes
    fi
    if [ "$build_opensuse" = true ] ; then  
        echo delete vm by id $vm_opensuse_machine_id
        az vm delete --ids $vm_opensuse_machine_id --yes
    fi
    if [ "$build_flatcar" = true ] ; then
        echo delete vm by id $vm_flatcar_machine_id
        az vm delete --ids $vm_flatcar_machine_id --yes
    fi
    #echo delete windows server vm by vm name $windows_server_vm_name
    #az vm delete --resource-group $resource_group_name --name $windows_server_vm_name --yes
    #echo delete ubuntu vm by vm name $vm_1_name
    #az vm delete --resource-group $resource_group_name --name $vm_1_name --yes
    #az vm delete --ids $(az vm list -g $resource_group_name --query "[].id" -o tsv) --force-deletion yes
fi









if [ "$delete_resource_groups" = true ] ; then
    printHeading "delete resource groups"
    IFS=$'\n' resource_group_names=($(az group list --query [].name -o tsv))
    for resource_group_index in "${!resource_group_names[@]}"
    do
        resource_group_name=${resource_group_names[$resource_group_index]}
        echo $resource_group_name
        if [[ $resource_group_name = 'ResourceGroup'* ]]; then
            echo deleting resource group $resource_group_name
            az group delete --name $resource_group_name --yes
        fi
    done
fi









endTimeOnMasterScript=$(date +%s)
echo "=============================================================="
echo "====                   azure script ended                 ===="
printTime
echo "====                  unix time $endTimeOnMasterScript"
echo $endTimeOnMasterScript | perl -pe 's/(\d+)/localtime($1)/e'
echo "=============================================================="
