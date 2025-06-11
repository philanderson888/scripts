echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
echo "==================================="
echo "==================================="
echo "====           Docker          ===="
echo "==================================="
echo "==================================="
echo
echo
echo "==================================="
echo "====             Pods          ===="
echo "==================================="
echo
echo
echo pods contain one or more containers
echo - plus shared storage
echo - plus networking
echo - plus run instructions
echo - if node is not specified, will run on any node
echo - if node dies, pod is rescheduled on another node
echo - pod is standalone or managed via deployment

echo
echo to delete a pod scale it down to zero or delete it outright if it is an unmanaged pod


echo "==================================="
echo "==================================="
echo "====         Kubernetes        ===="
echo "==================================="
echo "==================================="
echo 
echo 
echo
echo

echo "==================================="
echo "====           Contexts        ===="
echo "==================================="
echo
echo
echo context is only valid on the client
echo context switching between clusters, users and namespaces
echo 
echo 
echo "==================================="
echo "====         manifest          ===="
echo "==================================="
echo
echo kubernetes manifest is a yaml file that describes the desired state of a kubernetes resource
echo
echo for example
cat ./kubernetes-manifest.yaml
echo
echo we can create a cluster then apply this manifest to create a pod
echo
echo kind create cluster
kind create cluster --name kind2
echo
echo kubectl apply -f ./kubernetes-manifest.yaml
kubectl apply -f ./kubernetes-manifest.yaml --context kind2
echo
  
echo "==================================="
echo "====         deployment        ===="
echo "==================================="
echo 
echo 
echo deployment manages pods in a cluster
echo eg minimum and maximum numbers of pods running
echo also can delete pods
echo also can update pods
echo also manages graceful transition from actual to desired state
echo
echo
echo



echo "==================================="
echo "====         Namespaces        ===="
echo "==================================="

