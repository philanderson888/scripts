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
echo cd ~
cd ~
echo ls
ls
echo
echo
echo
echo cat vm_1_public_ip.txt
cat vm_1_public_ip.txt
echo
echo
echo
vm_1_public_ip=$(cat vm_1_public_ip.txt)
echo public ip of other server is $vm_1_public_ip
echo ports are 80, 3000, 57329, 58262, 54892, 63892, 51547, 51279
for port in 80 3000 57329 58262 54892 63892 51547 51279 
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
    echo $vm_1_public_ip:$port
    curl $vm_1_public_ip:$port
    sleep 3
done

rawTextUrl=https://raw.githubusercontent.com/philanderson888/scripts/master/sample-apps/text/sample.txt
echo
echo
echo
echo curl $rawTextUrl
curl $rawTextUrl
echo
echo
echo