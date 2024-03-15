#!/bin/bash
echo
echo
echo
echo ====================================================================================
echo =======       script 04 .. 1 .. update and upgrade ... 2 .. query             ======
echo ====================================================================================
echo
echo
echo


echo ====================================================================================
echo =======              which flavour of linux is this machine                   ======
echo ====================================================================================
echo
echo
echo
echo echo lsb_release -si
lsb_release -si
echo
echo
echo
case "`/usr/bin/lsb_release -si`" in
    Ubuntu) 
        echo ubuntu 
        operating_system_type=ubuntu_distribution
        linux_version_id_like=debian
        id_like=debian
        ;;
    Debian)
        echo debian
        operating_system_type=debian_distribution
        linux_version_id_like=debian
        id_like=debian
        ;;
    *) 
        echo not debian / ubuntu ... for now assuming this is red hat fedora linux distribution, can refine over time
        operating_system_type=red_hat_fedora_yum_distribution
        linux_version_id_like=fedora
        id_like=fedora
        ;;
esac
echo
echo
echo
echo ====================================================================================
echo =======                    operating system type                              ======
echo ====================================================================================
echo
echo
echo
echo id like
echo $id_like
echo
echo
echo
echo operating system type
echo $operating_system_type
if [[  "$operating_system_type" == "ubuntu_distribution" ]]; then
    echo ubuntu operating system
elif [[  "$operating_system_type" == "debian_distribution" ]]; then
    echo debian operating system
elif [[  "$operating_system_type" == "red_hat_fedora_yum_distribution" ]]; then
    echo assuming red hat fedora operating system ... can refine
fi
echo
echo
echo
echo "cat /etc/os-release"
cat /etc/os-release
#PRETTY_NAME="Debian GNU/Linux 11 (bullseye)"
#NAME="Debian GNU/Linux"
#VERSION_ID="11"
#VERSION="11 (bullseye)"
#VERSION_CODENAME=bullseye
#ID=debian
#HOME_URL="https://www.debian.org/"
#BUG_REPORT_URL="https://bugs.debian.org/"
#SUPPORT_URL="https://www.debian.org/support"
echo
echo
echo
echo "running a case statement on /etc/os-release against the option 'ID'"
. /etc/os-release
case "$ID" in
    ubuntu) 
        echo 'This is Ubuntu Linux' 
        ;;
    centos)
        echo 'This is centos Linux'
        ;;
    debian)
        echo 'this is debian linux'
        ;;
    *)
        echo 'This is an unknown linux distribution type' 
        ;; 
esac
echo
echo
echo
. /etc/os-release
case "$ID_LIKE" in
    debian) 
        echo 'This is Debian Linux => of which Ubuntu is a flavour' 
        #operating_system_type=ubuntu_distribution
        ;;
#    rhel\ fedora)
 #       echo 'This is a red hat fedora yum distribution' 
 #       operating_system_type=red_hat_fedora_yum_distribution
 #       ;; 
    *)
        #echo 'This is a red hat fedora yum distribution' 
        #operating_system_type=red_hat_fedora_yum_distribution
        echo id like is ... in case statement ...
        echo $ID_LIKE
        ;; 
esac
echo
echo
echo
linux_version_name=`grep '^NAME' /etc/os-release`
echo linux NAME in /etc/os-release 
echo $linux_version_name
echo
echo
echo
echo awk - F = '/^NAME/{print $2}' /etc/os-release
awk -F= '/^NAME/{print $2}' /etc/os-release
echo
echo
echo
linux_version_pretty_name=`grep 'PRETTY_NAME' /etc/os-release`
echo linux PRETTY_NAME in /etc/os-release 
echo $linux_version_pretty_name
echo
echo
echo
echo "awk - F =/PRETTY_NAME/ { print $ 2 } /etc/os-release"
awk -F '=' '/PRETTY_NAME/ { print $2 }' /etc/os-release
echo
echo
echo
linux_version=`grep '^VERSION=' /etc/os-release`
echo linux VERSION in /etc/os-release 
echo $linux_version
echo
echo
echo
linux_version_id=`grep 'VERSION_ID' /etc/os-release`
echo linux VERSION_ID in /etc/os-release 
echo $linux_version_id
echo
echo
echo
linux_version_codename=`grep 'VERSION_CODENAME' /etc/os-release`
echo linux VERSION_CODENAME in /etc/os-release 
echo $linux_version_codename
echo
echo
echo
if [[  "$operating_system_type" == "debian_distribution" ]]; then
    echo " "
