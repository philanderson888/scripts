#!/bin/sh
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
for port in 80 3000 3009 3010 5173 57329 58262 54892 63892 51547 51279 
do
    echo
    echo
    echo
    echo
    echo
    echo
    echo port $port
    echo 10.0.0.4:$port
    curl 10.0.0.4:$port
    sleep 3
done
