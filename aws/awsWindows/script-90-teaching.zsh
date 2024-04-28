#!/bin/zsh
echo zsh
zsh
echo
echo
echo
echo cd ~
cd ~
echo
echo
echo
echo ls -lah
ls -lah
echo
echo
echo
echo cd .oh-my-zsh
cd ./.oh-my-zsh
echo
echo
echo
echo ls -lah
ls -lah
echo
echo
echo
echo cat ./oh-my-zsh
cat ./oh-my-zsh
echo
echo
echo
echo cd ~
cd ~
echo "==================================================================="
echo "==================================================================="
echo "====             teach node script launcher                    ===="
echo "==================================================================="
echo "==================================================================="
echo
echo
echo
echo "==================================================================="
echo "====             install node and npm                          ===="
echo "==================================================================="
echo "curl - f s S L https://deb.nodesource.com/setup_20.x   sudo - E zsh"
curl --silent -fsSL https://deb.nodesource.com/setup_20.x | sudo -E zsh
echo
echo
echo
echo "curl - f s S L https://deb.nodesource.com/setup_20.x   sudo - E bash"
curl --silent -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash
echo
echo
echo
echo "E means preserve environment"
echo "sudo - E bash downloads, executes with sudo, using bash, preserving the existing environment variables"
echo
echo
echo
echo "==================================================================="
echo "====                  install node"
echo "====      * * *   commands are totally silent        * * *     ===="
echo "==================================================================="
echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
sudo chmod 777 /var/cache/debconf/ 
sudo chmod 777 /var/cache/debconf/passwords.dat
echo
echo
echo
echo touch ~/output.txt
echo chmod 777 ~/output.txt
echo totally silent apt get install
sudo apt-get install -y -q >> ~/output.txt
echo
echo
echo
echo totally silent apt get install dialog
sudo apt-get install dialog -y -q >> ~/output.txt
echo
echo
echo
echo totally silent apt get install apt-utils
sudo apt-get install apt-utils -y -q >> ~/output.txt
echo
echo
echo
echo totally silent apt get install node js - wow! this is the one!!!
sudo apt-get -qq install nodejs -y >> ~/output.txt
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
echo sudo mkdir js
sudo mkdir js
echo
echo
echo
echo ls
ls 
echo
echo
echo
echo mv ./script-90-teaching.js js
sudo mv ./script-90-package.json js
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
