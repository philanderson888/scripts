#!/bin/bash

# Exit on error
set -e

echo "=== Helm Hello World Setup ==="
echo

echo "Checking if Docker Desktop with Kubernetes is installed..."
echo

if ! command -v kubectl &> /dev/null; then
    echo "kubectl not found. Please ensure Docker Desktop with Kubernetes is enabled."
    exit 1
fi

echo "✓ kubectl is installed"

echo
echo "Checking if Helm is installed..."
echo

if ! command -v helm &> /dev/null; then
    echo "helm not found. Please install Helm using: brew install helm"
    brew install helm
    if ! command -v helm &> /dev/null; then
        echo "Failed to install Helm. Please install it manually."
        exit 1
    fi
fi

echo "Checking Kubernetes connection..."
if ! kubectl cluster-info &> /dev/null; then
    echo "Cannot connect to Kubernetes. Please ensure Kubernetes is enabled in Docker Desktop."
    exit 1
fi

echo
echo "✓ Kubernetes is running"
echo "✓ Helm is installed"
helm version
helm version --short
echo

echo "Checking Kubernetes context..."
current_context=$(kubectl config current-context)
if [ -z "$current_context" ]; then
    echo "No Kubernetes context is set. Please set a context using: kubectl config use-context <context-name>"
    exit 1
fi

echo
echo "Creating namespace 'hello-world'..."
kubectl create namespace hello-world 2>/dev/null || echo "Namespace hello-world already exists"
echo

echo "Installing Helm chart..."
helm upgrade --install hello-world ./hello-world-chart --namespace hello-world

echo
echo "Waiting for deployment to be ready..."
kubectl wait --for=condition=available --timeout=60s deployment/hello-world-hello-world-chart -n hello-world

echo
echo "Service Details:"
kubectl describe service hello-world-hello-world-chart -n hello-world

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
echo "Access your application at: http://localhost:30080"
echo "Or use: curl http://localhost:30080"
echo
echo "To delete the application:"
echo "  helm uninstall hello-world -n hello-world"
echo "  kubectl delete namespace hello-world"

# Start port forwarding
kubectl port-forward service/hello-world-hello-world-chart 30080:80 -n hello-world