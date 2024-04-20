#!/bin/zsh
echo
echo
echo
echo terraform tutorials
echo https://medium.com/@sanghpriya785/running-your-first-terraform-hello-world-example-4bd8bb5c3efc
echo https://www.terraformbyexample.com/hello-world
echo https://developer.hashicorp.com/terraform/install
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
