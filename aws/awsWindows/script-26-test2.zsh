#!/bin/zsh

echo hello from install express

#startTime="$(date +%s)"

echo "======================================================================="
echo "================= download express web server via git   ===================="
echo "======================================================================="

git clone https://github.com/strongloop/express-example-app --quiet

cd express-example-app

sed -i 's/3000/3008/g' server.js
sed -i 's/listening on port/node express server 08 responding on port/g' server.js

echo "======================================================================="
echo "=================  run npm install to pull down libraries ===================="
echo "======================================================================="
npm install
echo
echo web server should now be installed
echo "======================================================================="
echo "=================       run express web server            ===================="
echo "======================================================================="
echo lets now start the web server
npm start
echo web server should now be running
echo lets test with a curl command ipv4
curl localhost:3008 -s
echo and now same curl command with ipv6
curl ::1:3008 -s
