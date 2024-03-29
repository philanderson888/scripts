#!/bin/zsh
echo "======================================================================="
echo "====                           install vue               =================="
echo "======================================================================="
library=vue
projectName="${library}WebServer"
port=3010
echo
echo installing $library web server
startTime="$(date +%s)"
echo installing create-vue
npm install -g create-vue
npm install create-vue
git clone https://github.com/BootstrapDash/StarAdmin-Free-Vue-Admin-Template.git
cd StarAdmin-Free-Vue-Admin-Template
npm install
endTime=$(date +%s)
scriptDuration=$(($endTime-$startTime))
echo ... 6.12 ... $library web server install complete ... and took ... $scriptDuration seconds
echo
