#!/bin/zsh
#zsh
#cd .oh-my-zsh
#zsh
#cd ..
install_single_instance_of_node=true
if [ "$install_single_instance_of_node" = true ] ; then
    echo "==================================================================="
    echo "====        obtaining node binaries via curl command 25020     ===="
    echo "==================================================================="
    curl --silent -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash
    echo "note - E means 'preserve environment'"
    echo "note - sudo - E will download the file then execute it with sudo commands"
    echo "==================================================================="
    echo "====                  install node 25030"
    echo "==================================================================="
    echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
    sudo chmod 777 /var/cache/debconf/ 
    sudo chmod 777 /var/cache/debconf/passwords.dat
    sudo apt-get install -y -q >> output.txt
    sudo apt-get install dialog -y -q >> output.txt
    sudo apt-get install apt-utils -y -q >> output.txt
    sudo apt-get -qq install nodejs -y >> output.txt
    node --version
    npm --version
    echo "adding bash commands to zsh"
    cat ~/.bashrc >> ~/.zshrc
else
    echo "==================================================================="
    echo "====                    install nvm 25040                      ===="
    echo "==================================================================="
    echo "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh -s | bash
    echo "==================================================================="
    echo "====                   configure nvm 25050                     ===="
    echo "==================================================================="
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    echo "==================================================================="
    echo "====                   activate nvm 25060                      ===="
    echo "==================================================================="
    source ~/.nvm/nvm.sh
    echo "==================================================================="
    echo "====                   check nvm version 25070                 ===="
    echo "==================================================================="
    echo "nvm version"
    nvm --version
    echo "nvm -v"
    nvm -v
    echo "==================================================================="
    echo "====               nvm select a version of node 25080          ===="
    echo "==================================================================="
    echo "source bashrc"
    source ~/.bashrc
    echo "nvm list-remote"
    nvm list-remote >> output.txt
    echo "====================================================================="
    echo "====                   install node LTS 25090                    ===="
    echo "====================================================================="
    echo "nvm install --lts"
    nvm install --lts
    echo "nvm install lts/iron"
    nvm install lts/iron
    echo "nvm use --lts"
    nvm use --lts
    echo "nvm list"
    nvm list
fi
echo "==================================================================="
echo "====                  node and npm version                     ===="
echo "==================================================================="
echo "node version"
node --version
echo "npm version"
npm --version
node_installed=true
echo "====================================================================="
echo "====                  node run js command                        ===="
echo "====================================================================="
node -e "console.log('this is node js javascript');"
node -e "console.log('node version ' + process.version);"
node -e "console.log('node processes running');"
node -e "console.log(process.versions);"
node -e "console.log('node platform ' + process.platform);"
node -e "console.log('node environment variables');"
node -e "console.log(process.env);"
echo "======================================================================="
echo "====                  install node complete                        ===="
echo "======================================================================="
echo "======================================================================="
echo "====                 download express project 25100                ===="
echo "====         git clone strongloop/express-example-app              ====" 
echo "======================================================================="
git clone https://github.com/strongloop/express-example-app --quiet
echo mv express-example-app express
mv express-example-app express
cd express
echo "list files"
ls
echo
echo
echo
echo "rename the ports"
sed -i 's/3000/3008/g' server.js
sed -i 's/listening on port/node express server 08 responding on port/g' server.js
echo "cat the server file"
cat server.js
echo "======================================================================="
echo "====               express - npm install 25110                     ===="
echo "======================================================================="
npm install
echo "npm version using npm list express"
npm list express
echo
echo
echo
echo "======================================================================="
echo "====                  npm start express 25120                      ===="
echo "====                   run in non-ui thread                        ===="
echo "======================================================================="
#npm start
#echo "======================================================================="
#echo "====                       curl ipv4   1                           ===="
#echo "======================================================================="
#curl localhost:3008 -s
#echo "======================================================================="
#echo "====                       curl ipv6    1                          ===="
#echo "======================================================================="
#curl ::1:3008 -s
echo "======================================================================="
echo "====                express built but not running 25130            ===="
echo "======================================================================="
startTime="$(date +%s)"
echo "======================================================================="
echo "====                            vue                                ===="
echo "======================================================================="
echo "======================================================================="
echo "====                npm install create-vue 25140                   ===="
echo "======================================================================="
cd ~
echo mkdir vue25140
mkdir vue25140
echo cd vue25140
cd vue25140
echo npm install create-vue
npm install create-vue
echo ls
ls
echo
echo
echo
echo "======================================================================="
echo "====                    git clone vue 25150                        ===="
echo "======================================================================="
cd ~
echo git clone github kontent-ai sample-app-vue
git clone https://github.com/kontent-ai/sample-app-vue
echo
echo
echo
echo mv sample-app-vue vue25150
mv sample-app-vue vue25150
cd vue25150
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
endTime=$(date +%s)
scriptDuration=$(($endTime-$startTime))
echo "======================================================================="
echo "====             vue 25150 took $scriptDuration seconds"
echo "======================================================================="
#echo "======================================================================="
#echo "====          npm create vue@latest - not done - 25170             ===="
#echo "======================================================================="
#cd ~
#echo mkdir vue25170
#cd vue25170
#echo create-vue is based on vite
#echo npm create vue latest
#echo older vue cli was based on webpack
#echo not sure how to make this work when not interactive - is there a silent version 
# npm create vue@latest
echo "======================================================================="
echo "====             apt-get install zip 25180                         ===="
echo "======================================================================="
cd ~
sudo apt-get -qq install unzip -y
echo "======================================================================="
echo "====                     curl bun 25190                            ===="
echo "======================================================================="
cd ~
echo mkdir bun25190
mkdir bun25190
echo
echo
echo
echo cd bun25190
cd bun25190
echo
echo
echo
echo curl - f s S L https://bun.sh/install 
curl -fsSL https://bun.sh/install | bash
echo
echo
echo
echo source ~/.bashrc
source ~/.bashrc
echo
echo
echo
echo not sure why bun is not installed 
echo bun v
bun -v
echo bun version
bun --version
echo "======================================================================="
echo "====                 install bun complete 25190                    ===="
echo "======================================================================="
