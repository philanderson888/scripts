#!/bin/zsh
zsh
python_version=$(python3 --version)
echo python version 
echo $python_version
echo
echo
echo
python_platform_version=$(python3 -mplatform)
echo python platform ... linux os on which python is built .... 
echo $python_platform_version
echo
echo
echo
echo sudo apt-get install python3
sudo apt-get -qq install python3 -y > /dev/null
echo 
echo
echo
echo python version
python3 --version
echo 
echo
echo
echo python platform ... linux os on which python is built .... 
python3 -mplatform
echo
echo
echo
echo numpy is the python scientific library ... numbers in python ... but has been extended to many other scientific uses
echo https://numpy.org/
echo 
