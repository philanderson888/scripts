#!/bin/bash

echo clean up existing containers

echo docker stop my-ubuntu
docker stop my-ubuntu
echo docker rm my-ubuntu
docker rm my-ubuntu

# docker run -i -t ubuntu /bin/bash
# The above command runs an interactive terminal session in a new Ubuntu container.

echo the command "docker run -i -t ubuntu /bin/bash" can be replaced by the following separate commands:
echo docker pull ubuntu
docker pull ubuntu
docker container create --name my-ubuntu ubuntu sleep infinity
docker start my-ubuntu
docker exec -it my-ubuntu /bin/bash
