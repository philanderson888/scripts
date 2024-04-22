#!/bin/zsh
echo
echo cd ~
cd ~
echo 
echo
echo
echo mkdir terraform
mkdir terraform
echo
echo
echo
echo mv ./script-52-terraform.tf terraform
mv ./script-52-terraform.tf terraform
echo
echo
echo
echo cd terraform
cd terraform
echo
echo
echo terraform tutorials
echo https://medium.com/@sanghpriya785/running-your-first-terraform-hello-world-example-4bd8bb5c3efc
echo https://www.terraformbyexample.com/hello-world
echo https://developer.hashicorp.com/terraform/install
echo https://levelup.gitconnected.com/terraform-hello-world-b4985162cff2
echo
echo
echo
echo download terraform binaries
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo
echo
echo
echo download terraform signing keys
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
echo
echo
echo
echo sudo apt update
sudo apt-get -qq update -y 
echo
echo
echo
echo sudo apt-get install terraform
sudo apt-get -qq install terraform -y >> output.txt
echo
echo
echo
echo run terraform hello world
echo terraform init a
terraform init -input=false
echo
echo
echo
echo terraform init b
terraform init -auto-approve
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
echo terraform apply input=false script-52-terraform.tf
terraform apply -input=false script-52-terraform.tf
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
echo ls
ls
