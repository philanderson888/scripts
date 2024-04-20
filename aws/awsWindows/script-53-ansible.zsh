echo
echo
echo 
echo ansible tutorials
echo https://www.ansible.com/how-ansible-works/
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
