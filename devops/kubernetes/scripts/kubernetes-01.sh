echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
echo "==================================="
echo "==================================="
echo "====           Docker          ===="
echo "==================================="
echo
echo
echo "==================================="
echo "====         Containers        ===="
echo "==================================="
echo
echo
#echo docker list running containers 
#docker container ls -a --format '{{.Names}}'
#echo docker list all containers both running and stopped
#docker container ls -a --format '{{.Names}} {{.Status}}' | sort -k2
echo
echo
STATUSES=("running" "exited" "created" "restarting" "paused" "dead")
echo list of container statuses is 
printf '%s\n' "${STATUSES[@]}"
echo
echo
echo "Listing containers grouped by status:"
echo "--------------------------------------"
for STATUS in "${STATUSES[@]}"; do
  echo "\n=== Containers with status: $STATUS ===="
  docker ps -a --filter "status=$STATUS" --format '{{.Status}}\t\t{{.Names}}'
done
echo
echo
echo "\n\n\n\n\n"
echo "==================================="
echo "==================================="
echo "====         Kubernetes        ===="
echo "==================================="
echo "==================================="
echo 
echo 
echo "==================================="
echo "====            Pods           ===="
echo "==================================="
echo
echo
echo pods container one or more docker running containers and shared storage and networking and a specification for how to run the containers
echo if the node of the pod is not specified, it will be scheduled on any available node
echo if the node of the pod is specified, it will be scheduled on that node
echo if the node of the pod dies, then the pod will be rescheduled on another node
echo a pod is either standalone or managed by a controller as part of a deployment
echo we can use the --show-labels option to see the labels of the pods
echo you doht manage pods directly, instead you manage deployments which manage pods
echo 
kubectl get pods -o wide
echo
echo
echo get pod names
echo
kubectl get pods -o name
echo
echo
# echo we can also feed the names dynamically using the -o name option and describe each one in turn
# echo describe all pods
# kubectl get pods -o name | xargs kubectl describe
kubectl get pods -o name | xargs -I {} echo "pod {}"
echo
echo
kubectl get pods --no-headers -o custom-columns="NAME:.metadata.name,STATUS:.status.phase" | while read name status; do
  echo "pod $name is $status"
done

echo
echo
echo rather than print all the output we can just target one field such as the "Controlled By" field
echo "get pods controlled by field"
kubectl get pods -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.metadata.ownerReferences[0].name}{"\n"}{end}'
echo
echo
echo can delete manually eg "kubectl delete -n default pod my-nginx --ignore-not-found"
echo
echo
echo list all pods in all namespaces where the Controlled By field is empty
kubectl get pods --all-namespaces -o json | jq -r '.items[] | select(.metadata.ownerReferences == null) | "\(.metadata.namespace) \(.metadata.name)"'
echo
echo
echo list all pods in current namespace where the Controlled By field is empty
kubectl get pods -o json | jq -r '.items[] | select(.metadata.ownerReferences == null) | .metadata.name'
echo 
echo
echo delete all pods in current namespace where the Controlled By field is empty
kubectl get pods -o json | jq -r '.items[] | select(.metadata.ownerReferences == null) | .metadata.name' | xargs kubectl delete pod
echo
echo
echo "get pods again"
kubectl get pods -o wide
echo
echo
echo run a pod with busybox image
kubectl run my-pod --image=busybox --restart=Never --command -- sleep 3600
echo
echo
echo run a pod using nginx on port 80
kubectl run my-nginx --image=nginx --port=80 --restart=Never
echo
echo
echo run an nginx pod with the latest image and expose port 80
echo note that the --restart=Never option is used to create a standalone pod
kubectl run nginx-pod --image=nginx:latest --restart=Never
echo
echo
sleep 5
echo we can add port forwarding using the --port option ... then if we view on port 8080 we can see the nginx welcome page
kubectl port-forward pod/nginx-pod 8080:80
echo
echo
echo get pods with wide output
kubectl get pods -o wide
echo
echo
echo "==================================="
echo "====     Single-Pod Service    ===="
echo "==================================="
echo
echo
echo create a single-pod service using the nginx pod
kubectl run nginx-pod-2 --image=nginx:latest --restart=Never
kubectl expose pod nginx-pod-2 --type=NodePort --name=nginx-service-2 --port=80 --target-port=80
echo forward pod port to local machine port 
echo "kubectl port-forward pod/nginx-pod-2 8081:80 then test with curl http://localhost:8081 on another terminal"
echo also test the service on another terminal using ... kubectl get services or kubectl get service nginx-service-2
kubectl port-forward pod/nginx-pod 8081:80
echo

read -p "Press enter to continue"
echo clean up by deleting the nginx pod and service
kubectl delete pod nginx-pod
kubectl delete service nginx-pod

echo
echo


echo
echo
read -p "Press enter to continue"
echo
echo
echo "==================================="
echo "====           Clusters        ===="
echo "==================================="
echo
echo
echo "set-cluster creates a cluster entry in kubeconfig"
echo "set-credentials creates a user entry in kubeconfig"
echo
echo
kubectl config set-cluster my-cluster --server=https://my-kubernetes-api-server:6443
kubectl config set-credentials my-user --token=my-token
echo
echo









