#!/bin/bash
echo ===================================================
echo =========== script 05 apache web server ===========
echo ===================================================
echo
startTime="$(date +%s)"

echo =============================================
echo ====== apache set up os and libraries =======
echo =============================================

# install apache
echo installing apache httpd libraries
sudo yum install httpd -y
# check http libraries are up to date
echo checking httpd is latest
sudo yum update httpd -y
# install firewall
echo
echo installing firewall
sudo yum install firewalld -y
# enable firewall
echo
echo enabling firewall ...
sudo systemctl enable firewalld
# start firewall
echo
echo starting firewall ...
sudo systemctl start firewalld
# check firewall is running
sudo firewall-cmd --state
# running
# get zones
sudo firewall-cmd --permanent --get-zones
# FedoraServer FedoraWorkstation block dmz drop external home internal public trusted work
# add http to firewall
sudo firewall-cmd --zone=public --add-service=http --permanent
# success
# add https to firewall
sudo firewall-cmd --zone=public --add-service=https --permanent
# success
# add ports to firewall
sudo firewall-cmd --zone=public --add-port=80/tcp
sudo firewall-cmd --zone=public --add-port=443/tcp
sudo firewall-cmd --zone=public --add-port=443/udp
sudo firewall-cmd --zone=public --add-port=80/udp
sudo firewall-cmd --zone=public --list-ports
sudo firewall-cmd --zone=public --add-port=5000/tcp
sudo firewall-cmd --zone=public --add-port=3000/tcp
sudo firewall-cmd --zone=public --add-port=3001/tcp
sudo firewall-cmd --zone=public --add-port=3002/tcp
sudo firewall-cmd --zone=public --add-port=3003/tcp
sudo firewall-cmd --zone=public --add-port=3004/tcp
sudo firewall-cmd --zone=public --add-port=3005/tcp
sudo firewall-cmd --zone=public --add-port=3006/tcp
sudo firewall-cmd --zone=public --add-port=3007/tcp
sudo firewall-cmd --zone=public --add-port=3008/tcp
sudo firewall-cmd --zone=public --add-port=3009/tcp
sudo firewall-cmd --zone=public --add-port=3010/tcp
sudo firewall-cmd --zone=public --add-port=3020/tcp
sudo firewall-cmd --zone=public --list-ports
# 80/tcp 443/tcp 5000/tcp 80/udp 443/udp
# list services
sudo firewall-cmd --get-services

# install web server and related services
echo 
echo installing apache web server
sudo dnf install -y httpd php php-mysqli mariadb105
echo
echo starting apache web server
sudo systemctl start httpd
# configure web server to start after every boot
sudo systemctl enable httpd

# find the text file containing the root web page
# grep --include=index.html -r '/' -e "works"
# /usr/share/httpd/noindex/index.html:<html><body><h1>It works!</h1></body></html>
echo
echo now writing index.html at web server root location /usr/share/httpd/noindex/index.html
cd /usr/share/httpd/noindex/
sudo chmod 777 index.html
sudo echo "<html><h1>Web server from phil</h1></html>" > index.html
echo checking file exists by printint out the raw html ...
cat index.html

echo does apache web server work on port 80
# does the web server work?
curl localhost -s
# <html><body><h1>It works!</h1></body></html>

## now look at https
echo is http enabled
sudo systemctl is-enabled httpd

echo server 05 complete - apache http web server ...
echo 
echo 
echo 

# install https
# echo now installing https *** note - this fails so will come back to it later ***
# sudo yum install -y mod_ssl
# generate self signed certificate
# echo generating self signed certificate
# cd /etc/pki/tls/certs
# echo not sure if this command works or not
# sudo ./make-dummy-cert localhost.crt

endTime=$(date +%s)
duration=$((endTime-startTime))
echo installing and running apache web server took $duration seconds
echo
echo script 05 apache web server complete .......
