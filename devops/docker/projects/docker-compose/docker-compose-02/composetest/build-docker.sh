#!/bin/bash

# Stop and remove existing containers
docker rm -f flask-9001 redis-9001 2>/dev/null
docker network rm flask-net-9001 2>/dev/null

# Build the image
docker build --no-cache -t flask-app-9001 .

# Create custom network
docker network create flask-net-9001

# Run Redis
docker run -d \
  --name redis-9001 \
  --network flask-net-9001 \
  redis:alpine

docker run -d --name flask-9001 -p 9001:5000 flask-app-9001

echo curl localhost:9000
curl localhost:9000
echo curl localhost:9001
curl localhost:9001

#docker ps
#docker ps -a
docker logs flask-9001

