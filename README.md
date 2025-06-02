# scripts

Repo for scripts that I use

## contents

- [scripts](#scripts)
  - [contents](#contents)
  - [bash](#bash)
    - [update node npm yarn pnpm to latest versions](#update-node-npm-yarn-pnpm-to-latest-versions)
  - [docker](#docker)
  - [docker compose](#docker-compose)
  - [kubernetes](#kubernetes)
    - [kubernetes glossary](#kubernetes-glossary)
    - [kubernetes config](#kubernetes-config)
    - [kubernetes script](#kubernetes-script)
  - [kubernetes projects](#kubernetes-projects)
    - [kubernetes deployments](#kubernetes-deployments)
    - [kubernetes pods](#kubernetes-pods)
    - [kubernetes contexts](#kubernetes-contexts)
  - [minikube](#minikube)
    - [install](#install)
    - [cheat sheet](#cheat-sheet)
    - [version](#version)
    - [minikube start](#minikube-start)
    - [minikube status](#minikube-status)
    - [view single node](#view-single-node)
    - [minikube dashboard](#minikube-dashboard)
    - [minikube samples](#minikube-samples)
  - [digital ocean](#digital-ocean)

## bash

### update node npm yarn pnpm to latest versions

[update node npm yarn pnpm](bash/2024-11-update-node-npm-yarn-pnpm-to-latest.sh)

see output on github via github workflows at .github/workflows/2024-11-update-node-npm-yarn-pnpm-to-latest.yml

## docker

[docker](/docker/)

## docker compose

```bash
docker compose up --build
```

to force a container rebuild

## kubernetes

all commands

https://kubernetes.io/docs/reference/kubectl

### kubernetes glossary

container engine - docker - runs the containers

container orchestrator - kubernetes - k8s

master node has 1) control plane manages 2) api server to send commands to the `kubelet` agents 3) scheduler to manage resources 4) controller to manage state (desired vs actual) 5) etcd key-value database

worker node has 1) runtime eg `docker` or `containerd` 2) kubelet agent to receive admin commands from control plane 3) `kube-proxy` to talk to other containers and the outside world (network proxy)

### kubernetes config

default is `~/.kube/config`

```yaml
POD_NAMESPACE

```

### kubernetes script

please run

[devops/kubernetes/scripts/kubernetes-01](devops/kubernetes/scripts/kubernetes-01.sh)

to see all the features of kubernetes at work


## kubernetes projects

run

[devops/kubernetes/projects/kubernetes-01-simple-web-server](devops/kubernetes/projects/kubernetes-01-simple-web-server) 

to see a single web server send and receive data on port 3002

also run the next project

[projects/kubernetes-02-two-servers](projects/kubernetes-02-two-servers) 

to see how two containers can run in one pod and also run a service to receive data in and send data out


### kubernetes deployments

```bash
# deploy nginx 
kubectl create deployment nginx --image=nginx      

# deploy busybox and run command
kubectl create job hello --image=busybox:1.28 -- echo "Hello World"

# create a CronJob that prints "Hello World" every minute
kubectl create cronjob hello --image=busybox:1.28   --schedule="*/1 * * * *" -- echo "Hello World"
```

### kubernetes pods

```bash
kubectl explain pods
# get pods running on a given node
kubectl get pods --field-selector=spec.nodeName=server01
kubectl get pods -o wide
# run pod
# kubectl run temp-pod --image=busybox -it -- /bin/sh
# get interactive shell in a pod
kubectl exec -ti <pod-name> -- /bin/bash
# get logs from a pod
kubectl logs <pod-name>
# get logs streamed from a pod
kubectl logs -f <pod-name>
```

### kubernetes contexts

kubernetes contexts are the `yaml` files attached to a kubernetes cluster run - using a different file will spin up a totally different cluster with different resources etc

```bash
kubectl config get-contexts
kubectl config current-context
kubectl config use-config context-name
kubectl config set-context new-context-name --cluster=cluster-name --user=user-name --namespace=namespace
kubectl config delete-context context-name
kubectl config view
```

## minikube

minikube runs a single-node kubernetes cluster

### install

```bash
brew install minikube
```

### cheat sheet

```bash
brew install minikube
minikube version 
minikube start
minkube pause
minkube status
kubectl get namespaces
kubectl config get-contexts
kubectl get nodes
kubectl get pods
kubectl get pods --all-namespaces
minikube dashboard
minikube addons list
minikube stop
minikube delete
minikube delete --all
```

### version

```bash
minikube version 
# minikube version: v1.36.0
# commit: f8f52f5de11fc6ad8244afac475e1d0f96841df1
```

### minikube start

to start `minikube` first check `docker desktop` is running then run

```bash
minikube start
```

which yields

```
😄  minikube v1.36.0 on Darwin 15.4.1 (arm64)
✨  Automatically selected the docker driver
📌  Using Docker Desktop driver with root privileges
👍  Starting "minikube" primary control-plane node in "minikube" cluster
🚜  Pulling base image v0.0.47 ...
💾  Downloading Kubernetes v1.33.1 preload ...
    > gcr.io/k8s-minikube/kicbase...:  463.69 MiB / 463.69 MiB  100.00% 17.20 M
    > preloaded-images-k8s-v18-v1...:  327.15 MiB / 327.15 MiB  100.00% 10.07 M
🔥  Creating docker container (CPUs=2, Memory=4000MB) ...
🐳  Preparing Kubernetes v1.33.1 on Docker 28.1.1 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```

### minikube status

```bash
minkube status
```

```
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```

### view single node

```bash
kubectl get nodes
# minikube   Ready    control-plane   3m33s   v1.33.1
```

### minikube dashboard

```bash
minikube dashboard
# opens in browser
```


### minikube samples

```bash
kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0
kubectl expose deployment hello-minikube --type=NodePort --port=8080
#deployment.apps/hello-minikube created
#service/hello-minikube exposed
minikube service hello-minikube
```



## digital ocean 

we can connect to a digital ocean cluster using `doctl`

```bash
brew install doctl
```