else
    linux_version_id_like_2=`grep '^ID_LIKE' /etc/os-release`
    echo linux ID_LIKE in /etc/os-release 
    echo $linux_version_id_like_2
fi
#In Chef, you can use the platform? method:
#if platform?("redhat", "centos", "fedora")
  # Code for only Red Hat Linux family systems.
#end
echo
echo
echo
echo lsb_release - d | awk - F "\t" '{print $2}'
lsb_release -d | awk -F "\t" '{print $2}'
echo
echo
echo
echo lsb_release: lsb_release - d | awk - F "\t" '{print $2}' | awk - F " " '{print $1}'
lsb_release: lsb_release -d | awk -F "\t" '{print $2}' | awk -F " " '{print $1}'
echo
echo
echo
echo lsb_release - d | awk '{print $3}'
lsb_release -d | awk '{print $3}'
echo
echo
echo
echo lsb_release -sd
lsb_release -sd
#Ubuntu 18.04.3 LTS
echo
echo
echo
echo lsb_release -sr
lsb_release -sr
#18.04
echo
echo
echo
echo lsb_release -a
lsb_release -a
echo
echo
echo
echo "cat /etc/*release"
cat /etc/*release
echo
echo
echo
echo
echo "ls /etc/*release*"
cd /etc
ls -lahR *release*
ls /etc/*release* -lahR
echo
echo
echo
echo if its a lsb release then run apt-get 
echo "if [ -f /etc/lsb-release ]; then apt-get update fi "
if [ -f /etc/lsb-release ]; then
  echo its ubuntu !?
fi
echo
echo
echo
UNAME=$(uname | tr "[:upper:]" "[:lower:]")
echo unix name = uname = $UNAME
echo
echo
echo
echo uname
uname
echo
echo
echo
echo "echo uname -a"
echo $uname -a
echo
echo
echo
echo "echo uname -a ... grep Ubuntu"
echo $uname -a | grep Ubuntu
echo
echo
echo
echo get distribution
if [ "$UNAME" == "linux" ]; then
    if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
        export DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'//)
    else
        export DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1)
    fi
fi
[ "$DISTRO" == "" ] && export DISTRO=$UNAME
echo distribution is $DISTRO
echo
echo
echo
echo what version of linux is being run
echo uname -a
uname -a
# Linux ip-172-31-29-138.ec2.internal 6.1.66-91.160.amzn2023.x86_64 #1 SMP PREEMPT_DYNAMIC Wed Dec 13 04:50:24 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
echo 
echo
echo
echo what version of linux is being run - short version
echo uname -srm
uname -srm
# Linux 6.1.66-91.160.amzn2023.x86_64 x86_64
echo
echo 
echo 
echo what version of linux is being run
echo cat /etc/system-release = cat /usr/lib/system-release = cat /usr/lib/system-release = echo cat /etc/system-release = cat /etc/amazon-linux-release
cat /etc/system-release
# Amazon Linux release 2023 (Amazon Linux)
echo
echo
echo
echo "linux os details"
echo "/etc/os-release ... /usr/lib/os-release"
cat /etc/os-release
# NAME="Amazon Linux"
# VERSION="2023"
# ID="amzn"
# ID_LIKE="fedora"
# VERSION_ID="2023"
# PLATFORM_ID="platform:al2023"
# PRETTY_NAME="Amazon Linux 2023"
# ANSI_COLOR="0;33"
# CPE_NAME="cpe:2.3:o:amazon:amazon_linux:2023"
# HOME_URL="https://aws.amazon.com/linux/"
# BUG_REPORT_URL="https://github.com/amazonlinux/amazon-linux-2023"
# SUPPORT_END="2028-03-15"

PRETTY_NAME=`grep 'PRETTY_NAME' /etc/os-release`
echo linux pretty name is $PRETTY_NAME
is_amazon_linux_image=false
if [[ $PRETTY_NAME == *Amazon* ]]; then
  is_amazon_linux_image=true
  echo "this is an amazon linux image ... which is running fedora linux with sudo yum etc ..."
fi
echo
echo
echo
echo script to get linux id
read_os() {
    if test -r /etc/os-release
    then
        clearenv setenv "$1" "$2" read-conf /etc/os-release printenv "$1"
    else
        clearenv setenv "$1" "$2" read-conf /usr/lib/os-release printenv "$1"
    fi
}
read_os ID linux
# debian
read_os VERSION
#9 (stretch)
read_os PRETTY_NAME Linux
#Debian GNU/Linux 9 (stretch with subversive $PATH)
read_os PATH
#/home/malefactor/bin:${PATH}
read_os LANG
echo
echo
echo
echo cat /etc/system-release-cpe = cat /usr/lib/system-release-cpe
cat /etc/system-release-cpe
# cpe:2.3:o:amazon:amazon_linux:2023
echo
echo
echo
echo cat /etc/image-id
cat /etc/image-id
# image_name="al2023-ami"
# image_version="2023"
# image_arch="x86_64"
# image_file="al2023-ami-2023.3.20240205.2-kernel-6.1-x86_64.xfs.gpt"
# image_stamp="ef0e-5871"
# image_date="20240206172131"
# recipe_name="al2023 ami"
# recipe_id="c01941d6-fe83-9907-0c87-7169-cdf3-1d1f-c1054d26"
echo
echo
echo
echo what is the virtualization details of the amazon vm host and os
echo hostnamectl
hostnamectl
#  Static hostname: ip-172-31-29-138.ec2.internal
#        Icon name: computer-vm
#          Chassis: vm 🖴
#       Machine ID: a581245290b34a2dbe124ece0e9883ee
#          Boot ID: ff5f522c75824786bfb8cc2841451d6a
#   Virtualization: xen
# Operating System: Amazon Linux 2023
#      CPE OS Name: cpe:2.3:o:amazon:amazon_linux:2023
#           Kernel: Linux 6.1.66-91.160.amzn2023.x86_64
#     Architecture: x86-64
#  Hardware Vendor: Xen
#   Hardware Model: HVM domU
# Firmware Version: 4.11.amazon
echo
echo
echo
echo which version of python is installed
python3 --version
echo 
echo
echo
echo "python3 -mplatform"
python3 -mplatform
echo
echo
echo
echo ====================================================================================
echo =======       run updates and upgrades depending on id_like                   ======
echo ====================================================================================
if [[  "$id_like" == "debian" ]]; then
    echo 
    echo 
    echo
    echo ====================================================================================
    echo =======                         apt-get update                                ======
    echo ====================================================================================
    sudo apt-get update -y
    echo
    echo
    echo
    echo ====================================================================================
    echo =======                         apt-get upgrade                               ======
    echo ====================================================================================
    sudo apt-get upgrade -y
    echo
    echo
    echo
    echo ====================================================================================
    echo =======                       apt-get install nginx                           ======
    echo ====================================================================================
    sudo apt-get install nginx -y
    echo
    echo
    echo
    echo ====================================================================================
    echo =======                       update various services                         ======
    echo ====================================================================================
    sudo systemctl restart systemd-journald.service 
    sudo /etc/needrestart/restart.d/systemd-manager
    sudo systemctl restart systemd-networkd.service
    sudo systemctl restart systemd-resolved.service
    sudo systemctl restart systemd-logind.service
    sudo systemctl restart unattended-upgrades.service
    sudo systemctl restart user@1000.service
    echo
    echo
    echo
    echo ====================================================================================
    echo =======                      apt-get install gcc                              ======
    echo ====================================================================================
    sudo apt-get install gcc -y
elif [[  "$id_like" == "fedora" ]]; then
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
    echo =================================================================
    echo ===========             sudo yum update               ===========
    echo =================================================================
    echo yum update
    sudo yum update -y
    echo dnf update
    sudo dnf update -y
    echo =================================================================
    echo ===========             sudo yum upgrade              ===========
    echo =================================================================
    echo yum upgrade
    sudo yum upgrade -y 
    echo dnf upgrade
    sudo dnf upgrade -y
    echo =================================================================
    echo ===========             yum install gcc               ===========
    echo =================================================================
    sudo yum install gcc -y 
else
    echo operating system id_like is neither debian nor fedora
fi
echo
echo
echo
echo "apt-get -v &> /dev/null && apt-get update"
apt-get -v &> /dev/null && apt-get update

echo
echo
echo
echo "gcc --verstion"
gcc --version
echo
echo
echo
echo =====================================================
echo ===========    linux upgrades finished    ===========
echo =====================================================
echo
echo
echo
echo "=============================================================================="
echo "=========       script script 04 query linux ... complete           =========="
echo "=============================================================================="
echo
