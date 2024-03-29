echo apt-get install zsh
sudo apt-get install zsh -y
zsh --version
echo which zsh
which zsh
echo set as default
sudo chsh -s $(which zsh)
echo log off
exit
