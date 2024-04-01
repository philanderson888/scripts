echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
sudo chmod 777 /var/cache/debconf/ 
sudo chmod 777 /var/cache/debconf/passwords.dat
sudo apt-get install -y -q
echo apt-get install dialog
sudo apt-get install dialog
echo apt-get install apt-utils
sudo apt-get install apt-utils
echo apt-get install zsh
sudo apt-get -qq install zsh -y >> output.txt
zsh --version
echo which zsh
which zsh
echo set as default
sudo chsh -s $(which zsh)
exit
