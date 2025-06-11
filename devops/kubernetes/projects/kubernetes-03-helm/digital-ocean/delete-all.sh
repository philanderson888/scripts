echo
echo "Starting cleanup..."
echo "Uninstalling Helm release..."
helm uninstall hello-world -n hello-world

echo "Deleting namespace..."
kubectl delete namespace hello-world --force

echo "Deleting Kubernetes cluster..."
CLUSTER_CONFIG="./cluster-config.yaml"
CLUSTER_NAME=$(yq '.spec.cluster.name' $CLUSTER_CONFIG)
doctl kubernetes cluster delete $CLUSTER_NAME --force
