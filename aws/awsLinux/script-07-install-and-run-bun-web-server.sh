echo running script-07-install-and-run-bun-web-server.sh
echo now lets try with a bun server


echo move bun server to fresh folder
mkdir -p bun
mv ./bunServer.tsx bun
cd bun
chmod 777 bunServer.tsx

echo starting bun web server
bun bunServer.tsx
echo curl bun web server to test it out
curl localhost:3007 -s
