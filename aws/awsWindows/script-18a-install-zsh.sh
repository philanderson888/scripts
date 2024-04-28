echo "======================================================================="
echo "====            apt-get install zsh 18020                          ===="
echo "======================================================================="   
echo cd ~
cd ~
echo
echo
echo
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
sudo
sudo
sudo
echo touch ./.oh-my-zsh
touch ./.oh-my-zsh
echo
echo
echo
echo ls
ls
echo
echo
echo
echo force zsh to always run every time by amending .bashrc file
echo cat script-18-always-run-zsh.sh
cat script-18-always-run-zsh.sh
echo
echo
echo
echo cat script-18-always-run-zsh.sh >> .bashrc
cat script-18-always-run-zsh.sh >> .bashrc
echo
echo
echo
echo cat .bashrc
cat .bashrc
echo
echo
echo
echo echo shell
echo $SHELL 
echo
echo
echo
echo shell version
$SHELL --version


zsh --version
echo which zsh
which zsh
echo set as default
sudo chsh -s $(which zsh)
exit
