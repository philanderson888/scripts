#!/bin/bash

# Build Docker images
docker build -t input-server:latest -f Dockerfile.input .
docker build -t output-server:latest -f Dockerfile.output .

# Load images into Minikube
minikube image load input-server:latest
minikube image load output-server:latest

# Remove existing deployments and services
kubectl delete deployment input-server output-server
kubectl delete service input-server-service output-server-service

# Apply Kubernetes configurations
kubectl apply -f k8s/input-deployment.yaml
kubectl apply -f k8s/input-service.yaml
kubectl apply -f k8s/output-deployment.yaml
kubectl apply -f k8s/output-service.yaml

# Wait for deployments
kubectl rollout status deployment/input-server
kubectl rollout status deployment/output-server

# Forward ports to access locally
kubectl port-forward service/input-server-service 3000:3000 &
kubectl port-forward service/output-server-service 3001:3001