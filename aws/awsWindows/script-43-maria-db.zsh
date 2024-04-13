#!/bin/zsh
echo "==================================================================="
echo "==================================================================="
echo "====                        maria db                           ===="
echo "==================================================================="
echo "==================================================================="
echo sudo apt update 
sudo apt update -y
echo
echo
echo
echo install maria db
sudo apt install mariadb-server -y
echo
echo
echo
echo start maria db
sudo systemctl start mariadb.service
echo
echo
echo
echo mysql secure installation
sudo mysql_secure_installation -y
echo
echo
echo
echo test maria db
sudo systemctl status mariadb
echo
echo
echo
echo maria db version
mariadb --version
mariadb -v
mariadb -V
echo
echo
echo
echo mysqladmin version
sudo mysqladmin version
echo
echo
echo
