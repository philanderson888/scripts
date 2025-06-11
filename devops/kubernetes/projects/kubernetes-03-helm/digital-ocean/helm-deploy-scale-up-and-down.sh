#!/bin/bash

# Exit on error
set -e

echo
echo scale the replica count up to 3
echo
helm upgrade hello-world ../hello-world-chart --namespace hello-world --set replicaCount=3
echo
echo
echo get the replica count after scaling the replicas up to 3
kubectl describe deployment hello-world -n hello-world
echo
echo
echo get nodes
echo
kubectl get nodes
echo
echo 
echo get pods
kubectl get pods -n hello-world
echo
echo
echo for super detailed view we describe nodes
#kubectl describe nodes
echo
echo 

exit 0


echo "Starting cleanup..."
echo "Uninstalling Helm release..."
helm uninstall hello-world -n hello-world

echo "Deleting namespace..."
kubectl delete namespace hello-world --force

echo "Deleting Kubernetes cluster..."
CLUSTER_NAME=$(yq '.spec.cluster.name' $CLUSTER_CONFIG)
doctl kubernetes cluster delete $CLUSTER_NAME --force

exit 0

echo "=== DigitalOcean Kubernetes with Helm Deployment ==="
echo

# Load configuration
CLUSTER_CONFIG="./cluster-config.yaml"
CLUSTER_NAME=$(yq '.spec.cluster.name' $CLUSTER_CONFIG)
REGION=$(yq '.spec.cluster.region' $CLUSTER_CONFIG)
NODE_SIZE=$(yq '.spec.cluster.size' $CLUSTER_CONFIG)
NODE_COUNT=$(yq '.spec.cluster.count' $CLUSTER_CONFIG)

# Check if cluster exists
echo "Checking if cluster '$CLUSTER_NAME' exists..."
EXISTING_CLUSTER=$(doctl kubernetes cluster list --format Name --no-header | grep "^$CLUSTER_NAME$" || true)

if [ -n "$EXISTING_CLUSTER" ]; then
    echo "✓ Cluster '$CLUSTER_NAME' already exists"
    echo "Scaling cluster to $NODE_COUNT nodes..."
    doctl kubernetes cluster node-pool update $CLUSTER_NAME $CLUSTER_NAME-default-pool --count $NODE_COUNT
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

# Deploy using Helm
echo "Deploying application using Helm..."
helm upgrade --install hello-world ../hello-world-chart \
  --namespace hello-world \
  --set service.type=LoadBalancer \
  --set service.nodePort=null

# Wait for deployment
echo
echo "Waiting for deployment to be ready..."
kubectl wait --for=condition=available --timeout=60s deployment/hello-world-hello-world-chart -n hello-world

# Get LoadBalancer IP
echo
echo "Waiting for LoadBalancer IP (this may take a few minutes)..."
while true; do
    IP=$(kubectl get service hello-world-hello-world-chart -n hello-world -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
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

# Auto-scaling sequence
echo "Starting auto-scaling sequence..."

echo "Current node count: 3"
echo "Waiting 90 seconds before scaling to 2 nodes..."
sleep 90

echo "Scaling to 2 nodes..."
doctl kubernetes cluster node-pool update $CLUSTER_NAME $CLUSTER_NAME-default-pool --count 2
echo "Current node count: 2"
echo "Waiting 90 seconds before scaling to 1 node..."
sleep 90

echo "Scaling to 1 node..."
doctl kubernetes cluster node-pool update $CLUSTER_NAME $CLUSTER_NAME-default-pool --count 1
echo "Current node count: 1"



# scale replicas using kubernetes
# kubectl scale deployment hello-world hello-world-chart --replicas=3 -n hello-world

echo
echo scale the replica count up to 3
echo
helm upgrade hello-world ../hello-world-chart --namespace hello-world --set replicaCount=3
echo
echo
echo get the replica count after scaling the replicas up to 3
kubectl describe deployment hello-world -n hello-world
echo
echo

echo "Waiting 90 seconds before cleanup..."
sleep 90

echo
echo "Starting cleanup..."
echo "Uninstalling Helm release..."
helm uninstall hello-world -n hello-world

echo "Deleting namespace..."
kubectl delete namespace hello-world --force

echo "Deleting Kubernetes cluster..."
doctl kubernetes cluster delete $CLUSTER_NAME --force

echo
echo "==============================================="
echo "🧹 Cleanup complete! All resources removed."
echo "==============================================="