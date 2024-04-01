if [[  "$os" == "$os_ubuntu" ]]; then
    sudo apt-get -qq install git -y
    #sudo apt-get -qq install git-all -y
elif [[  "$os" == "$os_fedora" ]]; then
    sudo dnf -qq install git -y
    #sudo dnf -qq install git-all -y
fi 
git --version
git_installed=true
