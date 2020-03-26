#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y

sudo apt-get install python-software-properties
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y
sudo npm install pm2 -g

echo 'hello' > testfile.txt

echo ' ' >> .bashrc 
echo 'export VAR_01=variable01' >> .bashrc
echo 'export VAR_02=variable02' >> .bashrc

echo 'test' >> /home/vagrant/.bashrc