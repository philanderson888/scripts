#!/bin/zsh
echo zsh
zsh
echo cd ~
cd ~
echo "==================================================================="
echo "==================================================================="
echo "====                   install mongo shell                     ===="
echo "==================================================================="
echo "==================================================================="
echo
echo
echo install gnupg encryption
echo sudo apt-get install gnupg
sudo apt-get install gnupg -y
echo
echo
echo
echo download pgp encryption
echo https://www.mongodb.org/static/pgp/server-7.0.asc 
echo run through gpg encryption tee /etc/apt/trusted.gpg.d/server-7.0.asc
wget -qO- https://www.mongodb.org/static/pgp/server-7.0.asc | sudo tee /etc/apt/trusted.gpg.d/server-7.0.asc
echo
echo
echo
echo create the /etc/apt/sources.list.d/mongodb-org-7.0.list file for Ubuntu 22-04 Jammy:
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
echo
echo
echo
echo sudo apt-get update
sudo apt-get update -y
echo
echo
echo
echo install mongo shell
echo mongosh supports open ssl
echo sudo apt-get install mongodb-mongosh
sudo apt-get install mongodb-mongosh -y
echo
echo
echo
echo mongosh --version
mongosh --version
echo "==================================================================="
echo "====                   mongo shell installed                   ===="
echo "==================================================================="
