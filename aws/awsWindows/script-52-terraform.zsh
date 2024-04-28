#!/bin/zsh
echo "=============================================================="
echo "====                    terraform help                    ===="
echo "=============================================================="
echo terraform -help
terraform -help
echo
echo
echo
echo terraform -help plan
terraform -help plan
echo "=============================================================="
echo "====           terraform ... create folders               ===="
echo "=============================================================="
echo
echo cd ~
cd ~
echo 
echo
echo
echo ls
ls
echo
echo
echo
echo mkdir terraform-052-021
mkdir terraform-052-021
echo
echo
echo
echo mv ./script-52-terraform.tf terraform-052-021
mv ./script-52-terraform.tf terraform-052-021
echo
echo
echo
echo ls
ls
echo
echo
echo
echo cd terraform-052-021
cd terraform-052-021
echo
echo
echo
echo mv ./script-52-terraform.tf ./main.tf
mv script-52-terraformtf main.tf
echo
echo
echo
echo terraform tutorials
echo https://medium.com/@sanghpriya785/running-your-first-terraform-hello-world-example-4bd8bb5c3efc
echo https://www.terraformbyexample.com/hello-world
echo https://developer.hashicorp.com/terraform/install
echo https://levelup.gitconnected.com/terraform-hello-world-b4985162cff2
echo install terraform on linux for azure https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli
echo
echo
echo
echo "=============================================================="
echo "====                terraform ... install                 ===="
echo "=============================================================="
echo sudo apt-get update 
sudo apt-get -qq update -y
echo
echo
echo sudo apt-get install gnupg 
sudo apt-get -qq install -y gnupg 
echo
echo
echo
echo sudo apt-get install software-properties-common
sudo apt-get -qq install -y software-properties-common
echo
echo
echo
echo
echo download terraform binaries
# wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
echo
echo
echo
echo report fingerprint
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
echo
echo
echo
echo download terraform signing keys
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
echo
echo
echo
echo sudo apt-get update
sudo apt-get -qq update -y 
echo
echo
echo
echo sudo apt-get install terraform
sudo apt-get -qq install terraform -y >> ~/output.txt
echo
echo
echo
echo "=============================================================="
echo "====              terraform ... hello world               ===="
echo "=============================================================="
echo ls
ls
echo
echo
echo
echo terraform init 052-098
terraform init 
echo
echo
echo
echo ls
ls
echo
echo
echo
echo terraform apply input false auto approve
terraform apply -input=false -auto-approve 
echo
echo
echo
# echo terraform apply input=false script-52-terraform.tf
# terraform apply -input=false script-52-terraform.tf
echo
echo
echo
echo create a plan with terraform plan out tfplan
terraform plan -out=tfplan -input=false
echo
echo
echo
echo ls
ls
echo
echo
echo
echo terraform apply tfplan
terraform apply -input=false
echo
echo
echo
echo terraform apply -input=false -auto-approve -lock=false tfplan
terraform apply -input=false -auto-approve -lock=false tfplan
echo
echo
echo
echo terraform plan -destroy -out=tfplan -input=false -lock=false
terraform plan -destroy -out=tfplan -input=false -lock=false
echo
echo
echo
echo terraform apply -input=false -auto-approve -lock=false tfplan
terraform apply -input=false -auto-approve -lock=false tfplan
echo
echo
echo
echo ls
ls
echo
echo
echo
echo screen - d - m to open a new window
screen -dm
echo
echo
echo
touch terraformScript.sh
echo echo hello from running terraform script by phil anderson the mega scripter >> terraformScript.sh
echo screen - d m ./terraformScript.sh
screen -dm ./terraformScript.sh
echo
echo
echo
echo screen - list 
screen -list
echo
echo
echo
echo cd ~
cd ~
echo 
echo
echo
echo ls
ls
echo
echo
echo
echo cd terraform-052-021
cd terraform-052-021
echo
echo
echo
echo ls
ls
echo
echo
echo
echo enable tab completion for zsh - only need this for interactive sessions - auto tab complete
touch ~/.zshrc
echo
echo
echo
echo install terraform autocomplete - only need this for interactive sessions - auto tab complete
terraform -install-autocomplete
echo
echo
echo
echo 
echo create script 1
touch script1.sh
echo 
echo 
echo
echo chmod 777 script1.sh
chmod 777 ./script1.sh
echo
echo
echo "echo ... echo hello >> script1.sh"
echo "echo hello world from script1.sh" >> script1.sh
echo
echo
echo
echo cat ./script1.sh
cat ./script1.sh
echo
echo
echo
echo ls
ls
echo
echo
echo
echo nohup script1.sh - does this run in a background process - not sure
sudo nohup ./script1.sh
echo
echo
echo
echo the bash command opens a bash shell
echo bash
bash
echo
echo
echo
echo does zsh also work
echo zsh
zsh
echo "=============================================================="
echo "====            terraform ... nginx on docker             ===="
echo "=============================================================="
echo
echo
echo
echo cd ~
cd ~
echo 
echo
echo
echo mkdir terraform-nginx-on-docker
mkdir terraform-nginx-on-docker
echo
echo
echo
echo mv ./script-52-terraform-main.tf terraform-nginx-on-docker
mv ./script-52-terraform-main.tf terraform-nginx-on-docker
echo
echo
echo
echo cd terraform-nginx-on-docker
cd terraform-nginx-on-docker
echo
echo
echo
echo mv ./script-52-terraform-main.tf ./main.tf
mv script-52-terraform-main.tf main.tf
echo
echo
echo
echo terraform init
terraform init
echo
echo
echo
echo terraform apply
terraform apply -input=false -auto-approve 
echo
echo
echo
echo docker ps to see running container
docker ps
echo
echo
echo
echo curl localhost:8000
curl localhost:8000
