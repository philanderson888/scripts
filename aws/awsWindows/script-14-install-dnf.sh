#!/bin/bash
echo "=============================================================="
echo "====                                    install dnf                          ===="
echo "====                                       $minutes:$seconds                               ===="
echo "=============================================================="
echo install dnf
if [ "$os" == "$os_ubuntu" ] ; then
    echo do not install dnf on ubuntu
    dnf_installed=false
elif [ "$os" == "$os_fedora" ] ; then
    echo if fedora install via yum
    sudo yum install dnf
    dnf_installed=true
elif
    [ "$os" == "$os_opensuse" ] ; then
    echo if opensuse install with zypper
    sudo zypper install dnf
    dnf_installed=false
else
    echo dnf not installed
    dnf_installed=false
fi