echo 
echo 
echo namespaces is a subdivision of a cluster
echo namespaces allow managing groups of resources separately within one cluster
echo 
echo 

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
echo
echo typically a deployment manages pods and their lifetimes 
echo and a service manages the networking between those pods
echo 
echo service types include:
echo - ClusterIP default - internal access only
echo - NodePort - external access on a specific port on each node
echo - LoadBalancer - external access via a load balancer
echo - ExternalName - maps to an external DNS name
echo 
echo "==================================="
echo "====            Ingress        ===="
echo "==================================="
echo 
echo 
echo ingress manages external urls eg / root to the website and /api to the backend api service
echo ingress manages ports 80 and 443 only
echo ingress requires a controller plus an ingress resource
echo 
echo 
echo create ingress
kubectl create ingress my-ingress --rule="host.com=/my-service,host.com/api=/my-api-service"
echo
echo
echo "get ingress"
kubectl get ingress
echo
echo
echo get ingress my-ingress
kubectl get ingress my-ingress -o yaml
echo
echo 
echo "==================================="
echo "====            Egress         ===="
echo "==================================="
echo 
echo 
echo ingress manages external urls but egress manages internal kubernetes communications between pods
echo
echo
echo create an egress
kubectl create egress my-egress -to="example.com"
echo
echo
echo get egress
echo get egress my-egress
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
echo 
echo "==================================="
echo "==================================="
echo "====           Kind            ===="
echo "==================================="
echo "==================================="
echo
echo
echo kind create cluster
kind create cluster
# kind create cluster --name my-cluster --image kindest/node:v1.23.0 --wait 5m 
kind create cluster --name my-cluster-01 --image kindest/node:v1.23.0 --wait 5m --config ./kind-config-01.yaml
# multiple control nodes
kind create cluster --name my-cluster-02 --image kindest/node:v1.23.0 --wait 5m --config ./kind-config-02.yaml
# map ports
kind create cluster --name my-cluster-03 --image kindest/node:v1.23.0 --wait 5m --config ./kind-config-03.yaml
echo
echo kind get clusters
kind get clusters
echo
echo kubectl cluster-info
kubectl cluster-info
echo
echo kind get nodes
kind get nodes
echo 
echo kind get kubeconfig
kind get kubeconfig
echo 
echo kind delete cluster
kind delete cluster
echo
echo load image into kind cluster
kind load docker-image nginx:latest # --name my-cluster
# docker build -t nginx:latest .
# kind load docker-image nginx:latest # --name my-cluster
# kubectl apply -f nginx-deployment.yaml
echo 
echo list images on a cluster
docker exec -it kind-kind crictl images
echo
echo kind build node-image --name my-cluster --image nginx:latest
echo
echo enable feature gates can turn features on or off
echo
echo kind export logs
kind export logs
echo
echo "==================================="
echo "==================================="
echo "====           Helm            ===="
echo "==================================="
echo "==================================="
echo
echo
echo "==================================="
echo "=====       Introduction       ===="
echo "==================================="
echo
echo helm is a package manager for kubernetes
echo helm uses charts to manage applications
echo charts are a collection of files that describe a kubernetes application
echo a chart contains instructions to install, upgrade, and delete an application in a cluster
echo a repository is a collection of charts
echo a release is an instance of a chart running in a cluster ... each release has a name
echo
echo "==================================="
echo "====           Charts          ===="
echo "==================================="
echo
echo charts can be created locally or downloaded from a repository
echo eg
echo - https://artifacthub.io/
echo - https://kubernetes-charts.storage.googleapis.com/
echo - https://charts.bitnami.com/bitnami
echo - https://charts.helm.sh/stable
echo - https://kubernetes.io/docs/tasks/tools/install-helm/
echo
echo also can search for charts using helm search hub
echo
echo helm repo list
helm repo list
echo 
echo helm reo add repo-name repo-url
echo
echo helm repo update
echo
echo helm search repo repo-name
echo
echo helm repo remove repo-name
echo
helm search hub kubernetes --list-repo-url
echo
echo you can add helm charts using helm repo add
echo
echo helm create chart-name
echo 
echo helm lint chart-name
echo 
echo helm package chart-name
echo 
echo "==================================="
echo "====            Install        ===="
echo "==================================="
echo
echo we install or modify a chart using helm install
echo 
echo helm install release-name chart-name --namespace namespace --dry-run --debug
echo helm install release-name package-name
echo 
echo helm install -f chart.yaml --namespace namespace --generate-name
echo helm install --values values.yaml --namespace namespace --generate-name
echo helm install --set key=value,key2=value2,outer.inner=value3 --namespace namespace --generate-name
echo 
echo upgrade will only modify what has changed
echo
echo helm upgrade release-name chart-name --namespace namespace
echo
echo helm rollback release-name revision eg helm rollback release-name 1
echo
echo helm uninstall release-name
echo
echo "==================================="
echo "====            Query          ===="
echo "==================================="
echo
echo helm env
helm env
echo
echo helm list
helm list
echo
echo helm status release-name
helm status release-name
echo
echo helm get values release-name
helm get values 
echo 
echo get manifest which is all the yaml files applied to the cluster
helm get manifest release-name
echo
echo helm show all chart-name
echo 
echo show values chart-name
echo
echo 
echo "==================================="
echo "====          Templates        ===="
echo "==================================="
echo
echo templates are used to create dynamic kubernetes resources
echo templates are written in yaml and can include variables
echo templates can be used to create resources like deployments, services, and configmaps
echo
echo template files are stored in the charts/templates directory
echo templates use values.yaml to define variables defined in the template
echo
echo template data can pull in from values files eg {{ .Values.key }}

