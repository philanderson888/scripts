#!/bin/bash
echo =====================================================
echo =========== script 04 query linux details ===========
echo =====================================================
echo
echo
echo what version of linux is being run
uname -a
# Linux ip-172-31-29-138.ec2.internal 6.1.66-91.160.amzn2023.x86_64 #1 SMP PREEMPT_DYNAMIC Wed Dec 13 04:50:24 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux

echo what version of linux is being run - short version
uname -srm
# Linux 6.1.66-91.160.amzn2023.x86_64 x86_64
echo

echo what version of amazon linux is being run
cat /etc/system-release
# Amazon Linux release 2023 (Amazon Linux)
echo

echo what is the virtualization details of the amazon vm host and os
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

echo amazon linux details
cat /etc/*release
# Amazon Linux release 2023 (Amazon Linux)
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
# Amazon Linux release 2023 (Amazon Linux)
echo

echo linux os details
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
echo script 04 query linux complete .......
