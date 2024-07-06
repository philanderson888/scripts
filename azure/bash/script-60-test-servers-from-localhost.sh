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
    echo curl localhost:$port
    curl 127.0.0.1:$port
    sleep 3
    #echo 
    #echo curl 127.0.0.1:$port
    #curl 127.0.0.1:$port
    #echo 
    #echo curl ::1:$port
    #echo
    #curl ::1:$port
    #echo curl $ip:$port
    #curl $ip:$port
done
