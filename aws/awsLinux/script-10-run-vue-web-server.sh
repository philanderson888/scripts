#!/bin/sh

echo

library=vue
projectName = $library + 'WebServer'
port=3010

startTime="$(date +%s)"

echo ==========================================================================
echo ====================   creating $library project   =======================
echo ==========================================================================

echo creating vue@latest project
npm create vue@latest $projectName
cd $projectName
#sed -i 's/3000/3008/g' server.js
#sed -i 's/listening on port/node express server 08 responding on port/g' server.js
 
echo ==============================================================================
echo =================  run npm install to pull down libraries ====================
echo ==============================================================================
npm install
echo web server should now be installed


echo ==============================================================================
echo ===================        configure the server  ==============================
echo ==============================================================================


sed -i 's/8080/3010/g' server.js


echo ============================================================================
echo ==================     run $library web server          ====================
echo ============================================================================

echo starting $library web server
npm run format
npm run dev

echo $library web server is running

echo test $library web server with local curl ipv4
curl localhost:$port -s
echo test $library web server with local curl ipv6
curl ::1:$port -s
