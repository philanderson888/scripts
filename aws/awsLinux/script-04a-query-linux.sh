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
case "`/usr/bin/lsb_release -si`" in
    Ubuntu) 
        echo 'This is Ubuntu Linux' 
        operating_system_type=ubuntu_distribution
        ;;
    *) 
        echo 'This is something else' 
        operating_system_type=red_hat_fedora_yum_distribution
        ;;
esac
echo
echo
echo
. /etc/os-release
case "$ID" in
    ubuntu) 
        echo 'This is Ubuntu Linux' 
        operating_system_type=ubuntu_distribution
        ;;
    centos)
        echo 'This is centos Linux'
        operating_system_type=red_hat_fedora_yum_distribution
        ;;
    *)
        echo 'This is a red hat fedora yum distribution' 
        operating_system_type=red_hat_fedora_yum_distribution
        ;; 
esac
echo
echo
echo
. /etc/os-release
case "$ID_LIKE" in
    debian) 
        echo 'This is Debian Linux => of which Ubuntu is a flavour' 
        operating_system_type=ubuntu_distribution
        ;;
#    rhel\ fedora)
 #       echo 'This is a red hat fedora yum distribution' 
 #       operating_system_type=red_hat_fedora_yum_distribution
 #       ;; 
    *)
        echo 'This is a red hat fedora yum distribution' 
        operating_system_type=red_hat_fedora_yum_distribution
        ;; 
esac
echo
echo
echo
linux_version_number=`grep 'VERSION' /etc/os-release`
linux_version_id=`grep 'ID' /etc/os-release`
linux_version_id_like=`grep 'ID_LIKE' /etc/os-release`

echo linux version number
echo $linux_version_number
echo linux version id
echo $linux_version_id
echo linux version id like
echo $linux_version_id_like

# linux_version_number2 = $ ( . /etc/os-release && printf '%s\n' "$VERSION" )
# linux_version_id2 = $ ( . /etc/os-release && printf '%s\n' "$ID" )
# linux_version_id_like_2 = $ ( . /etc/os-release && printf '%s\n' "$ID_LIKE" )
# echo $linux_version_number2
# echo $linux_version_id2
# echo $linux_version_id_like2

echo $operating_system_type

echo aaa

if [[  "$operating_system_type" == "ubuntu_distribution" ]]; then

    echo bbb
 
    echo pwd
    echo whoami
    echo its a regular ubuntu flavour of linux so running apt-get update and apt-get upgrade
    sudo apt-get update -y
    sudo apt-get upgrade -y
    # web server
    echo install nginx
    sudo apt-get install nginx -y
    # services
    sudo systemctl restart systemd-journald.service 
    sudo /etc/needrestart/restart.d/systemd-manager
    sudo systemctl restart systemd-networkd.service
    sudo systemctl restart systemd-resolved.service
    sudo systemctl restart systemd-logind.service
    sudo systemctl restart unattended-upgrades.service
    sudo systemctl restart user@1000.service
    # gcc
    echo install gcc
    sudo apt-get install gcc
elif [[  "$operating_system_type" == "red_hat_fedora_yum_distribution" ]]; then
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
    echo its a redhat fedora flavour of linux so running yum update
    sudo yum update
    sudo yum install gcc 
fi
#In Chef, you can use the platform? method:
#if platform?("redhat", "centos", "fedora")
  # Code for only Red Hat Linux family systems.
#end
echo
echo awk - F = '/^NAME/{print $2}' /etc/os-release
awk -F= '/^NAME/{print $2}' /etc/os-release
echo
echo
echo
echo awk - F '=' '/PRETTY_NAME/ { print $2 }' /etc/os-release
awk -F '=' '/PRETTY_NAME/ { print $2 }' /etc/os-release
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
echo echo lsb_release -si
lsb_release -si
#Ubuntu
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
#No LSB modules are available.
#Distributor ID: Ubuntu
#Description:    Ubuntu 18.04.3 LTS
#Release:        18.04
#Codename:       bionic

