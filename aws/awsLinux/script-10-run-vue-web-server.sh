#!/bin/sh

echo

library=vue
projectName=$library' web server'
port=5173

startTime="$(date +%s)"

echo =================================================================================
echo ====================     $projectName - git clone project   =====================w
echo =================================================================================

echo creating vue@latest project - failing at present - avoiding this as failing 
# npm create vue@latest $projectName
# cd $projectName

echo instead installing from github repo
git clone https://github.com/philanderson888/vue
cd vue/projects/starter-template-03
#sed -i 's/3000/3008/g' server.js
#sed -i 's/listening on port/node express server 08 responding on port/g' server.js

 
echo ==============================================================================
echo ==================      $project - npm install                    ===================
echo ==============================================================================

echo install libraries for vue project
npm install
echo web server should now be installed


echo ============================================================================
echo ==================     $project - run web server          ====================
echo ============================================================================

echo starting $library web server on port $port
pause 
read -p
npm run build
read -p
npm run dev
read -p
echo $library web server is running
read -p


echo ===============================================================================
echo ===============        $project - test web server          ====================
echo ===============================================================================
echo test $library web server with local curl ipv4
curl localhost:$port -s
echo test $library web server with local curl ipv6
curl ::1:$port -s
echo $library web server curl testing complete
echo
echo
echo
echo