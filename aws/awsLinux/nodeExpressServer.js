echo now lets try with a bun server

echo first install bun
curl -fsSL https://bun.sh/install | bash

echo lets move the bun server to a separate directory
mkdir -p bun
mv ./bunServer.tsx bun
cd bun
echo stopping any existing bun server
ps -ef | grep 'bun'
ps aux | grep 'bun'
killall -I bun
bun bunServer.tsx
echo now about to curl the bun server
curl localhost:3001 -s

