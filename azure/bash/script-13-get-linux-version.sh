#!/bin/bash
echo "======================================================================="
echo "====                          shell 01310                          ===="
echo "======================================================================="
shell_version=$($0 --version)
echo "shell in use on remote machine is $0"
echo "remote shell version ${shell_version:0:57}"
echo
echo
echo
echo "======================================================================="
echo "====                     linux version 01320                       ===="
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
echo "=================================================================="
echo "====              update $os of type $os_type 01330"
echo "=================================================================="
if [[  "$os_type" == "$os_type_debian" ]]; then
    echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
    sudo chmod 777 /var/cache/debconf/ 
    sudo chmod 777 /var/cache/debconf/passwords.dat
    sudo add-apt-repository universe >/dev/null
    sudo apt-get -qq update -y > /dev/null
    sleep 1
    sudo apt-get install -y -q > /dev/null
    sudo apt-get install dialog -y -q > /dev/null
    sudo apt-get install apt-utils -y -q > /dev/null
    echo "=============================================================="
    echo "====                  update services 013-077             ===="
    echo "=============================================================="
    sudo systemctl restart systemd-journald.service 
    sudo systemctl restart systemd-journald.service 
    sudo /etc/needrestart/restart.d/systemd-manager
    sudo systemctl restart systemd-networkd.service
    sudo systemctl restart systemd-resolved.service
    sudo systemctl restart systemd-logind.service
    sudo systemctl restart unattended-upgrades.service
elif [[  "$os_type" == "$os_type_fedora" ]]; then
    echo confirmation of red hat release version 
    echo "/etc/redhat-release"
    echo /etc/redhat-release
    echo "-f /etc/redhat-release"
    echo -f /etc/redhat-release
fi
