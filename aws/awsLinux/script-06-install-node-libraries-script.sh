echo ===================================================
echo ============ script 06 node web server ============
echo ===================================================
echo
echo
echo ... 6.1 ... what is my path
pwd 
echo ... 6.2 ... what files are present
ls 
echo "======================================================================="
echo ================= 6.3 install npm latest libraries ====================
echo "======================================================================="
npm install -g npm@latest
echo
echo
echo
echo "======================================================================="
echo =================    install nvm node version manager ====================
echo "======================================================================="
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh -s | bash
echo
echo
echo
echo ... 6.5 ... now configure node version manager ... 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
echo ... 6.5 ... configuring node version manager complete ...
echo ... 6.6 ... activate node version manager
. ~/.nvm/nvm.sh
echo ... 6.6 ... node version manager has been activated ... 
echo
echo
echo
echo "======================================================================="
echo "====                      install node LTS                         ===="
echo "======================================================================="
echo nvm install lts
nvm install --lts
echo
echo
echo
echo node npm nvm versions
node -v 
npm -v
nvm -v
echo ... 6.8 ... node version check complete ...
echo
echo
echo
echo "======================================================================="
echo "====                   test node command 06-049                    ===="
echo "======================================================================="
echo node - e console.log process version
node -e "console.log('Running Node.js ' + process.version)"
echo "======================================================================="
echo "====                     install bun-06-063                        ===="
echo "======================================================================="
echo curl - f s S L https://bun.sh/install 
curl -fsSL https://bun.sh/install | bash
echo "======================================================================="
echo "====                       install git-06-71                       ===="
echo "======================================================================="
echo sudo dnf install git - y
sudo dnf install git -y
echo
echo
echo
echo git version
git --version
echo "======================================================================="
echo "====                  install vue 006-072                          ===="
echo "======================================================================="
startTime="$(date +%s)"
echo cd ~
cd ~
echo
echo
echo
echo git clone github kontent-ai sample-app-vue
git clone https://github.com/kontent-ai/sample-app-vue
echo
echo
echo
echo mv sample-app-vue vue06093
mv sample-app-vue vue06093
echo
echo
echo
echo cd vue06093
cd vue06093
echo
echo
echo
echo "======================================================================="
echo "====                install vue libraries vue-06104                ===="
echo "======================================================================="
echo sudo npm install - g create-vue
sudo npm install -g create-vue
echo
echo
echo
echo npm install create-vue
npm install create-vue
echo
echo
echo
echo "======================================================================="
echo "====                     npm install vue-06117                     ===="
echo "======================================================================="
echo npm install
npm install
endTime=$(date +%s)
scriptDuration=$(($endTime-$startTime))
echo vue-06-123 install took $scriptDuration seconds
echo
echo
echo
echo "======================================================================="
echo "====               install vue-06-128 complete                     ===="
echo "======================================================================="