echo
echo "==================================="
echo "====           Values          ===="
echo "==================================="
echo
echo apply values using helm install --values values.yaml /chart-name
echo
echo "==================================="
echo "====         Deployment        ===="
echo "==================================="
echo
echo deployment is a kubernetes resource that manages the lifecycle of pods
echo
echo "==================================="
echo "====           Service         ===="
echo "==================================="
echo
echo service is a kubernetes resource that manages networking between pods
echo
echo "==================================="
echo "====         Config Map        ===="
echo "==================================="
echo
echo configmap is a kubernetes resource that manages configuration data for pods
echo data is stored in key-value pairs in a file eg configmap.yaml or as environment variables
echo config maps allow you to inject configuration data into pods`
echo
echo with config map yaml the data is stored in data: field as key:value pairs
echo
cat configmap.yaml
echo
echo example : create cluster 
kind create cluster
kind get clusters
kubectl config get-contexts
kubectl config use-context kind-kind
kubectl cluster-info 
kubectl get nodes
helm install pink ../../../delete-me

echo
echo "==================================="
echo "====         Directives        ===="
echo "==================================="
echo
echo we can use directives to control the flow of the template
echo
echo directives include:
echo - if: to conditionally include or exclude parts of the template
echo - range: to iterate over a list of items
echo - with: to set a context for the template
echo - include: to include another template file
echo - template: to include a template file
echo - define: to define a template file
echo - end: to end a directive
echo
echo 
echo "==================================="
echo "====    Template Directives    ===="
echo "==================================="
echo
echo use {{  }} to include a variable in the template
echo use {{-  }} to trim whitespace before the variable
echo use {{-  }} to trim whitespace after the variable
echo eg name: {{- .Release.Name -}}
echo
echo helm install release-name /delete-me
echo 
echo { } eg Release.Name/Namespace/Service/Values/Chart/Chart.Name/Chart.Version/Files/Capabilities/Template
while true 
do

    echo "1. Menu, 25 kill all, 30 overview, 40 images, 50 containers, 60 pods, 100 clusters, 150 deployments, 200 contexts, 250 namespaces"
    echo "999. Exit"
    read -p "Enter your choice: " choice
    
    echo 
    echo 
    echo 


    if [ "$choice" -eq 1 ]; then

        echo 
        echo "==================================="
        echo "====  view different outputs   ===="
        echo "==================================="
        echo 
        echo CLEAN
        echo 

        echo "10. docker info"
        echo "20. docker clean up"
        echo "25. kill all"

        echo  
        echo OVERVIEW
        echo 

        echo "30. quick overview"

        echo  
        echo IMAGES
        echo 

        echo "40. get images"
        

        echo  
        echo CONTAINERS
        echo 

        echo "50. get containers"

        echo  
        echo PODS
        echo 

        echo "60. get pods"
        echo "65. get pods extra"

        echo "70. run a pod with busybox"
        echo "80. run a pod with nginx and forward the service to port 8081"

        echo 90. delete a named pod
        echo "95. delete standalone pods"

        echo  
        echo CLUSTERS
        echo 

        echo "100. view clusters"
        echo "110. create cluster"
        echo "120. modify cluster"
        echo "130. delete cluster"

        echo  
        echo DEPLOYMENTS
        echo 

        echo "150. view deployments"
        echo "155. describe deployments ih detail and list in wide format"
        echo "160. create deployment"
        echo "178. modify deployment"
        echo "179. scale deployment to zero"
        echo "180. delete deployment"

        echo  
        echo CONTEXTS
        echo 

        echo "200. view contexts"
        echo "210. create context"
        echo "220. modify context"
        echo "230. switch context"
        echo "240. delete context"

        echo 
        echo SERVICES
        echo

        echo "300. view services"
        echo "305. get one named service"
        echo "310. create service"
        echo "320. modify service"
        echo "330. delete service"
        echo "340. expose service"


        echo  
        echo NAMESPACES
        echo 


        echo "350. view namespaces"
        echo "360. create namespace"
        echo "370. modify namespace"
        echo "380. delete namespace"


        echo "999. Exit"






    elif [ "$choice" -eq 10 ]; then
        echo "==================================="
        echo "====         Docker Info       ===="
        echo "==================================="
        echo
        echo
        echo docker info
        docker info
        echo
        echo
        echo docker version
        docker version
        echo
        echo
        echo docker ps -a --format '{{.Names}} {{.Status}}' | sort -k2
        docker ps -a --format '{{.Names}} {{.Status}}' | sort -k2
        echo
        echo

    elif [ "$choice" -eq 20 ]; then

        echo
        echo 
        echo "==================================="
        echo "====    Docker Clean Up        ===="
        echo "==================================="
        echo
        echo
        echo delete pods and delete services
        kubectl delete pod nginx-pod-01
        kubectl delete service nginx-pod
        kubectl delete pod nginx-pod-02
        kubectl delete service nginx-service-02
        kubectl delete pod nginx-pod-03
        kubectl delete service nginx-service-03
        echo
        echo
        sleep 5



    elif [ "$choice" -eq 25 ]; then

        echo "==================================="
        echo "====         Kill All          ===="
        echo "====  a) delete pods --all     ===="
        echo "====  b) system prune all      ===="
        echo "====  c) kill all containers   ===="
        echo "====  d) delete all images     ===="
        echo "==================================="
        echo
        echo
        echo "Killing all containers and pods..."
        docker kill $(docker ps -q)
        kubectl delete pods --all --ignore-not-found
        echo
        echo


        echo 
        echo docker system prune all 
        docker system prune --all --volumes --force
        echo
        echo



        echo 
        echo This will delete all stopped containers, all volumes, and all images        
        echo kill all running containers
        echo 
        docker kill $(docker ps -q)
        echo 
        echo
        echo delete all stopped containers.
        docker rm $(docker ps -a -q)
        echo
        echo
        echo delete all volumes
        echo
        docker volume rm $(docker volume ls -q) 
        echo 
        echo
        echo delete all images
        echo
        docker rmi $(docker images -q)



        echo
        echo "Deleting all Kubernetes resources..."
        echo
        kubectl delete daemonsets,replicasets,services,deployments,pods,rc,ingress --all --all-namespaces



        echo what cluster are you connected to ??? 
        
        kubectl get namespaces

        echo
        echo "Deleting all pods in a specific namespace (e.g., 'foo'):"
        echo
        read -p "Enter the namespace to delete all pods from: " namespace
        if [ -n "$namespace" ]; then
            kubectl delete --all pods --namespace="$namespace"
            echo "All pods in namespace '$namespace' deleted."
            kubectl delete --all deployments --namespace=foo
            echo "All deployments in namespace '$namespace' deleted."
        else
            echo "No namespace provided. Skipping deletion."
        fi
  

        echo delete all pods in all namespaces     
        kubectl get namespaces   
        kubectl delete --all namespaces
      


        echo This command will delete all the namespaces except kube-system, which might be useful:
        for each in $(kubectl get ns -o jsonpath="{.items[*].metadata.name}" | grep -v kube-system);
        do
          kubectl delete ns $each
        done



        echo get all clusters and delete all of them 

        echo
        kubectl config get-clusters
        echo

        for cluster in $(kubectl config get-clusters | tail -n +2); do
            kubectl config delete-cluster "$cluster"
            echo "Deleted cluster: $cluster"
        done
        echo


    elif [ "$choice" -eq 30 ]; then

        echo "==================================="
        echo "====         Quick Overview    ===="
        echo "==================================="
        echo
        echo
        unique_image_count=$(docker images --format '{{.Repository}}:{{.Tag}}' | sort | uniq | wc -l)
        echo "$unique_image_count Docker Images"
        docker images --format '{{.Repository}}:{{.Tag}} {{.Size}}' | sort
        echo
        echo
        echo "Docker Containers:"
        docker ps -a --format '{{.Names}} {{.Status}}' | sort -k2
        echo
        echo
        echo "Kubernetes Pods:"
        kubectl get pods -o wide
        echo
        echo
        echo "Kubernetes Services:"
        kubectl get services -o wide
        echo
        echo
        echo "Kubernetes Deployments:"
        kubectl get deployments -o wide
        echo
        echo
        echo "Kubernetes Nodes:"
        kubectl get nodes -o wide
        echo
        echo
        echo "Kubernetes Namespaces:"
        kubectl get namespaces
        echo
        echo
        echo "Kubernetes Contexts:"
        kubectl config get-contexts
        echo
        echo
        echo "Kubernetes Current Context:"
        kubectl config current-context
        echo
        echo
        echo "Kubernetes Cluster Info:"
        kubectl cluster-info
        echo
        echo
        echo "Kubernetes Config View:"
        kubectl config view --minify
        echo
        echo
        echo "Kubernetes Config Current Context:"
        kubectl config current-context
        echo
        echo


    elif [ "$choice" -eq 40 ]; then

        echo "==================================="
        echo "====         Get Images        ===="
        echo "==================================="
        echo
        echo
        echo get all images and sort by size descending
        echo
        docker images --format '{{.Repository}}:{{.Tag}} {{.Size}}' | sort -k2 -hr
        echo
        echo


    elif [ "$choice" -eq 50 ]; then
        
        echo "==================================="
        echo "====         Containers        ===="
        echo "==================================="
        echo
        echo
        STATUSES=("running" "exited" "created" "restarting" "paused" "dead")
        echo container statuses
        echo 
        printf '%s\n' "${STATUSES[@]}"
        echo
        echo
        echo get containers by status
        echo "------------------------"
        for STATUS in "${STATUSES[@]}"; do
          echo "\n=== $STATUS ====\n"
          docker container ls -a --filter "status=$STATUS" --format '{{.Status}}\t\t{{.Names}}'
        done
        echo
        echo
        echo "\n\n\n\n\n"

    
    
    elif [ "$choice" -eq 60 ]; then


        echo "==================================="
        echo "====         Get Pods          ===="
        echo "==================================="
        echo 
        echo 
        echo
        echo
        echo get pods in this namespace
        echo 
        kubectl get pods -o wide

        
        echo 
        echo 
        echo get pods all namespaces
        echo 
        kubectl get pods --all-namespaces



    elif [ "$choice" -eq 65 ]; then

    
        echo "========================================"
        echo "====         Get Pods Extra         ===="
        echo "========================================"
        echo
        echo
        echo 1. pod names
        echo
        kubectl get pods -o name
        echo
        echo
        echo 2. pod custom name field
        echo
        kubectl get pods -o name | xargs -I {} echo "pod ... {}"
        echo
        echo
        echo 3. pod custom columns
        echo
        kubectl get pods --no-headers -o custom-columns="NAME:.metadata.name,STATUS:.status.phase" | while read name status; do
          echo "pod ... $name is $status"
        done
        echo
        echo
        echo 4 pod print one field 'Controlled By'
        kubectl get pods -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.metadata.ownerReferences[0].name}{"\n"}{end}'
        echo
        echo

        echo list all pods in all namespaces where the Controlled By field is empty
        kubectl get pods --all-namespaces -o json | jq -r '.items[] | select(.metadata.ownerReferences == null) | "\(.metadata.namespace) \(.metadata.name)"'

        echo
        echo
        echo "get pods again"
        kubectl get pods -o wide






    




    elif [ "$choice" -eq 70 ]; then

        echo "============================================"
        echo "====         Run Standalone Pod         ===="
        echo "============================================"
        echo
        echo
        echo run busybox pods
        kubectl run busy-box-pod-01 --image=busybox --restart=Never --command -- sleep 3600
        echo
        echo
        kubectl run busy-box-pod-02 --image=busybox -it -- /bin/sh && echo "pod created and shell opened - type exit to close the shell"







    elif [ "$choice" -eq 80 ]; then

        echo "============================================"
        echo "====         Run Standalone Nginx Pod   ===="
        echo "============================================"

        echo
        echo run a pod using nginx on port 80
        kubectl run nginx-pod-01 --image=nginx --port=80 --restart=Never
        echo
        echo
        echo run an nginx pod with the latest image and expose port 80
        echo note that the --restart=Never option is used to create a standalone pod
        kubectl run nginx-pod-02 --image=nginx:latest --restart=Never
        echo
        echo
        sleep 5
        echo we can add port forwarding using the --port option ... then if we view on port 8080 we can see the nginx welcome page
        kubectl port-forward pod/nginx-pod-02 8080:80
        echo
        echo
        echo get pods with wide output
        kubectl get pods -o wide
        echo  
        echo "============================================"
        echo "==== Run Nginx Web Service On Port 8081 ===="
        echo "========================================="
        echo
        echo
        echo create a single-pod service using the nginx pod and run it on port 8081 using port forwarding
        kubectl run nginx-pod-03 --image=nginx:latest --restart=Never
        kubectl expose pod nginx-pod-03 --type=NodePort --name=nginx-service-03 --port=80 --target-port=80
        echo kubectl port-forward pod/nginx-pod-03 8081:80 forwards pod port to local machine ... Ctrl-C to stop 
        echo test using curl 8081 / kubectl get services / get service nginx-service-03 ... on another terminal
        kubectl port-forward pod/nginx-pod-01 8081:80



    elif [ "$choice" -eq 90 ]; then

        echo "==================================="
        echo "====         Delete Pod        ===="
        echo "==================================="
        echo
        echo
        echo "Deleting a named pod:"
        read -p "Enter the name of the pod to delete: " pod_name
        if [ -n "$pod_name" ]; then
            kubectl delete -namespace default pod "$pod_name" --ignore-not-found
            echo "Pod '$pod_name' deleted."
        else
            echo "No pod name provided. Skipping deletion."
        fi
        echo
        echo

    elif [ "$choice" -eq 95 ]; then

        echo "==================================="
        echo "====         Delete Pods       ===="
        echo "==================================="
        echo
        echo
        echo "Deleting all standalone pods:"
        kubectl delete pods --field-selector=status.phase=Succeeded --ignore-not-found
        kubectl delete pods --field-selector=status.phase=Failed --ignore-not-found
        kubectl delete pods --field-selector=status.phase=Unknown --ignore-not-found
        echo
        echo
        echo "Deleting all pods in the current namespace:"

        echo
        echo delete all pods in current namespace where the Controlled By field is empty
        kubectl get pods -o json | jq -r '.items[] | select(.metadata.ownerReferences == null) | .metadata.name' | xargs kubectl delete pod


    elif [ "$choice" -eq 100 ]; then

        echo "==================================="
        echo "====         View Clusters     ===="
        echo "==================================="
        echo
        echo
        echo "Viewing all clusters in kubeconfig:"
        kubectl config get-clusters
        echo
        echo
        echo "Current cluster:"
        kubectl config current-context
        echo
        echo


    elif [ "$choice" -eq 110 ]; then




        echo "==================================="
        echo "====      Create Cluster       ===="
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
        kubectl config view --minify

    elif [ "$choice" -eq 120 ]; then

        echo "==================================="
        echo "====      Modify Cluster       ===="
        echo "==================================="
        echo
        echo
        echo "Modifying the cluster to use a different API server:"
        kubectl config set-cluster my-cluster --server=https://my-new-kubernetes-api-server:6443
        echo
        echo
        echo "Viewing the updated cluster configuration:"
        kubectl config view --minify
        echo
        echo


    elif [ "$choice" -eq 130 ]; then
        echo "==================================="
        echo "====      Delete Cluster       ===="
        echo "==================================="
        echo
        kubectl config get-clusters
        echo
        read -p "Enter the name of the cluster to delete: " cluster_name
        if [ -n "$cluster_name" ]; then
            kubectl config delete-cluster "$cluster_name"
            echo "Cluster '$cluster_name' deleted."
        else
            echo "No cluster name provided. Skipping deletion."
        fi
        echo
        echo















    #===================================
    # deployments
    #===================================


    elif [ "$choice" -eq 150 ]; then

        echo "==================================="
        echo "====         View Deployments   ===="
        echo "==================================="
        echo
        echo
        echo "Viewing all deployments in current namespace:"
        kubectl get deployments
        echo
        echo
        echo "Viewing all deployments in all namespaces:"
        kubectl get deployments --all-namespaces
        echo
        echo


    

    elif [ "$choice" -eq 155 ]; then

        echo "==================================="
        echo "====     Describe Deployments   ===="
        echo "==================================="
        echo
        echo
        echo "Viewing all deployments in current namespace:"
        kubectl get deployments -o wide
        echo
        echo
        echo "Viewing all deployments in all namespaces:"
        kubectl get deployments --all-namespaces -o wide
        echo
        echo
        echo "Describing all deployments in current namespace:"
        kubectl describe deployments
        echo
        echo
        echo "Describing a specific deployment:"
        read -p "Enter the name of the deployment to describe: " deployment_name
        if [ -n "$deployment_name" ]; then
            kubectl describe deployment "$deployment_name"
            echo "Described deployment '$deployment_name'."
        else
            echo "No deployment name provided. Skipping description."
        fi
        echo
        echo




    elif [ "$choice" -eq 160 ]; then

        echo "==================================="
        echo "====         Create Deployment  ===="
        echo "==================================="
        echo
        echo
        echo "Creating a deployment with 3 replicas using nginx image:"
        kubectl create deployment my-deployment --image=nginx --replicas=3
        echo
        echo
        echo "Viewing all deployments after creation:"
        kubectl get deployments -o wide
        echo
        echo

    elif [ "$choice" -eq 178 ]; then

        echo "==================================="
        echo "====    Scale Deployment Up    ===="
        echo "==================================="
        echo
        echo
        echo "Modifying the deployment to scale to 5 replicas:"
        kubectl scale deployment my-deployment --replicas=5
        echo
        echo
        echo "Viewing all deployments after scaling:"
        kubectl get deployments -o wide
        echo
        echo

    elif [ "$choice" -eq 179 ]; then

        echo "===================================="
        echo "====  Scale Deployment To Zero  ===="
        echo "===================================="
        echo
        echo
        echo "Scaling the deployment named my-deployment to zero replicas:"
        kubectl scale deployment my-deployment --replicas=0
        echo
        echo
        echo "Viewing all deployments after scaling to zero:"
        kubectl get deployments -o wide
        echo
        echo



    elif [ "$choice" -eq 180 ]; then

        echo "====================================="
        echo "====     Delete Named Deployment ===="
        echo "====================================="
        echo
        kubectl get deployments 
        echo
        read -p "Enter the name of the deployment to delete: " deployment_name
        if [ -n "$deployment_name" ]; then
            kubectl delete deployment "$deployment_name"
            echo "Deployment '$deployment_name' deleted."
        else
            echo "No deployment name provided. Skipping deletion."
        fi


    elif [ "$choice" -eq 200 ]; then

        echo "==================================="
        echo "====         View Contexts     ===="
        echo "==================================="
        echo
        echo
        echo "Viewing all contexts in kubeconfig:"
        kubectl config get-contexts
        echo
        echo
        echo "Current context:"
        kubectl config current-context
        echo
        echo
        echo config view - minify  
        kubectl config view --minify
        echo
        echo


    elif [ "$choice" -eq 210 ]; then

        echo "==================================="
        echo "====         Create Context    ===="
        echo "==================================="
        echo
        echo
        echo "create a new context using set-context which creates a context entry in kubeconfig"
        kubectl config set-context my-context --cluster=my-cluster --user=my-user
        kubectl config set-context my-context --cluster my-cluster --user my-user --namespace my-namespace
        echo 
        echo 
        echo "Switching to the new context..."
        kubectl config use-context my-context
        echo 
        echo 

    elif [ "$choice" -eq 220 ]; then

        echo "==================================="
        echo "====         Modify Context    ===="
        echo "==================================="
        echo
        echo
        echo "Modifying the current context to use a different cluster and user:"
        kubectl config set-context my-context --cluster=my-new-cluster --user=my-new-user
        echo
        echo

        echo "Switching to the new context..."
        kubectl config use-context my-context
        echo 
        echo 


    elif [ "$choice" -eq 230 ]; then

        echo "==================================="
        echo "====         Switch Context    ===="
        echo "==================================="
        echo
        echo
        kubectl config get-contexts
        echo 
        echo "Switching to a different context:"
        read -p "Enter the name of the context to switch to: " context_name
        if [ -n "$context_name" ]; then
            kubectl config use-context "$context_name"
            echo "Switched to context '$context_name'."
        else
            echo "No context name provided. Skipping switch."
        fi
        echo
        echo


    elif [ "$choice" -eq 240 ]; then

        echo "==================================="
        echo "====         Delete Context    ===="
        echo "==================================="
        echo
        read -p "Enter the name of the context to delete: " context_name
        if [ -n "$context_name" ]; then
            kubectl config delete-context "$context_name"
            echo "Context '$context_name' deleted."
        else
            echo "No context name provided. Skipping deletion."
        fi





        echo delete my-context
        kubectl config delete-context my-context
        echo 
        echo 
        echo check if context is removed
        kubectl config get-contexts
        echo 


    elif [ "$choice" -eq 300 ]; then

        echo "==================================="
        echo "====         View Services     ===="
        echo "==================================="
        echo
        echo
        echo "Viewing all services in current namespace:"
        kubectl get services -o wide
        echo
        echo
        echo "Viewing all services in all namespaces:"
        kubectl get services --all-namespaces -o wide
        echo
        echo



    elif [ "$choice" -eq 305 ]; then

        echo "==================================="
        echo "====         Get One Service   ===="
        echo "==================================="
        echo
        echo
        echo "Viewing a specific service by name:"
        read -p "Enter the name of the service to view: " service_name
        if [ -n "$service_name" ]; then
            kubectl get service "$service_name" -o wide
            echo "Service '$service_name' details displayed."
        else
            echo "No service name provided. Skipping view."
        fi
        echo
        echo


                


    elif [ "$choice" -eq 310 ]; then

        echo "==================================="
        echo "====         Create Service    ===="
        echo "==================================="
        echo
        echo
        echo "Creating a service for the nginx pod on port 80:"
        kubectl expose pod nginx-pod-01 --type=NodePort --name=nginx-service-01 --port=80 --target-port=80
        echo
        echo
        echo "Viewing all services after creation:"
        kubectl get services -o wide
        echo
        echo

    elif [ "$choice" -eq 320 ]; then

        echo "==================================="
        echo "====         Modify Service    ===="
        echo "==================================="
        echo
        echo
        echo "Modifying the nginx service to change the target port to 8080:"
        kubectl patch service nginx-service-01 -p '{"spec":{"ports":[{"port":80,"targetPort":8080}]}}'
        echo
        echo
        echo "Viewing all services after modification:"
        kubectl get services -o wide
        echo
        echo

    elif [ "$choice" -eq 330 ]; then

        echo "==================================="
        echo "====         Delete Service    ===="
        echo "==================================="
        echo
        read -p "Enter the name of the service to delete: " service_name
        if [ -n "$service_name" ]; then
            kubectl delete service "$service_name"
            echo "Service '$service_name' deleted."
        else
            echo "No service name provided. Skipping deletion."
        fi

        echo

    elif [ "$choice" -eq 340 ]; then

        echo "==================================="
        echo "====         Expose Service    ===="
        echo "==================================="
        echo
        echo
        echo "Exposing the nginx service on port 8081:"
        kubectl expose service nginx-service-01 --type=NodePort --name=nginx-service-01-exposed --port=80 --target-port=80 --external-ip=


        echo

        echo create a service and expose port 80 to the other pods in the cluster
        kubectl expose deployment my-deployment --type=NodePort --name=my-service --port=80 --target-port=80



    elif [ "$choice" -eq 350 ]; then

        echo "==================================="
        echo "====         View Namespaces   ===="
        echo "==================================="
        echo
        echo
        echo "Viewing all namespaces in the cluster:"
        kubectl get namespaces
        echo
        echo
        echo "Current namespace:"
        kubectl config view --minify | grep namespace:
        echo
        echo


    elif [ "$choice" -eq 360 ]; then

        echo "==================================="
        echo "====         Create Namespace  ===="
        echo "==================================="
        echo
        echo
        echo "Creating a new namespace named my-namespace:"
        kubectl create namespace my-namespace
        echo
        echo
        echo "Viewing all namespaces after creation:"
        kubectl get namespaces
        echo
        echo

    elif [ "$choice" -eq 370 ]; then

        echo "==================================="
        echo "====         Modify Namespace  ===="
        echo "==================================="
        echo
        echo
        echo "Modifying the namespace to add a label:"
        kubectl label namespace my-namespace my-label=my-value
        echo
        echo
        echo "Viewing all namespaces after modification:"
        kubectl get namespaces --show-labels
        echo
        echo

    elif [ "$choice" -eq 380 ]; then

        echo "==================================="
        echo "====         Delete Namespace  ===="
        echo "==================================="
        echo
        read -p "Enter the name of the namespace to delete: " namespace_name
        if [ -n "$namespace_name" ]; then
            kubectl delete namespace "$namespace_name"
            echo "Namespace '$namespace_name' deleted."
        else
            echo "No namespace name provided. Skipping deletion."
        fi
        echo


    




    elif [ "$choice" -eq 999 ]; then
        echo "Exiting."
        break

    fi
done
