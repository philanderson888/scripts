#!/bin/sh

echo testing out web servers if they are running ok from perspective of ec2 instance where the servers are running

echo web server on port 80
curl localhost -s

echo server 05 apache
curl localhost:3005 -s

echo server 06 node     
curl localhost:3006 -s

echo server 07 bun
curl localhost:3007 -s

echo server 08 express 08
curl localhost:3008 -s

echo server 09 react - not running
