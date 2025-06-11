#!/bin/bash

# Exit on error
set -e

echo "=== DigitalOcean Kubernetes Deployment ==="
echo

# Configuration
CLUSTER_NAME="hello-world-cluster"
REGION="nyc1"
NODE_SIZE="s-2vcpu-2gb"
NODE_COUNT=2

# Check if cluster already exists
echo "Checking if cluster '$CLUSTER_NAME' already exists..."
EXISTING_CLUSTER=$(doctl kubernetes cluster list --format Name --no-header | grep "^$CLUSTER_NAME$" || true)

if [ -n "$EXISTING_CLUSTER" ]; then
    echo "✓ Cluster '$CLUSTER_NAME' already exists"
    echo "Retrieving kubeconfig..."
    doctl kubernetes cluster kubeconfig save $CLUSTER_NAME
else
    echo "Creating new Kubernetes cluster on DigitalOcean..."
    echo "This may take 5-10 minutes..."

    # Create the cluster
    doctl kubernetes cluster create $CLUSTER_NAME \
      --region $REGION \
      --size $NODE_SIZE \
      --count $NODE_COUNT \
      --wait

    echo "✓ Kubernetes cluster created"
fi

echo
echo "✓ kubectl configured"
echo

# Verify cluster connection
echo "Verifying cluster connection..."
kubectl cluster-info
echo

# Create namespace
echo "Creating namespace 'hello-world'..."
kubectl create namespace hello-world 2>/dev/null || echo "Namespace hello-world already exists"
echo

# Apply Kubernetes manifests
echo "Deploying application..."
kubectl apply -f kubernetes/configmap.yaml -n hello-world
kubectl apply -f kubernetes/deployment.yaml -n hello-world

# Create LoadBalancer service instead of NodePort
cat > kubernetes/do-service.yaml <<EOF
apiVersion: v1
kind: Service
metadata:
  name: hello-world
spec:
  type: LoadBalancer
  ports:
  - port: 80
    targetPort: 80
  selector:
    app: hello-world
EOF

kubectl apply -f kubernetes/do-service.yaml -n hello-world

# Wait for deployment
echo
echo "Waiting for deployment to be ready..."
kubectl wait --for=condition=available --timeout=60s deployment/hello-world -n hello-world

# Get LoadBalancer IP
echo
echo "Waiting for LoadBalancer IP (this may take a few minutes)..."
while true; do
    IP=$(kubectl get service hello-world -n hello-world -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
    if [ -n "$IP" ]; then
        break
    fi
    echo -n "."
    sleep 5
done

echo
echo "==============================================="
echo "🎉 Success! Your Hello World app is deployed!"
echo "==============================================="
echo
echo "Access your application at: http://$IP"
echo "Or use: curl http://$IP"
echo
echo "To delete the application and cluster:"
echo "  kubectl delete namespace hello-world"
echo "  doctl kubernetes cluster delete $CLUSTER_NAME"
echo
echo "To view cluster status:"
echo "  doctl kubernetes cluster list"
echo "  kubectl get nodes"
echo "  kubectl get pods -n hello-world"