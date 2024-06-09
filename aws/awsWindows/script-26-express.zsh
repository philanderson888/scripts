#!/bin/zsh
zsh
echo "======================================================================="
echo "====                      install express                          ===="
echo "======================================================================="
echo "tutorial https://code.visualstudio.com/docs/nodejs/nodejs-tutorial"
echo
echo install express using ...
echo touch ~/.zshrc
touch ~/.zshrc
echo
echo
echo
echo amend the path so it accepts npm install -g commands
echo 'export NODE_PATH="'$(npm root -g)'"' >> ~/.bash_profile && . ~/.bash_profile
echo 'export NODE_PATH="'$(npm root -g)'"' >> ~/.zshrc && . ~/.zshrc
echo
echo
echo
echo sudo npm install express -g
sudo npm install -g express -y
echo
echo
echo
echo npm install express-generator
sudo npm install -g express-generator -y
echo
echo
echo
echo "======================================================================="
echo "====                  express has been installed                   ===="
echo "======================================================================="
echo 
echo
echo