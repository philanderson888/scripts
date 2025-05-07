#!/bin/zsh
zsh
echo cd ~
cd ~
install_single_instance_of_node=true
if [ "$install_single_instance_of_node" = true ] ; then
    echo get node binaries via curl command then install node
    curl --silent -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash > /dev/null
    echo "note - E means 'preserve environment'"
    echo "note - sudo - E will download the file then execute it with sudo commands"
    echo "install node 025-011"
    echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
    sudo chmod 777 /var/cache/debconf/ 
    sudo chmod 777 /var/cache/debconf/passwords.dat
    sudo apt-get install -y -q > /dev/null
    sudo apt-get install dialog -y -q > /dev/null
    sudo apt-get install apt-utils -y -q > /dev/null
    sudo apt-get -qq install nodejs -y > /dev/null
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
    nvm list-remote > /dev/null
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
echo "====                          gnupg                            ===="
echo "==================================================================="
echo gnupg version
gpg --version
echo "==================================================================="
echo "====                          curl                             ===="
echo "==================================================================="
echo curl version
curl --version
echo
echo node version
node --version
echo
echo npm version
npm --version
echo
echo
echo
echo "adding bash commands to zsh"
cat ~/.bashrc >> ~/.zshrc
echo "====================================================================="
echo "====                  node run js command                        ===="
echo "====================================================================="
node -e "console.log('this is node js javascript');"
node -e "console.log('node version ' + process.version);"
echo "======================================================================="
echo "====                  install node complete                        ===="
echo "======================================================================="
echo
echo
echo
echo "============================================================"
echo "====          install corepack and yarn                 ===="
echo "============================================================"
echo npm install yarn
sudo npm install --global yarn -y > /dev/null
echo
echo corepack enable
sudo corepack enable > /dev/null
echo
echo yarn set version stable
yarn set version stable -y
echo
echo yarn install
yarn install > /dev/null
echo
echo
echo
echo yarn version
yarn -v
echo
echo
echo
cd ~
echo "======================================================================="
echo "====             apt-get install zip 25180                         ===="
echo "======================================================================="
sudo apt-get -qq install unzip -y > /dev/null
echo "======================================================================="
echo "====                       install jq 025-230                      ===="
echo "====                   move this to dedicated file                 ===="
echo "====                   move this to dedicated file                 ===="
echo "====                   move this to dedicated file                 ===="
echo "====                   move this to dedicated file                 ===="
echo "====                   move this to dedicated file                 ===="
echo "======================================================================="
sudo apt-get -qq install jq -y > /dev/null
