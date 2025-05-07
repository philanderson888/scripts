echo script 62 to create docker image
echo
echo
echo
echo cd ~
cd ~
echo ls - were the package.json, package-lock.json and yarn.lock files created before this point? not sure ...
ls 
echo removing the files if they exist
#rm package.json
#rm package-lock.json
#rm yarn.lock
echo ... keep moving this back until we get to the source of the error ...
echo
echo
echo
echo mkdir script-62-docker
mkdir script-62-docker
echo
echo
echo
echo mv script-62-dockerfile script-62-docker
mv script-62-dockerfile script-62-docker
echo
echo
echo
echo cd script-62-docker
cd script-62-docker
echo
echo
echo
sudo apt-get -qq install -y 
sudo apt-get -qq install dialog -y
sudo apt-get -qq install apt-utils -y
sudo apt-get -qq install nodejs -y
sudo apt-get -qq install npm -y
echo node version
node --version
echo npm version
npm --version
echo installing npx
npm install -g npx 
echo
echo
echo
echo npx express-generator myExpressApp --view ejs
npx express-generator myExpressApp --view ejs -y
echo
echo
echo
echo change directory
echo cd myExpressApp
cd myExpressApp
echo
echo
echo
echo npm install
npm install
echo
echo
echo
echo cd ~/script-62-docker
cd ~/script-62-docker
echo
echo
echo
echo now prepare dockerfile
echo
echo
echo
echo mv script-62-dockerfile Dockerfile
mv script-62-dockerfile Dockerfile
echo
echo
echo
echo export DOCKER_BUILDKIT=0
export DOCKER_BUILDKIT=0
echo
echo
echo
echo now build docker image
echo
echo
echo
echo docker build . -t phil2:phil2
docker build . --tag phil2:phil2
echo 
echo 
echo 
sleep 1
echo docker images
docker images
echo
echo
echo
sleep 1
echo run docker image
docker run -d -p 8081:8081 phil2:phil2
echo 
echo
echo
echo docker run phil2:phil2
docker run phil2:phil2 whoami
docker run phil2:phil2 pwd
