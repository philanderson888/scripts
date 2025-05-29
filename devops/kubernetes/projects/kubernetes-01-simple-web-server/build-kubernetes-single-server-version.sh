#!/bin/bash

# This script builds a Docker image for a simple web server and deploys it to a Minikube cluster.

#
docker build -t web-server:latest .

# Load the image into Minikube:
minikube image load web-server:latest

# Delete the existing deployment and service:
kubectl delete deployment web-server
kubectl delete service web-server-service

# Apply the Kubernetes configuration files
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

# Wait for the deployment to be ready
kubectl rollout status deployment/web-server

# Port-forward the service to access it locally
kubectl port-forward service/web-server-service 3002:3002
