#!/bin/zsh
echo zsh
zsh
ip=$(hostname --ip-address)
echo ip is $ip
echo
echo
echo
dt=$(date '+%H:%M:%S');
echo testing servers starting at time $dt 
echo
echo
echo
for port in 80 3000 3007 3008 3009 3010 3020 5173 57329 58262 54892 63892 51547 51279 
do
    echo
    echo
    echo
    echo port $port
    echo localhost
    curl localhost:$port
    curl 127.0.0.1:$port
    echo
    echo local ip
    curl $ip:$port -s
done
