#!/bin/sh
library=vue
projectName=$library' web server'
port=3010
startTime="$(date +%s)"
echo
echo
echo
echo "======================================================================="
echo ====================     $projectName - git clone project   =====================w
echo "======================================================================="
echo creating vue@latest project - failing at present - avoiding this as failing 
# npm create vue@latest $projectName
# cd $projectName
echo
echo
echo
githubRepository=https://github.com/philanderson888/vue
projectPath=/projects/starter-template-03
echo cloning github repo $githubRepository
git clone $githubRepository
cd $projectPath
echo
echo
echo
echo "======================================================================="
echo ==================            $project - npm install               ===================
echo "======================================================================="
echo install libraries for vue project
npm install
echo web server should now be installed
echo
echo
echo
echo "======================================================================="
echo ==================     $project - run web server          ====================
echo "======================================================================="
echo starting $library web server on port $port
# npm run build
npm run dev
