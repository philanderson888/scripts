#!/bin/bash
echo shell in use is 
echo $0
echo
echo
echo
echo "======================================================================="
echo "====          which flavour of linux is this machine 04010         ===="
echo "======================================================================="
echo "running a case statement on /etc/os-release against the option 'ID'"
. /etc/os-release
linux_release_id=not_recognised
echo still to add in the fedora case
case "$ID" in
    ubuntu) 
        echo 'This is Ubuntu Linux' 
        linux_release_id=ubuntu
        ;;
    centos)
        echo 'This is centos Linux'
        linux_release_id=centos
        ;;
    debian)
        echo 'this is debian linux'
        linux_release_id=debian
        ;;
    *)
        echo 'This is an unknown linux distribution type' 
        linux_release_id=not_recognised
        ;; 
esac
echo
echo
echo
echo echo linux standard base lsb_release -si
lsb_release -si
echo
echo
echo
echo examining case /usr/bin/lsb_release -si to get os name eg ubuntu and id_like eg debian
echo still to add in the fedora case
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
        echo not recognised
        operating_system_type=not_recognised
        linux_version_id_like=not_recognised
        id_like=not_recognised
        ;;
esac
echo
echo
echo
echo "======================================================================="
echo "====                operating system type 04050                    ===="
echo "======================================================================="
# apt(-get) is a package manager for Debian + Ubuntu + Linux Mint and all Linux Distributions build in Debian
# Redhat, fedora and CentOS are using dnf/yum package manager
# ArchLinux and all distributions build in arch as Manjaro, ... use pacman package manager
# openSUSE uses zypper package manager
# https://distrowatch.com/weekly.php?issue=20081013#feature
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
. /etc/os-release
case "$ID_LIKE" in
    debian) 
        echo 'This is Debian Linux => of which Ubuntu is a flavour' 
        #operating_system_type=ubuntu_distribution
        ;;
    suse\ opensuse)
        echo this is open suse linux 
        linux_version_id_like="suse opensuse"
        operating_system_type=opensuse
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
linux_os_name=`grep '^NAME' /etc/os-release`
echo linux os name in /etc/os-release 
echo $linux_os_name
echo
echo
echo
linux_os_name_and_version_with_quotes=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
linux_os_name_and_version_with_quotes="${linux_os_name_and_version_with_quotes#\"}"
echo linux os name and version with quotes from awk - F = '/^NAME/{print $2}' /etc/os-release
echo $linux_os_name_and_version_with_quotes
echo
echo
echo
linux_os_name_and_version_without_quotes="${linux_os_name_and_version_with_quotes%\"}"
echo linux os name and version without quotes
echo $linux_os_name_and_version_without_quotes
echo
echo
echo
linux_os_name_and_version_2_with_PRETTY_NAME=`grep 'PRETTY_NAME' /etc/os-release`
echo linux os name and version 2 with PRETTY_NAME from /etc/os-release 
echo $linux_os_name_and_version_2_with_PRETTY_NAME
# PRETTY_NAME="Ubuntu 22.04.4 LTS"
echo
echo
echo
echo echo linux os name and version 2 with quotes
echo . . . from - awk - F =/PRETTY_NAME/ { print $ 2 } /etc/os-release
awk -F '=' '/PRETTY_NAME/ { print $2 }' /etc/os-release
# "Ubuntu 22.04.4 LTS"
echo
echo
echo
echo linux standard base lsb
echo linux os name and version without quotes - 1 - "lsb_release - d | awk - F \t  { print $ 2}"
lsb_release -d | awk -F "\t" '{print $2}'
echo linux os name and version without quotes - 2 - "lsb_release -sd"
lsb_release -sd
# Ubuntu 22.04.4 LTS
echo
echo
echo
linux_version_major_minor_version_and_friendly_name_with_VERSION=`grep '^VERSION=' /etc/os-release`
echo linux version number and friendly name with VERSION from /etc/os-release 
echo $linux_version_major_minor_version_and_friendly_name_with_VERSION
# VERSION="22.04.4 LTS (Jammy Jellyfish)"
echo
echo
echo
linux_version_major_minor_revision_with_VERSION_ID=`grep 'VERSION_ID' /etc/os-release`
echo linux version major minor revision with VERSION_ID from /etc/os-release 
echo $linux_version_major_minor_revision_with_VERSION_ID
echo
echo
echo
echo linux standard base lsb release version in format major.minor "lsb_release -sr"
lsb_release -sr
#18.04
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
echo
echo
echo
echo "lsb_release - d | awk {print $ 3}"
lsb_release -d | awk '{print $3}'
echo
echo
echo
echo "lsb_release -a"
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
echo uname = unix name
uname
# Linux
echo
echo uname as a variable ...
unix_name=$(uname)
echo $unix_name
echo
echo
echo uname in lower case
unix_name_in_lower_case=$(uname | tr '[:upper:]' '[:lower:]')
echo $unix_name_in_lower_case
# linux
echo
echo
echo
echo "echo uname -a .... full unix name with kernel version"
echo uname -a
uname -a
# Linux ip-172-31-29-138.ec2.internal 6.1.66-91.160.amzn2023.x86_64 #1 SMP PREEMPT_DYNAMIC Wed Dec 13 04:50:24 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
echo
echo
echo "uname -srm .... unix name short version ... s = kernel ... r = release ... m = machine hardware"
unix_short_name=`uname -srm`
sleep 1
echo $unix_short_name
# Linux 6.1.66-91.160.amzn2023.x86_64 x86_64echo 
echo
echo
echo
echo get linux distribution name using 1 lsb-release 2 lsb 3 uname in that order
if [ "$unix_name" == "Linux" ]; then
    if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
        distribution_name=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'//)
        distribution_name_in_lower_case=$((lsb_release -i | cut -d: -f2 | sed s/'^\t'//) | tr "[:upper:]" "[:lower:]")
    else
        distribution_name=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1)
        distribution_name_in_lower_case=$((ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1) | tr "[:upper:]" "[:lower:]")
    fi
fi
if [ "$distribution_name" == "" ]; then
 distribution_name=$unix_name
 distribution_name_in_lower_case=$unix_name_in_lower_case
fi
echo distribution name is 
echo $distribution_name
echo
echo
echo
echo distribution name in lower case is
echo $distribution_name_in_lower_case
echo
echo
echo
echo 
distribution_name_in_lower_case_2=$(echo $distribution_name_in_lower_case | tr "[:upper:]" "[:lower:]")
echo distribution name 2 in lower case is
echo $distribution_name_in_lower_case_2
echo
echo
echo
if [[  "$operating_system_type" == "ubuntu_distribution" ]]; then
    echo operating system installed is ubuntu
fi
if [[  "$operating_system_type" == "fedora" ]]; then
    echo "Amazon Linux AWS version ... 4 ways to say the same thing ..." 
    echo "cat /etc/system-release"
    echo "cat /usr/lib/system-release"
    echo "cat /usr/lib/system-release"
    echo "cat /etc/amazon-linux-release"
    cat /etc/system-release
    # Amazon Linux release 2023 (Amazon Linux)
fi
sleep 1
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
if [[  "$operating_system_type" == "fedora" ]]; then
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
fi
echo virtualization details of the amazon vm host and os
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
sleep 1
if [[  "$id_like" == "debian" ]]; then
    echo "======================================================================="
    echo "====                    debian linux                               ===="
    echo "======================================================================="
    echo apt-get update 004-426
    sudo apt-get -qq update -y > /dev/null
    sleep 1
    echo apt-get upgrade 004-429
    sudo apt-get -qq upgrade -y > /dev/null
    sleep 1
    echo "======================================================================="
    echo "====           update various services 04330                       ===="
    echo "======================================================================="
    sudo systemctl restart systemd-journald.service 
    sleep 1
    sudo /etc/needrestart/restart.d/systemd-manager
    sudo systemctl restart systemd-networkd.service
    sudo systemctl restart systemd-resolved.service
    sudo systemctl restart systemd-logind.service
    sudo systemctl restart unattended-upgrades.service
    sudo systemctl restart user@1000.service
    echo "apt-get install gcc
    sudo apt-get -qq install gcc -y > /dev/null
    sleep 1
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
    echo "======================================================================="
    echo "====                 sudo yum update 04400                         ===="
    echo "======================================================================="
    echo yum update
    sudo yum update -y
    echo dnf update
    sudo dnf update -y
    echo "======================================================================="
    echo "====                 sudo yum upgrade 04410                        ===="
    echo "======================================================================="
    echo yum upgrade
    sudo yum upgrade -y 
    echo dnf upgrade
    sudo dnf upgrade -y
    echo "======================================================================="
    echo "====                   yum install gcc 04420                       ===="
    echo "======================================================================="
    sudo yum install gcc -y
elif [[  "$id_like" == "suse opensuse" ]]; then
    echo operating system id_like is opensuse
    sudo zypper refresh
    suzo zypper update
else
    echo operating system id_like $id_like is not recognised
fi

if [[  "$operating_system_type" == "opensuse" ]]; then
    echo operating system id_like is opensuse
    sudo zypper refresh
    suzo zypper update
fi
echo
echo
echo
echo apt get version apt-get - v
apt-get -v 
echo
echo
echo
sudo apt-get update -y > /dev/null
sleep 1
export id_like
export unix_name
export unix_short_name
export unix_name_in_lower_case
export distribution_name_in_lower_case
export operating_system_type
export PRETTY_NAME
echo "====================================================================="
echo "====            query linux ... complete 004-521                 ===="
echo "====================================================================="
echo
echo
echo
echo