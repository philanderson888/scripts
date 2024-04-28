#!/bin/zsh
echo
echo cd ~
cd ~
echo 
echo
echo
echo mkdir ansible
mkdir ansible
echo
echo
echo
echo mv ./script-53-ansible.yaml ansible
mv ./script-53-ansible.yaml ansible
mv ./script-53-inventory.ini ansible
echo
echo
echo
echo cd ansible
cd ansible
echo
echo
echo
echo mv ./script-53-inventory.ini ./inventory.ini
mv ./script-53-inventory.ini ./inventory.ini
echo
echo
echo 
echo ansible tutorials
echo https://www.ansible.com/how-ansible-works/
echo https://docs.ansible.com/ansible/latest/getting_started/introduction.html
echo
echo
echo
echo
echo sudo apt update
sudo apt-get -qq update -y
echo
echo
echo
echo sudo apt-get install software-properties-common
sudo apt-get -qq install software-properties-common -y >> output.txt
echo
echo
echo
echo sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo add-apt-repository --yes --update ppa:ansible/ansible
echo
echo
echo
echo sudo apt-get install ansible
sudo apt-get -qq install ansible -y >> output.txt
echo
echo
echo
echo ansible version
ansible --version
echo
echo
echo
echo sudo apt-get install python-pip Python3-pip
sudo apt-get install Python3-pip -y
sudo apt-get install python-pip -y
echo
echo
echo
echo alternative way to install ansible ... pip install ansible
pip install ansible
echo
echo
echo
echo verify inventory
echo ansible-inventory -i inventory.ini --list
ansible-inventory -i inventory.ini --list
echo
echo
echo
echo ping hosts in inventory
echo ansible myhosts -m ping -i inventory.ini
ansible myhosts -m ping -i inventory.ini --connection local
echo
echo
echo
echo run ansible
echo
echo
echo
ansible-playbook -i inventory.ini ./script-53-ansible.yaml
