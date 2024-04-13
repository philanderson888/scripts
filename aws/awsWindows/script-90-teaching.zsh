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
echo "====      * * *   commands are totally silent        * * *     ===="
echo "==================================================================="
echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
sudo chmod 777 /var/cache/debconf/ 
sudo chmod 777 /var/cache/debconf/passwords.dat
echo totally silent apt get install
sudo apt-get install -y -q >> output.txt
echo totally silent apt get install dialog
sudo apt-get install dialog -y -q >> output.txt
echo totally silent apt get install apt-utils
sudo apt-get install apt-utils -y -q >> output.txt
echo totally silent apt get install node js - wow! this is the one!!!
sudo apt-get -qq install nodejs -y >> output.txt
echo
echo
echo
echo node version
node --version
echo npm version
npm --version
echo
echo
echo
#echo "adding some commands to .zshrc to get bash to recognise zsh"
#echo "not sure"
#cat ~/.bashrc >> ~/.zshrc
#cat ~/.bash_profile >> ~/.zshrc
echo "features learned in logical format - for ease of finding them"
echo
echo
echo
echo move to js folder
mkdir js
mv ./script-90-teaching.js js
mv ./script-90-package.json js
echo
echo
echo
echo cd js
cd js
echo
echo
echo
echo mv ./script-90-package.json package.json
mv ./script-90-package.json package.json
echo
echo
echo
echo "list files"
ls
echo
echo
echo
echo cat package json
cat package.json
sleep 1
echo
echo
echo
echo "=============================================================="
echo "====                   npm install                        ===="
echo "=============================================================="
npm install
echo "=============================================================="
echo "====                     run node                         ===="
echo "=============================================================="
node ./script-90-teaching.js
