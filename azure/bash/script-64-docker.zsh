echo script 64 to create docker image
echo
echo
echo
echo cd ~/sample-apps/node/node-51279
cd ~/sample-apps/node/node-51279
echo
echo
echo
echo now prepare dockerfile
echo
echo
echo
echo export DOCKER_BUILDKIT=0
export DOCKER_BUILDKIT=0
echo
echo
echo
echo docker build . -t philanderson888:node-51279
docker build . --tag philanderson888:node-51279
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
docker run -d -p 51280:51280 philanderson888:node-51279
echo 
echo
echo
docker run philanderson888:node-51279 whoami
docker run philanderson888:node-51279 pwd
echo
echo
echo
echo docker running images with docker ps
docker ps
