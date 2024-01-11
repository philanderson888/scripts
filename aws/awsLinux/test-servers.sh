#!/bin/sh

instance_public_ip=$(aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)
echo instance public ip is $instance_public_ip
ip=$instance_public_ip

echo now lets see summary of all web servers before we terminate the instance ...
echo attempting to curl servers on various ports
echo ip is $ip

dt=$(date '+%H:%M:%S');
echo tesing servers starting at time $dt 

echo web server on port 80
curl $ip -s

echo server 05 apache
curl $ip:3005 -s

echo server 06 node     
curl $ip:3006 -s

echo server 07 bun
curl $ip:3007 -s

echo server 08 express 08
curl $ip:3008 -s

echo server 09 on react was too slow so not running it ...  
