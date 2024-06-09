#!/bin/zsh
zsh
echo "=============================================================="
echo "====              copy raw server files                   ===="
echo "=============================================================="
cd ~
echo mkdir node25
mkdir node25
echo
echo
echo
echo ls
ls
echo
echo
echo
echo mv ./script-25-server.js node25
mv ./script-25-server.js node25
echo
echo
echo
echo ls
ls
echo
echo
echo
echo cd node25
cd node25
echo "=============================================================="
echo "====              run node web server                     ===="
echo "=============================================================="
echo start web server
node script-25-server.js
echo end of script 25 node web server
