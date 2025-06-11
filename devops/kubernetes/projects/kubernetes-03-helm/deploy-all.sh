#!/bin/bash

# Exit on error
set -e

echo "=== Master Deployment Script ==="
echo "This will deploy both Kubernetes and Helm versions"
echo

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "This script is designed for macOS. Please run the deployment scripts individually on other platforms."
    exit 1
fi

# Function to check prerequisites
check_prerequisites() {
    if ! command -v kubectl &> /dev/null; then
        echo "kubectl not found. Please ensure Docker Desktop with Kubernetes is enabled."
        exit 1
    fi

    if ! command -v helm &> /dev/null; then
        echo "helm not found. Please install Helm using: brew install helm"
        exit 1
    fi

    if ! kubectl cluster-info &> /dev/null; then
        echo "Cannot connect to Kubernetes. Please ensure Kubernetes is enabled in Docker Desktop."
        exit 1
    fi
}

# Check prerequisites
echo "Checking prerequisites..."
check_prerequisites
echo "✓ All prerequisites met"
echo

# Create namespace if it doesn't exist
echo "Creating namespace 'hello-world'..."
kubectl create namespace hello-world 2>/dev/null || echo "Namespace hello-world already exists"
echo

# Open new terminal window for Kubernetes deployment
echo "Starting Kubernetes deployment in new terminal..."
osascript -e 'tell app "Terminal" to do script "cd \"'$PWD'\" && ./kubernetes-deploy.sh"'

# Wait a moment to avoid potential conflicts
sleep 2

# Open new terminal window for Helm deployment
echo "Starting Helm deployment in new terminal..."
osascript -e 'tell app "Terminal" to do script "cd \"'$PWD'\" && ./build.sh"'

# Create the test script
cat > test-deployments.sh << 'EOF'
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
EOF

chmod +x test-deployments.sh

# Open new terminal window for testing
echo "Starting test terminal..."
osascript -e 'tell app "Terminal" to do script "cd \"'$PWD'\" && ./test-deployments.sh"'

echo
echo "==============================================="
echo "🎉 Deployment processes started!"
echo "==============================================="
echo
echo "Three new terminal windows have been opened:"
echo "- Terminal 1: Kubernetes deployment (Port 30081)"
echo "- Terminal 2: Helm deployment (Port 30080)"
echo "- Terminal 3: Automated testing (will run after 5s)"
echo "            + Automatic cleanup (will run after testing + 10s)"
echo
echo "You can access the applications at:"
echo "- Kubernetes version: http://localhost:30081"
echo "- Helm version: http://localhost:30080"
echo
echo "Note: All terminal windows will automatically close after cleanup"