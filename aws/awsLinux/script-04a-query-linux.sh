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
upgrade_linux_fedora=true
upgrade_linux_ubuntu=true
if [ "$upgrade_linux_fedora" = true ] ; then
    echo =====================================================
    echo ===========  4.1  upgrade to latest linux    ===========
    echo =====================================================
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
fi
if [ "$upgrade_linux_ubuntu" = true ] ; then
    echo ==============================================================================
    echo ========    4.1  upgrade to latest linux ...                          ========
    echo ==============================================================================
    echo apt update and apt upgrade
    sudo apt update -y
    apt update -y
    sudo apt upgrade -y
    apt upgrade -y
    echo
    echo
    echo
fi
echo upgrades finished ... press any key to proceed ...
echo
echo
echo
echo 1
echo
echo
echo
read -n 1 -s
echo
echo
echo
echo 2
echo
echo
echo
read
read -p
echo
echo
echo
echo 3
echo
echo
echo
read -p "Press enter to continue"
echo
echo
echo
echo 4
echo
echo
echo
printf "%s " "Press enter to continue"
read ans
echo
echo
echo
echo 5
echo
echo
echo
read -n 1 -s -r -p "Press any key to continue"
echo
echo
echo
echo 6
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
echo linux os details
echo cat /etc/os-release = cat /usr/lib/os-release 
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
echo script 04 query linux complete .......