echo "==================================="
echo "====         Deployments       ===="
echo "==================================="
kubectl get deployments
echo
echo
echo remove deployment if it exists
kubectl delete deployment my-deployment --ignore-not-found
sleep 4
echo 
echo 
echo check if deployment is removed
echo "==================================="
echo "====         Deployments       ===="
echo "==================================="
kubectl get deployments
echo "==================================="
echo "====            Pods           ===="
echo "==================================="
kubectl get pods -o wide
read -p "Press enter to continue"
echo
echo
echo you cant always kill a pod because the cluster wil recreate a new one 
echo solution is to scale the deployment to 0 replicas
echo
echo
kubectl scale --replicas=0 deployment/your-deployment

echo "==================================="
echo "====           Kill All        ===="
echo "==================================="
echo 
echo docker system prune all 
docker system prune --all --volumes --force
echo
echo
echo "==================================="
echo "====           Run A Pod       ===="
echo "==================================="
kubectl run temp-pod --image=busybox -it -- /bin/sh && echo "pod created and shell opened - type exit to close the shell"
echo 
echo 
echo "==================================="
echo "====           Kill All        ===="
echo "==================================="
echo 
echo docker system prune all 
docker system prune --all --volumes --force
echo
echo "==================================="
echo "====         deployment        ===="
echo "==================================="
echo 
echo 
echo create a deployment with 3 replicas
kubectl apply -f ./deployment-01-nginx-port-80.yaml






echo "==================================="
echo "====          Deployment       ===="
echo "==================================="
echo 
echo 
echo get deployments before creating a new one
kubectl get deployments
echo
echo
echo deployment is used to manage pods and ensure failover so that correct number of pods are always running
echo "create a deployment with 3 replicas"
kubectl create deployment my-deployment --image=nginx --replicas=3
echo
echo 
echo "get deployments"
kubectl get deployments













echo
echo
read -p "Press any key to continue"
echo "==================================="
echo "====           Contexts        ===="
echo "==================================="
echo
echo
echo note that the term 'context' is only valid on the client and does not exist in kubernetes itself
echo once we configure a context, we can use it to switch between different clusters and users
echo 
echo 
echo "get contexts"
kubectl config get-contexts
echo
echo
echo "create a new context using set-context which creates a context entry in kubeconfig"
echo
kubectl config set-context my-context --cluster=my-cluster --user=my-user
kubectl config set-context my-context --cluster my-cluster --user my-user --namespace my-namespace
echo 
echo 

echo
echo "Switching to the new context..."
kubectl config use-context my-context
echo 
echo 
echo "get contexts"
kubectl config get-contexts
echo 
echo
echo "get named context:"
kubectl config get-contexts my-context
echo
echo
echo "Verifying the current context..."
kubectl config current-context
echo
echo  
echo "Current context after switch:"
kubectl config current-context
echo
echo 
echo "view current context details using kubectl config view:"
kubectl config view --minify
echo
echo
echo switch back to the default context:
kubectl config use-context docker-desktop
echo
echo
echo delete my-context
kubectl config delete-context my-context
echo 
echo 
echo check if context is removed
kubectl config get-contexts
echo 
echo 
read -p "Press enter to continue"



echo "==================================="
echo "====         Namespaces        ===="
echo "==================================="

echo 
echo 
echo namespaces allow you to split your large cluster into smaller virtual clusters
echo ... so in theory one can have two different projects in the same cluster 
echo "create a namespace"
kubectl create namespace my-namespace



echo "==================================="
echo "====       Injecting Data      ===="
echo "==================================="
echo 
echo 
echo to inject data into a pod, you can use configmaps or secrets
echo "create a configmap"
kubectl create configmap my-config --from-literal=key1=value1 --from-literal=key2=value2
echo
echo "create a secret"
kubectl create secret generic my-secret --from-literal=secret1=value1 --from-literal=secret2=value2
echo
echo 
echo "==================================="
echo "====            Storage        ===="
echo "==================================="
echo 
echo 
echo shared storage between pods is provided by persistent volumes
echo 
echo 
echo "==================================="
echo "====            Service        ===="
echo "==================================="
echo 
echo
echo services manage internal ip addresses and ports and networking between pods
echo "create a service"
kubectl expose deployment my-deployment --type=NodePort --name=my-service --port=80 --target-port=80
echo 
echo kubectl get services
kubectl get services
echo 
echo 
echo kubectl get service my-service
kubectl get service my-service
echo 
echo 
kubectl get service mongodb -o yaml
echo
echo 
echo "==================================="
echo "====            Ingress        ===="
echo "==================================="
echo 
echo 
echo ingress creates external api eg / to the web site and /api to the back end 
echo ingress normally deals with ports 80 and 443 only unlike services which can deal with any port
echo ingress is used to manage external access to the services in the cluster
echo ingress is not a service, it is a resource that manages external access to the services in the cluster
echo you require a cluster ingress controller plus an ingress resource to manage external access to the services in the cluster
echo 
echo "create an ingress"
kubectl create ingress my-ingress --rule="host.com=/my-service,host.com/api=/my-api-service"
echo
echo "get ingress"
kubectl get ingress
echo
echo "get ingress my-ingress"
kubectl get ingress my-ingress -o yaml
echo
echo 
echo "==================================="
echo "====            Egress         ===="
echo "==================================="
echo 
echo 
echo egress is used to control outbound traffic from pods
echo "create an egress"
kubectl create egress my-egress -to="example.com"
echo
echo "get egress"
kubectl get egress
echo
echo "get egress my-egress"
kubectl get egress my-egress -o yaml
echo
echo
echo "==================================="
echo "====     Network Load Balancer ===="
echo "==================================="
echo
echo
echo "create a network load balancer"
kubectl create service loadbalancer my-loadbalancer --tcp=80:80 --external-ip=1.2.3.4
echo
echo

