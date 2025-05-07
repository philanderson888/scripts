echo script 63 to create docker image
echo
echo
echo
echo cd ~
cd ~
echo
echo
echo
echo mkdir script-63-docker
mkdir script-63-docker
echo
echo
echo
echo mv script-63-dockerfile script-63-docker
mv script-63-dockerfile script-63-docker
echo
echo
echo
echo cd script-63-docker
cd script-63-docker
echo
echo
echo
sudo apt-get -qq install nodejs -y
sudo apt-get -qq install npm -y
echo node version
node --version
echo 
echo
echo
wget https://github.com/philanderson888/nodejs/blob/master/single-files/node_01_http_server.js script-63-node-server.js
echo
echo npm install
npm install
echo
echo
echo
echo cd ~/script-63-docker
cd ~/script-63-docker
echo
echo
echo
echo now prepare dockerfile
echo
echo
echo
echo mv script-63-dockerfile Dockerfile
mv script-63-dockerfile Dockerfile
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
echo docker build . -t phil3:phil3
docker build . --tag phil3:phil3
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
docker run -d -p 8080:8080 phil3:phil3
echo 
echo
echo
echo docker run phil3:phil3
docker run phil3:phil3 whoami
docker run phil3:phil3 pwd
