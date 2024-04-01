#!/bin/zsh
zsh
cd ./.oh-my-zsh
zsh
cd ..
ip=$public_ip_address

echo now lets see summary of all web servers before we terminate the instance ...
echo attempting to curl servers on various ports
echo ip is $ip
echo
echo
echo
dt=$(date '+%H:%M:%S');
echo tesing servers starting at time $dt 
echo
echo
echo
echo apache web server on port 80
curl $ip -s
echo
echo
echo
echo server 06 node     
curl $ip:3006 -s
echo
echo
echo
echo server 07 bun
curl $ip:3007 -s
echo
echo
echo
echo server 08 express 08
curl $ip:3008 -s
echo
echo
echo
echo server 09 on react was too slow so not running it ...  
echo
echo
echo
echo server vue  
curl $ip:3010 -s
echo
echo
echo
