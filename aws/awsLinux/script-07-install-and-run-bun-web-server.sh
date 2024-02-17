echo script-07-install-and-run-bun-web-server.sh running
serverType=bun
echo script 7 ... build $serverType web server ...

echo ... 7.0 ... before we start kill any existing bun services
#ps -ef | grep 'bun'
#ps aux | grep 'bun'
#killall -I bun


echo ... 7.1 ... new folder $serverType
mkdir -p $serverType
echo ... 7.2 ... move $serverType server new folder
mv ./bunServer.tsx $serverType
cd $serverType

echo ... 7.3 ... allow permissions on the $serverType server
chmod 777 bunServer.tsx

echo ... 7.4 ... start $serverType web server
bun bunServer.tsx

echo ... 7.5 ... test $serverType with curl 
curl localhost:3007 -s

