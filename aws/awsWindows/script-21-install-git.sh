if [[  "$os" == "$os_ubuntu" ]]; then
    sudo apt-get install git -y
    sudo apt-get install git-all -y
elif [[  "$os" == "$os_fedora" ]]; then
    sudo dnf install git -y
    sudo dnf install git-all -y
fi 
git --version
git_installed=true
