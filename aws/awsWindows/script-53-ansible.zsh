#!/bin/zsh
zsh
echo "=============================================================="
echo "====                         ansible                      ===="
echo "=============================================================="
echo ansible is agentless running via ssh to manage machines
echo ansible uses yaml yet another markup language to manage hosts
echo ansible produces consistent configuration, the same each time
echo ansible inventory file clarifies the hosts on which to run 
echo ansible roles allow grouping of tasks, handlers and variables which promote reusability and modularity
echo ansible playbooks are written in yaml and set tasks to be performed
echo ansible has master and hosts
echo ansible keeps lists of relevant hosts in the /etc/ansible/hosts file
echo ansible hosts specified in the inventory.ini file under the hosts flag
echo 
echo ansible tutorials
echo https://www.ansible.com/how-ansible-works/
echo https://docs.ansible.com/ansible/latest/getting_started/introduction.html
echo
echo
echo
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
echo mv script-53-ansible.yaml ansible
mv script-53-ansible.yaml ansible
mv script-53-inventory.ini ansible
echo
echo
echo
echo cd ansible
cd ansible
echo
echo
echo
echo mv script-53-inventory.ini inventory.ini
mv script-53-inventory.ini inventory.ini
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
sudo apt-get -qq install software-properties-common -y >> remote-output.txt
echo
echo
echo
echo sudo add-apt-repository --update ppa:ansible/ansible
sudo add-apt-repository --yes --update ppa:ansible/ansible
echo
echo
echo
echo sudo apt-get install ansible
sudo apt-get -qq install ansible -y >> remote-output.txt
echo
echo
echo
echo ansible version
ansible --version
echo
echo
echo sudo apt-get install python3
sudo apt-get -qq install python3 -y
echo 
echo
echo
echo check python version
echo python3 --version
python3 --version
echo
echo
echo
echo sudo apt-get install python3-pip
sudo apt-get -qq install python3-pip -y >> remote-output.txt
echo
echo
echo
echo is python pip installed
echo pip3 --version
pip3 --version
echo
echo
echo
echo which pip3
which pip3
echo
echo
echo
echo pip3 --help
pip3 --help
echo
echo
echo
echo alternative way to install ansible ... pip install ansible
pip3 install ansible
echo
echo
echo
echo list packages installed via pip3
echo pip3 list
pip3 list
echo
echo
echo
echo show details about package
echo pip3 show ansible
pip3 show ansible
echo
echo
echo
echo sleep 1
sleep 1
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
echo ansible-playbook using inventory.ini and script.yaml
ansible-playbook -i inventory.ini script-53-ansible.yaml
echo
echo
echo
echo further learning with ansible
echo lets look at the ansible hosts file
echo cat /etc/ansible/hosts
cat /etc/ansible/hosts
echo
echo
echo
echo now list ansible inventory
echo ansible-inventory -list
ansible-inventory -list
