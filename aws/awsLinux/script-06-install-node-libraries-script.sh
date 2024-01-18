echo ===================================================
echo ============ script 06 node web server ============
echo ===================================================
echo
echo
echo what is my path
pwd 
echo what files are present
ls 

echo lets go for nodejs with basic to start




echo ===================================================================
echo ================= install npm latest libraries ====================
echo ===================================================================



npm install -g npm@latest


echo ===================================================================
echo ================= install node version manager ====================
echo ===================================================================

echo first install nvm node version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh -s | bash

# set the terminal so that npm is valid
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Activate nvm by typing the following at the command line.
echo activating nvm node version manager
. ~/.nvm/nvm.sh




echo ===================================================================
echo =================        install node          ====================
echo ===================================================================
echo installing nodejs long term support version
nvm install --lts

# check installation
echo checking node is installed 
node -v 
npm -v
nvm -v
node -e "console.log('Running Node.js ' + process.version)"

echo node is now correctly installed






echo ===================================================================
echo =================        install bun           ====================
echo ===================================================================

curl -fsSL https://bun.sh/install | bash





echo ===================================================================
echo =================        install git           ====================
echo ===================================================================
sudo dnf install git -y
git --version





echo =========================================================================
echo =========================   install vue   ===============================
echo =========================================================================


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






echo
echo
echo
echo
echo
echo
endTime=$(date +%s)
scriptDuration=$(($endTime-$startTime))
echo installing vue took $scriptDuration seconds

echo ==================================================================================
echo ====================  install libraries complete   ===============================
echo ==================================================================================
