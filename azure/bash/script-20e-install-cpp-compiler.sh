if [[  "$os_type" == "$os_type_debian" ]]; then
    echo "================================================================="
    echo "====              apt-get install g++                        ===="
    echo "================================================================="
    echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
    sudo chmod 777 /var/cache/debconf/ 
    sudo chmod 777 /var/cache/debconf/passwords.dat
    sudo apt-get install -y -q > /dev/null
    sudo apt-get install dialog -y -q > /dev/null
    sudo apt-get install apt-utils -y -q > /dev/null
    sudo apt-get -qq install g++ -y > /dev/null
    echo not sure if this is required ... install build-essential
    sudo apt-get -qq install build-essential -y > /dev/null
elif [[  "$os_type" == "$os_type_fedora" ]]; then
    echo "================================================================="
    echo "====                    yum install g++               ==========="
    echo "================================================================="
    sudo yum -qq install g++ -y
fi
echo "================================================================="
echo "====                    g++ version                          ===="
echo "================================================================="
g++ --version
cpp_installed=true
