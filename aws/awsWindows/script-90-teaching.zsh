#!/bin/zsh
zsh
cd ./.oh-my-zsh
zsh
cd ..
echo
echo
echo
echo teaching script

echo "==================================================================="
echo "====             install node and npm                          ===="
echo "==================================================================="
echo "==================================================================="
echo "====        obtaining node binaries via curl command           ===="
echo "==================================================================="
echo "seems like i need this command ... but how do i make it silent !?!?!??!"
curl --silent -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash

echo "note that - E means 'preserve environment' ... but of the host ... or this environment ? not sure ... can investigate ..."
echo "sudo - E will download the file then execute it with sudo commands, using bash, preserving the existing environment variables ... interesting ... "
echo "can I do the same thing using zsh ? worth a try !!!"

echo "==================================================================="
echo "====                  install node"
echo "==================================================================="
echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
sudo chmod 777 /var/cache/debconf/ 
sudo chmod 777 /var/cache/debconf/passwords.dat
sudo apt-get install -y -q >> output.txt
sudo apt-get install dialog -y -q >> output.txt
sudo apt-get install apt-utils -y -q >> output.txt
sudo apt-get -qq install nodejs -y >> output.txt
node --version
npm --version

echo "adding some commands to .zshrc to get bash to recognise zsh"
echo "not sure"
#cat ~/.bashrc >> ~/.zshrc
#cat ~/.bash_profile >> ~/.zshrc
node -v
npm -v
echo 
echo
echo "features learned in logical format - for ease of finding them"
echo "list files"
ls
echo move to js folder
mkdir js
mv ./script-90-teaching.js js
mv ./package.json js
cd js
echo list files in js folder
ls
echo "=============================================================="
echo "====                   npm install                        ===="
echo "=============================================================="
npm install
echo "=============================================================="
echo "====                     run node                         ===="
echo "=============================================================="
node ./script-90-teaching.js
