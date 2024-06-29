#!/bin/zsh
zsh
echo cd ~
cd ~
echo
echo
echo
echo pull down source files for servers from github
echo git clone philanderson888 scripts
git clone https://github.com/philanderson888/scripts
echo
echo
echo
echo now find node server
echo cd ~/scripts/sample-apps/node/node-01-51279
cd ~/scripts/sample-apps/node/node-01-51279
echo
echo
echo
echo now run node server
node node-01-51279-server.js
