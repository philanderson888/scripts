#!/bin/zsh
zsh
echo sudo apt-get install python3-pip
sudo apt-get -qq install python3-pip -y >> output.txt
echo
echo
echo
echo is python pip installed
echo pip3 --version
pip3 --version
echo
echo
echo
echo which pip3
which pip3
echo
echo
echo
echo pip3 --help
pip3 --help
