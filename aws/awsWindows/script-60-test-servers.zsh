#!/bin/zsh
echo zsh
zsh
echo cd ~
cd ~
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
echo testing web server with curl command
echo server 06 node
echo curl localhost:3006
curl localhost:3006
echo curl $ip:3006 -s
curl $ip:3006 -s
echo
echo
echo
echo server 07 bun
curl $ip:3007 -s
echo
echo
echo
echo "======================================================================="
echo "====                       curl ipv4   2                           ===="
echo "======================================================================="
curl localhost:3008 -s
echo "======================================================================="
echo "====                       curl ipv6    2                          ===="
echo "======================================================================="
curl ::1:3008 -s
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

