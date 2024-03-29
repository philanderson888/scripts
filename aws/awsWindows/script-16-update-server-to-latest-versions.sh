#!/bin/bash
echo "=============================================================="
echo "====              update $vm_name                           ===="
echo "====                 $minutes:$seconds                      ===="
echo "====                shell $SHELL --version                  ===="
echo "=============================================================="
echo "====================================================================="
echo "====              which flavour of linux is this machine           ======"
echo "====================================================================="
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
echo "====                           update $os which is of type $os_type         ======"
echo "====================================================================="
if [[  "$os_type" == "$os_type_debian" ]]; then
    echo 
    echo 
    echo
    echo "====================================================================="
    echo "====                       apt-get update                              ===="
    echo "====================================================================="
    sudo apt-get update -y
    echo
    echo
    echo
    echo "====================================================================="
    echo "====                        apt-get upgrade                            ===="
    echo "====================================================================="
    sudo apt-get upgrade -y
    echo
    echo
    echo
elif [[  "$os_type" == "$os_type_fedora" ]]; then
    echo
    echo
    echo
    echo confirmation of red hat release version 
    echo "/etc/redhat-release"
    echo /etc/redhat-release
    echo "-f /etc/redhat-release"
    echo -f /etc/redhat-release
    echo
    echo
    echo
    echo dnf version before update
    dnf --version
    echo "================================================================="
    echo "====                             sudo dnf update               ==========="
    echo "================================================================="
    sudo dnf update -y
    echo "================================================================="
    echo "====                             sudo dnf upgrade              ==========="
    echo "================================================================="
    echo dnf upgrade
    sudo dnf upgrade -y
    echo
    echo
    echo
    echo dnf version after update
    dnf --version
fi
if [[  "$operating_system_type" == "opensuse" ]]; then
    echo operating system id_like is opensuse
    sudo zypper refresh
    suzo zypper update
fi
echo
echo
echo
echo "================================================================="
echo "====                                 python                    ==========="
echo "================================================================="
echo python version
python3 --version
python_version=$(python3 --version)
python_installed=true
echo 
echo
echo
echo python platform ... linux os on which python is built .... 
python3 -mplatform
python_platform_version=$(python3 -mplatform)
echo
echo
echo
echo
echo "==============================================================="
echo "====                    update and upgrade linux complete    ==========="
echo "==============================================================="
os_updated=true
