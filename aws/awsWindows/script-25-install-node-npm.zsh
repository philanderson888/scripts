#!/bin/zsh
install_single_instance_of_node=true
if [ "$install_single_instance_of_node" = true ] ; then
    echo "==================================================================="
    echo "====             install node and npm                          ===="
    echo "==================================================================="
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash
    sudo apt-get install -g nodejs -y
    node --version
    npm --version
#    echo "==================================================================="
#    echo "====                     install npm globally                     ===="
#    echo "==================================================================="
#    sudo apt-get install npm -y
#    npm install -g npm@latest
else
    echo "==================================================================="
    echo "====                        install nvm 1                            ===="
    echo "==================================================================="
    echo "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh -s | bash
    echo "==================================================================="
    echo "====                            configure nvm 1                               ===="
    echo "==================================================================="
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    echo "==================================================================="
    echo "====                            activate nvm 1                                ===="
    echo "==================================================================="
    source ~/.nvm/nvm.sh
    echo "==================================================================="
    echo "====                      check nvm version                            ===="
    echo "==================================================================="
    echo nvm version
    nvm --version
    echo nvm -v
    nvm -v
    echo "==================================================================="
    echo "====                   nvm select a version of node                  ===="
    echo "==================================================================="
    echo source bashrc
    source ~/.bashrc
    echo nvm list-remote
    nvm list-remote >> output.txt
    echo "====================================================================="
    echo "====                   install node LTS                          ===="
    echo "====================================================================="
    echo nvm install --lts
    nvm install --lts
    echo nvm install lts/iron
    nvm install lts/iron
    echo nvm use --lts
    nvm use --lts
    echo nvm list
    nvm list
fi
echo "==================================================================="
echo "====                  node and npm version                     ===="
echo "==================================================================="
echo node version
node --version
echo npm version
npm --version
node_installed=true
echo "====================================================================="
echo "====                  node run js command                        ===="
echo "====================================================================="
node -e "console.log('Running Node.js ' + process.version)"
echo "======================================================================="
echo "====                  install node complete                        ===="
echo "======================================================================="
echo "======================================================================="
echo "====                     git clone express  1                               ===="
echo "======================================================================="
git clone https://github.com/strongloop/express-example-app --quiet
echo folder has been downloaded
echo move into folder
cd express-example-app
echo list files
ls
echo rename the ports
sed -i 's/3000/3008/g' server.js
sed -i 's/listening on port/node express server 08 responding on port/g' server.js
echo cat the server file
cat server.js
echo "======================================================================="
echo "====                           npm install express  1                        ===="
echo "======================================================================="
npm install
echo list files now
ls
echo "======================================================================="
echo "====                           npm start express  1              ============"
echo "======================================================================="
echo cannot run this right now ... have to start in a different process ...
echo ... so it does not hang the thread ...
#npm start
echo "======================================================================="
echo "====                              curl ipv4   1                  ============"
echo "======================================================================="
#curl localhost:3008 -s
echo "======================================================================="
echo "====                              curl ipv6    1                 ============"
echo "======================================================================="
#curl ::1:3008 -s
echo "======================================================================="
echo "====                        express complete    1               ============="
echo "======================================================================="
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
#npm install -g create-vue
npm install create-vue
git clone https://github.com/BootstrapDash/StarAdmin-Free-Vue-Admin-Template.git
cd StarAdmin-Free-Vue-Admin-Template
npm install
endTime=$(date +%s)
scriptDuration=$(($endTime-$startTime))
echo ... 6.12 ... $library web server install complete ... and took ... $scriptDuration seconds
echo
echo "======================================================================="
echo "====                          install zip                              ===="
echo "======================================================================="
sudo apt-get install unzip -y
echo "======================================================================="
echo "=================                  install bun           =============================="
echo "======================================================================="
curl -fsSL https://bun.sh/install | bash
bun_installed=true
echo "======================================================================="
echo "====                             install bun complete                      ===="
echo "======================================================================="