echo
echo
echo
echo "cat /etc/*release"
cat /etc/*release
echo
echo
echo
echo
cd /etc
ls -lah
echo
echo
echo "apt-get -v &> /dev/null && apt-get update"
apt-get -v &> /dev/null && apt-get update
echo
echo
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
echo "run apt-get if ubuntu is in the name; else run yum "
echo "if [  -n " uname -a  grep Ubuntu " ]; then  apt-get else yum fi "
echo this grep query is failing for some reason
echo echo uname
echo $uname 
echo echo uname -a
echo $uname -a
echo echo uname -a ... grep Ubuntu
echo $uname -a | grep Ubuntu
if [ -n "$(uname -a | grep Ubuntu)" ]; then
operating_system_type=ubuntu_distribution

echo $operating_system_type
if [[  "$operating_system_type" == "ubuntu_distribution" ]]; then
    echo its a regular ubuntu flavour of linux so running apt-get update and apt-get upgrade
    sudo apt-get update
    sudo apt-get upgrade 
    sudo apt-get install gcc
elif [[  "$operating_system_type" == "red_hat_fedora_yum_distribution" ]]; then
    echo its a redhat fedora flavour of linux so running yum update
    sudo yum update
    sudo yum install gcc 
fi

echo
echo
echo
echo if its a lsb release then run apt-get 
echo "if [ -f /etc/lsb-release ]; then apt-get update fi "
if [ -f /etc/lsb-release ]; then
  echo using apt-get update so its regular ubuntu linux
  apt-get update
fi
echo
echo
echo
UNAME=$(uname | tr "[:upper:]" "[:lower:]")
echo unix name = uname = $UNAME
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
unset UNAME
echo
echo
echo
echo "install gcc ..."
echo operating system type 
echo $operating_system_type
if [[  "$operating_system_type" == "ubuntu_distribution" ]]; then
    sudo apt-get install gcc
else if [[  "$operating_system_type" == "red_hat_fedora_yum_distribution" ]]; then
    sudo yum install gcc 
fi
echo "gcc --verstion"
gcc --version
#CentOS 5.x
#
#$ gcc --version
#gcc (GCC) 4.1.2 20080704 (Red Hat 4.1.2-54)
#Copyright (C) 2006 Free Software Foundation, Inc.
#CentOS 6.x#
#
#$ gcc --version
#gcc (GCC) 4.4.7 20120313 (Red Hat 4.4.7-3)
#Copyright (C) 2010 Free Software Foundation, Inc.
#Ubuntu 12.04
#
#$ gcc --version
#gcc (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3
#Copyright (C) 2011 Free Software Foundation, Inc.
#Ubuntu 14.04
#
#$ gcc --version
#gcc (Ubuntu 4.8.2-19ubuntu1) 4.8.2
#Copyright (C) 2013 Free Software Foundation, Inc.
#This is free software; see the source for copying conditions.  There is NO
#warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
echo
echo
echo
if [ "$operating_system_type" = "red_hat_fedora_yum_distribution" ] ; then
    echo =================================================================
    echo ===========  4.1  upgrade to latest red hat fedora    ===========
    echo =================================================================
    echo running updates to ensure all os software is up to date
    echo sudo yum update
    sudo yum update -y
    echo
    echo
    echo
    echo sudo yum upgrade
    sudo yum upgrade -y 
    echo
    echo
    echo
    echo dnf update
    sudo dnf update -y
    echo
    echo
    echo
    echo dnf upgrade
    sudo dnf upgrade -y
    echo
    echo
    echo
elif [ "$operating_system_type" = "ubuntu_distribution" ] ; then
    echo ==============================================================================
    echo ========    4.2  upgrade to latest ubuntu linux ...                   ========
    echo ==============================================================================
    echo sudo apt-get update 
    sudo sudo apt-get update -y
    echo
    echo
    echo
    echo sudo apt-get upgrade
    sudo apt-get upgrade -y
    echo
    echo
    echo
else
    echo distribution is neither ubuntu nor red hat fedora ... strange
fi
echo =====================================================
echo ===========    linux upgrades finished    ===========
echo =====================================================
echo
echo
echo
echo =====================================================
echo ===========    4.3 query linux details    ===========
echo =====================================================
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


echo
echo
echo
echo "=============================================================================="
echo "=========       script script 04 query linux ... complete           =========="
echo "=============================================================================="
echo
