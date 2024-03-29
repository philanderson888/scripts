#!/bin/bash
echo "======================================================================="
echo "====                          shell                                ===="
echo "======================================================================="
shell_version=$($SHELL --version)
echo shell in use on remote machine is $SHELL of version $shell_version
echo "======================================================================="
echo "====                        linux version                          ===="
echo "======================================================================="
os_type_debian=debian
os_ubuntu=ubuntu
os_centos=centos
os_debian=debian
echo "running a case statement on /etc/os-release against the option 'ID'"
. /etc/os-release
linux_release_id=not_recognised
case "$ID" in
    ubuntu) 
        echo 'This is Ubuntu Linux' 
        os=$os_ubuntu
        ;;
    centos)
        echo 'This is centos Linux'
        os=$os_centos
        ;;
    debian)
        echo 'this is debian linux'
        os=$os_debian
        ;;
    *)
        echo 'This is an unknown linux distribution type' 
        os=not_recognised
        ;; 
esac

if [[  "$os" == "$os_ubuntu" ]]; then
    os_type=$os_type_debian
fi
echo "======================================================================="
echo "====              update $os of type $os_type"
echo "======================================================================="
if [[  "$os_type" == "$os_type_debian" ]]; then
    echo "======================================================================="
    echo "====                              apt-get install nginx                               ===="
    echo "======================================================================="
    sudo apt-get install nginx -y
    echo "======================================================================="
    echo "====                              update various services                             ===="
    echo "======================================================================="
    sudo systemctl restart systemd-journald.service 
    sudo /etc/needrestart/restart.d/systemd-manager
    sudo systemctl restart systemd-networkd.service
    sudo systemctl restart systemd-resolved.service
    sudo systemctl restart systemd-logind.service
    sudo systemctl restart unattended-upgrades.service
    sudo systemctl restart user@1000.service
elif [[  "$os_type" == "$os_type_fedora" ]]; then
    echo confirmation of red hat release version 
    echo "/etc/redhat-release"
    echo /etc/redhat-release
    echo "-f /etc/redhat-release"
    echo -f /etc/redhat-release
fi


test_phil_variable=22
