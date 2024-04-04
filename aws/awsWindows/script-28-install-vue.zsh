#!/bin/zsh
zsh
cd ./.oh-my-zsh
zsh
cd ..
echo "=================================================================="
echo "====                      install vue  2                      ===="
echo "=================================================================="
library=vue
projectName="${library}WebServer"
port=3010
echo
echo installing $library web server
startTime="$(date +%s)"
echo
echo
echo
echo installing create-vue
sudo npm install -g create-vue
npm install create-vue
echo
echo
echo
echo cloning vue sample website 'Star Admin'
git clone https://github.com/BootstrapDash/StarAdmin-Free-Vue-Admin-Template.git
cd StarAdmin-Free-Vue-Admin-Template
echo
echo
echo
echo ls
ls
echo
echo
echo
echo npm install
npm install
echo
echo
echo
endTime=$(date +%s)
scriptDuration=$(($endTime-$startTime))
echo "... 6.12 ... $library web server install complete ... and took ... $scriptDuration seconds"
echo
