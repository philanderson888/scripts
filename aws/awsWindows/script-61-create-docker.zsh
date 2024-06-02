echo script 61 to create docker image
echo
echo
echo
echo cd ~
cd ~
echo
echo
echo
echo mkdir script-61-docker
mkdir script-61-docker
echo
echo
echo
echo mv script-61-dockerfile script-61-docker
mv script-61-dockerfile script-61-docker
echo
echo
echo
echo mv myExpressApp script-61-docker
mv myExpressApp script-61-docker
echo
echo
echo
echo cd script-61-docker
cd script-61-docker
echo
echo
echo
echo mv script-61-dockerfile Dockerfile
mv script-61-dockerfile Dockerfile
echo
echo
echo
echo export DOCKER_BUILDKIT=0
export DOCKER_BUILDKIT=0
echo
echo
echo
echo docker build . -t phil:phil
docker build . --tag phil:phil
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
docker run -d -p 8081:8081 phil:phil
echo 
echo
echo
echo docker run phil:phil
docker run phil:phil whoami
docker run phil:phil pwd
