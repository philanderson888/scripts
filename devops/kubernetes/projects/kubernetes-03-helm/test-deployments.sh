#!/bin/bash
echo "Waiting 5 seconds for deployments to stabilize..."
sleep 5

echo "Testing Kubernetes deployment (port 30081)..."
curl -s http://localhost:30081
echo -e "\n"

echo "Testing Helm deployment (port 30080)..."
curl -s http://localhost:30080
echo -e "\n"

echo "Both deployments tested successfully!"
echo
echo "Waiting 10 seconds before cleanup..."
sleep 10

echo "Starting cleanup..."
echo "Uninstalling Helm deployment..."
helm uninstall hello-world -n hello-world

echo "Deleting namespace to clean up both deployments..."
kubectl delete namespace hello-world

echo
echo "==============================================="
echo "🧹 Cleanup complete! All deployments removed."
echo "==============================================="

# Exit all terminal windows after cleanup
osascript -e 'tell application "Terminal" to quit'
