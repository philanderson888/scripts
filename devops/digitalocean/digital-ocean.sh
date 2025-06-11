#!/bin/bash

clear 

echo "delete all droplets using doctl compute droplet delete --force"
doctl compute droplet delete --force $(doctl compute droplet list --format ID --no-header) || echo "No droplets to delete"
echo
echo
echo "delete all kubernetes clusters using doctl kubernetes cluster delete --force"
doctl kubernetes cluster delete --force --dangerous $(doctl kubernetes cluster list --format ID --no-header) || echo "No Kubernetes clusters to delete"
echo
kubectl delete namespace hello-world --ignore-not-found
echo
kubectl config get-contexts  
# exit 0

echo "============================================================"
echo "============================================================"
echo "====                 Digital Ocean                      ===="
echo "============================================================"
echo "============================================================"
echo 
echo 

if ! command -v doctl &> /dev/null; then
    echo install digital ocean cli using brew install docttl
    brew install doctl
else
    echo doctl is already installed.
fi
echo 
echo 
echo authenticate with a token 
doctl auth init --context digitalocean
echo
echo list authenticated accounts using doctl auth list
doctl auth list
echo
echo
echo switch to the digitalocean context using doctl auth switch
doctl auth switch --context digitalocean
echo 
echo
echo validate authentication using doctl account get
doctl account get
echo 
echo 
echo get a list of regions using doctl compute region list ... but can we truncate it to only the first 3 items?
doctl compute region list --format Name,Slug,Available --no-header | head -n 3
echo
echo
echo get a list of images using doctl compute image list-distribution ... but can we truncate it to only the first 3 items?
doctl compute image list-distribution --format Name,Slug,Distribution,Public --no-header | head -n 3
echo
echo
echo get a list of sizes using doctl compute size list ... but can we truncate it to only the first 3 items?
doctl compute size list --format Name,Slug,Vcpus,Memory,Disk,PriceMonthly --no-header | head -n 3
echo 
echo
echo "get droplet count using doctl compute droplet list --format Name,ID,PublicIPv4,Status --no-header | wc -l"
doctl compute droplet list --format Name,ID,PublicIPv4,Status --no-header | wc -l
echo
echo
doctl compute droplet list --format Name,ID,PublicIPv4,Status --no-header | wc -l | grep -q '^0$'
if [ $? -eq 0 ]; then
    echo "No droplets found. Creating a new droplet..."
    echo create a droplet using doctl compute droplet create
    doctl compute droplet create --region sfo2 --image ubuntu-24-04-x64 --size s-1vcpu-1gb test-droplet --wait
    echo 
    echo 
else
    echo "Droplets already exist. Skipping droplet creation."
fi

echo 
echo 
echo
echo "Checking Kubernetes connection..."
if ! kubectl cluster-info &> /dev/null; then
    echo "Cannot connect to Kubernetes. Please ensure the cluster is running."
    exit 1
fi
echo "✓ Kubernetes is running"
echo
echo 
echo "Creating namespace 'hello-world'..."
kubectl create namespace hello-world 2>/dev/null || echo "Namespace hello-world already exists"
echo
echo
echo "get cluster count using doctl kubernetes cluster list --format Name,ID,Region,Version,Status --no-header | wc -l"
doctl kubernetes cluster list --format Name,ID,Region,Version,Status --no-header | wc -l

echo 
echo if cluster count is 0 then create a new Kubernetes cluster using doctl kubernetes cluster create
cluster_count=$(doctl kubernetes cluster list --format Name,ID,Region,Version,Status --no-header | wc -l)
echo "Cluster count: $cluster_count"
echo
if [ $? -eq 0 ]; then
    echo "No Kubernetes clusters found. Creating a new cluster..."
    echo echo create a new Kubernetes cluster using doctl kubernetes cluster create

    doctl kubernetes cluster create example-cluster --region nyc1 --maintenance-window saturday=02:00 --node-pool "name=example-pool;size=s-2vcpu-2gb;count=5;tag=web;tag=frontend;label=key1=value1;label=key2=label2;taint=key1=value1:NoSchedule;taint=key2:NoExecute" --wait

    doctl kubernetes cluster create example-cluster --region nyc1 --size s-2vcpu-4gb --maintenance-window saturday=02:00  --count 1 --wait
    

    echo
    echo 

else
    echo "Kubernetes clusters already exist. Skipping cluster creation."
    exit 0
fi

echo 
echo
echo list kubernetes contexts using kubectl config get-contexts
kubectl config get-contexts
echo
echo
echo "Setting Kubernetes context to the newly created cluster..."
# Uncomment the next line if you want to set a specific context
# echo "Switching to the context of the newly created cluster..."
#echo kubectl config use-context do-nyc3-hello-world-cluster
#kubectl config use-context do-nyc3-hello-world-cluster

#echo "Applying Kubernetes manifests..."
#kubectl apply -f kubernetes/configmap.yaml -n hello-world
echo 
echo 
echo interrogating the cluster using kubectl get nodes
kubectl get nodes
echo
echo 
echo interrogating the cluster using kubectl get pods -n hello-world
kubectl get pods -n hello-world
echo
echo
echo check any droplets using doctl compute droplet list
doctl compute droplet list
# doctl compute droplet list --context digitalocean
echo 
echo 
echo "Deployment Status:"
kubectl get pods,services -n hello-world
echo
echo
echo "Service Details:"
kubectl describe service hello-world -n hello-world
echo
echo
echo get id of droplet using doctl compute droplet list
doctl compute droplet list --format ID,Name,PublicIPv4,Status --no-header
echo
echo
echo get id alone of the droplet using doctl compute droplet list --format ID --no-header
doctl compute droplet list --format ID --no-header
echo
echo
echo "Cluster Info:"
kubectl cluster-info
echo
echo
echo list kubernetes clusters using doctl kubernetes cluster list
doctl kubernetes cluster list
echo 
echo 
sleep 60
echo "delete all droplets using doctl compute droplet delete --force"
doctl compute droplet delete --force $(doctl compute droplet list --format ID --no-header) || echo "No droplets to delete"
echo
echo
echo "delete all kubernetes clusters using doctl kubernetes cluster delete --force"
doctl kubernetes cluster delete --force --dangerous $(doctl kubernetes cluster list --format ID --no-header) || echo "No Kubernetes clusters to delete"
echo
