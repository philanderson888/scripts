#!/bin/sh

echo testing out web servers from ec2 localhost
echo
echo
echo
echo web server on port 80
curl localhost -s
echo
echo
echo
echo server 05 apache
curl localhost:3005 -s
echo
echo
echo
echo server 06 node     
curl localhost:3006 -s
echo
echo
echo
echo server 07 bun
curl localhost:3007 -s
echo
echo
echo
echo server 08 express 08
curl localhost:3008 -s
echo
echo
echo
echo server 09 on react was too slow so not running it ...  
echo
echo
echo
echo server vue
curl localhost:3010 -s
echo
echo
echo
