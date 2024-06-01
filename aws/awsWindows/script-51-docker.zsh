echo docker script
echo
echo
echo
echo list existing files
echo cd ~
cd ~
ls
echo
echo
echo
echo echo first create docker folder
echo mkdir docker
mkdir docker
echo
echo
echo
echo move compose.yaml to docker folder
mv ./script-51-docker-compose.yaml docker
echo
echo
echo
echo cd docker
cd docker
echo
echo
echo
echo "Add Docker's official GPG key"
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo
echo
echo
echo "Add the repository to Apt sources"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo sudo apt-get update -y
sudo apt-get update -y
echo
echo
echo
echo install docker
sudo apt-get install docker-ce -y
echo
echo
echo
echo install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-$(uname -s)-$(uname -m)"  -o /usr/local/bin/docker-compose
sudo mv /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
echo
echo
echo
echo
echo sudo apt-get install docker-compose-plugin
sudo apt-get install docker-compose-plugin -y
echo
echo
echo docker compose version
docker compose version
echo docker-compose -v
docker-compose -v
echo
echo
echo
echo usermod docker
sudo usermod -aG docker ${USER}
echo
echo
echo
echo create .docker file 
touch ~/.docker
echo
echo
echo
echo if it gives errors then try this
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
echo
echo
echo ls
ls -lah
echo sudo chmod g+rwx " $ HOME / .docker" - R
sudo chmod g+rwx "$HOME/.docker" -R
echo
echo
echo
echo sudo chmod 666 /var/run/docker.sock
sudo chmod 666 /var/run/docker.sock
echo
echo
echo
echo finished block optional if errors arise
echo
echo
echo
echo docker run hello world
docker run hello-world
echo
echo
echo
echo docker pull ubuntu
docker pull ubuntu
echo
echo
echo
echo docker run ubuntu
docker run ubuntu whoami
docker run ubuntu pwd
echo
echo
echo
touch myDockerFile.sh
echo echo hello from running docker file by phil anderson the mega scripter >> myDockerFile.sh
echo
echo
echo
echo printing out shell file which is about to be run inside docker container
cat ./myDockerFile.sh
echo
echo
echo
echo running my script inside docker container
docker exec ubuntu ./myDockerFile.sh
echo 
echo 
echo
echo docker exec - run docker interactive shell - commented out for now as we dont want this
# docker exec -it ubuntu /bin/bash
echo
echo
echo
echo docker images
docker ps
echo
echo
echo
echo docker running images
docker ps -a
echo
echo
echo
echo docker pull alpine
docker pull alpine
echo docker run alpine
docker run alpine whoami
echo
echo
echo
echo docker pull debian
docker pull debian
echo
echo
echo
echo docker run debian
docker run debian whoami
docker run debian pwd
echo
echo
echo
echo sudo find / -name docker-compose
echo remove this search - as its super slow - as its searching entire computer for one string - not good
sudo find / -name docker-compose
echo
echo
echo
echo docker-compose -v
docker-compose -v
echo
echo
echo
echo docker ps
docker ps
echo
echo
echo
echo docker-compose ps
docker-compose ps
echo
echo
echo
echo
echo docker-compose up
docker-compose up
echo
echo
echo
echo docker-compose up - d
docker-compose up -d
echo
echo
echo
echo 
sleep 1
echo
echo
echo
echo curl localhost
curl localhost
# Output:
# <!DOCTYPE html>
# <html>
# <head>
# <title>Welcome to nginx!</title>
# ...

echo
echo
echo
echo docker images
docker ps
echo
echo
echo
echo docker running images
docker ps -a
echo
echo
echo
echo end docker script
echo
echo
echo
echo kubectl script
echo
echo
echo
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
echo
echo
echo
echo download kubectl checksum
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo
echo
echo
echo validate kubectl checksum
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
echo
echo
echo
echo install kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
echo
echo
echo
echo kubectl version
kubectl version --client
echo
echo
echo
echo kubectl detailed version
kubectl version --client --output=yaml
echo
echo
echo
echo return to root directory
cd ~
echo mkdir kubectl
mkdir kubectl
echo
echo
echo
echo move kubectl.yaml to docker folder
mv ./script-51-kubectl.yaml kubectl
echo
echo
echo
echo cd kubectl
cd kubectl
echo
echo
echo
echo kubectl apply script-51-kubectl.yaml
kubectl apply -f script-51-kubectl.yaml
echo
echo
echo
echo kubectl get pods
kubectl get pods
echo
echo
echo
echo maybe do this via interactive shell first
#kubectl exec -it my-ubuntu-xxxxx-xxxxx -- /bin/bash
echo
echo
echo
echo minikube
echo
echo
echo
echo return to root directory
cd ~
echo download minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
echo
echo
echo
echo install minikube
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
echo
echo
echo
echo start minikube
minikube start
echo
echo
echo
echo minikube use
echo minikube can download the appropriate version of kubectl 
echo and you should be able to use it like this minikube kubectl - - get po - A
minikube kubectl -- get po -A
echo
echo
echo
echo set minikube alias
echo alias kubectl="minikube kubectl --"
alias kubectl="minikube kubectl --"
echo
echo
echo
echo kubectl get po - A
kubectl get po -A
echo
echo
echo
echo some services eg storage-provisioner may not be running
echo this is normal during cluster bring-up
echo this will resolve itself

echo minkube dashboard shows status of clusters
minikube dashboard




echo Create a sample deployment and expose it on port 8080:

kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0

kubectl expose deployment hello-minikube --type=NodePort --port=8080

echo It may take a moment, but your deployment will soon show up when you run:

kubectl get services hello-minikube

echo The easiest way to access this service is to let minikube launch a web browser for you:

minikube service hello-minikube

echo Alternatively, use kubectl to forward the port:

kubectl port-forward service/hello-minikube 7080:8080

echo Tada! Your application is now available at http://localhost:7080/.

echo You should be able to see the request metadata in the application output. Try changing the path of the request and observe the changes. Similarly, you can do a POST request and observe the body show up in the output.





echo Halt the cluster:

minikube stop


echo Change the default memory limit (requires a restart):

minikube config set memory 9001

echo browse the catalog of easily installed Kubernetes services:

minikube addons list


echo Create a second cluster running an older Kubernetes release:

minikube start -p aged --kubernetes-version=v1.16.1


echo Delete all of the minikube clusters:

minikube delete --all
