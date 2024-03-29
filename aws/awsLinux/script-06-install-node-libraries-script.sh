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
echo =================              install node LTS          ====================
echo "======================================================================="
nvm install --lts
echo ... 6.7 ... node has been installed ... 
echo ... 6.8 ... checking node npm and nvm installed versions
node -v 
npm -v
nvm -v
echo ... 6.8 ... node version check complete ...
echo
echo
echo
echo "======================================================================="
echo =================   6.9 ... run test nodejs command to check output ... ====================
echo "======================================================================="
node -e "console.log('Running Node.js ' + process.version)"
echo ... 6.9 ... node test command complete
echo
echo
echo
echo "======================================================================="
echo ============ script 06 node web server - installation of basic node libraries is now complete =================
echo "======================================================================="
echo
echo
echo
echo "======================================================================="
echo =================   6.10 ... install bun web server libraries ... ==============================
echo "======================================================================="
curl -fsSL https://bun.sh/install | bash
echo ... 6.10 ... bun web server libraries install complete
echo
echo
echo
echo "======================================================================="
echo =================    6.11 ...   install git           ====================
echo "======================================================================="
sudo dnf install git -y
git --version
echo ... 6.11 ... git install complete
echo
echo
echo
echo "======================================================================="
echo =========================  6.12 install vue   ===============================
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
echo
echo
echo "======================================================================="
echo ================  script 06 complete ...                             ============= 
echo ================  ... installed ... 1 node ... 2 bun ... 3 vue ...   ============= 
echo ================  ... libraries and web servers                      =============
echo "======================================================================="
