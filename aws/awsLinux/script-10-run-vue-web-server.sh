#!/bin/sh
library=vue
projectName=$library' web server'
port=5173
startTime="$(date +%s)"
echo
echo
echo
echo =================================================================================
echo ====================     $projectName - git clone project   =====================w
echo =================================================================================
echo creating vue@latest project - failing at present - avoiding this as failing 
# npm create vue@latest $projectName
# cd $projectName
echo
echo
echo
echo instead installing from github repo
git clone https://github.com/philanderson888/vue
cd vue/projects/starter-template-03
#sed -i 's/3000/3008/g' server.js
#sed -i 's/listening on port/node express server 08 responding on port/g' server.js
echo
echo
echo
echo ==============================================================================
echo ==================      $project - npm install                    ===================
echo ==============================================================================
echo install libraries for vue project
npm install
echo web server should now be installed
echo
echo
echo
echo ============================================================================
echo ==================     $project - run web server          ====================
echo ============================================================================
echo starting $library web server on port $port
# npm run build
npm run dev
