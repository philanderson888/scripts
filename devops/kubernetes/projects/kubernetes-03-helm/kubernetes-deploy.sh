#!/bin/bash

# Exit on error
set -e

echo "=== Kubernetes Hello World Setup ==="
echo

# Check prerequisites
if ! command -v kubectl &> /dev/null; then
    echo "kubectl not found. Please ensure Docker Desktop with Kubernetes is enabled."
    exit 1
fi

echo "✓ kubectl is installed"

# Check Kubernetes connection
echo "Checking Kubernetes connection..."
if ! kubectl cluster-info &> /dev/null; then
    echo "Cannot connect to Kubernetes. Please ensure Kubernetes is enabled in Docker Desktop."
    exit 1
fi

echo "✓ Kubernetes is running"
echo

# Create namespace
echo "Creating namespace 'hello-world'..."
kubectl create namespace hello-world 2>/dev/null || echo "Namespace hello-world already exists"
echo

# Apply Kubernetes manifests
echo "Applying Kubernetes manifests..."
kubectl apply -f kubernetes/configmap.yaml -n hello-world
kubectl apply -f kubernetes/deployment.yaml -n hello-world
kubectl apply -f kubernetes/service.yaml -n hello-world

# Wait for deployment
echo
echo "Waiting for deployment to be ready..."
kubectl wait --for=condition=available --timeout=60s deployment/hello-world -n hello-world

echo
echo "Deployment Status:"
kubectl get pods,services -n hello-world

echo
echo "Service Details:"
kubectl describe service hello-world -n hello-world

echo
echo "Cluster Info:"
kubectl cluster-info

echo
echo "Setting up port forwarding..."
echo "Press Ctrl+C to stop the port forwarding when done"

echo
echo "==============================================="
echo "🎉 Success! Your Hello World app is deployed!"
echo "==============================================="
echo
echo "Access your application at: http://localhost:30081"
echo "Or use: curl http://localhost:30081"
echo
echo "To delete the application:"
echo "  kubectl delete namespace hello-world"

# Start port forwarding
kubectl port-forward service/hello-world 30081:80 -n hello-world
