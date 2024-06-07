#!/bin/bash
echo shell $SHELL
echo "=============================================================="
echo "====                    update vm                         ===="
echo "=============================================================="
echo "=============================================================="
echo "====          which flavour of linux is this machine      ===="
echo "=============================================================="
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
echo
echo
echo
if [[  "$os" == "$os_ubuntu" ]]; then
    os_type=$os_type_debian
fi
echo
echo
echo
echo "====================================================================="
echo "====              update $os which is of type $os_type"
echo "====================================================================="
if [[  "$os_type" == "$os_type_debian" ]]; then
    echo "====================================================================="
    echo "====                    apt-get update                           ===="
    echo "====                  * * * silent * * *                         ===="
    echo "====================================================================="
    sudo apt-get -qq update -y
    echo "====================================================================="
    echo "====                    apt-get upgrade                          ===="
    echo "====================================================================="
    echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
    sudo chmod 777 /var/cache/debconf/ 
    sudo chmod 777 /var/cache/debconf/passwords.dat
    sudo apt-get install -y -q >> remote-output.txt
    sudo apt-get install dialog -y -q >> remote-output.txt
    sudo apt-get install apt-utils -y -q >> remote-output.txt
    sudo apt-get -qq upgrade -y >> remote-output.txt
elif [[  "$os_type" == "$os_type_fedora" ]]; then
    echo confirmation of red hat release version 
    echo "/etc/redhat-release"
    echo /etc/redhat-release
    echo "-f /etc/redhat-release"
    echo -f /etc/redhat-release
    echo dnf version before update
    dnf --version
    echo "================================================================="
    echo "====                    sudo dnf update               ==========="
    echo "================================================================="
    sudo dnf update -y
    echo "================================================================="
    echo "====                    sudo dnf upgrade              ==========="
    echo "================================================================="
    echo dnf upgrade
    sudo dnf upgrade -y
    echo dnf version after update
    dnf --version
fi
if [[  "$operating_system_type" == "opensuse" ]]; then
    echo operating system id_like is opensuse
    sudo zypper refresh
    suzo zypper update
fi
echo "================================================================="
echo "====                       python                            ===="
echo "================================================================="
python_version=$(python3 --version)
echo python version 
echo $python_version
echo
echo
echo
python_platform_version=$(python3 -mplatform)
echo python platform ... linux os on which python is built .... 
echo $python_platform_version
echo "==============================================================="
echo "====          update and upgrade linux complete            ===="
echo "==============================================================="
os_updated=true
