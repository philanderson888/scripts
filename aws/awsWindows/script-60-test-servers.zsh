#!/bin/zsh
echo zsh
zsh
echo cd ~
cd ~
ip=$public_ip_address
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
port=3006
echo node server port $port
echo curl localhost:$port
curl localhost:$port
echo curl $ip:$port -s
curl $ip:$port -s
echo
echo
echo
port=3007
echo bun server port $port
curl $ip:$port -s
echo
echo
echo
echo "======================================================================="
echo "====                       curl ipv4   2                           ===="
echo "======================================================================="
port=3008
curl localhost:$port -s
curl ::1:$port -s
echo
echo
echo
echo "======================================================================="
echo "====                    react - port 3009 3010                     ===="
echo "======================================================================="
port=3009
curl localhost:$port -s
curl ::1:$port -s
curl $ip:$port -s
port=3010
curl localhost:$port -s
curl ::1:$port -s
curl $ip:$port -s
echo "======================================================================="
echo "====                 vue - ports 3020 and 5173                     ===="
echo "======================================================================="
port=3020
echo curl $port
curl $ip:$port -s
echo
echo
echo
port=5173
echo curl $port
curl http://localhost:$port
curl $ip:$port -s
curl 127.0.0.1:$port -s
