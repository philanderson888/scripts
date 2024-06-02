echo "======================================================================="
echo "====            apt-get install zsh 18020                          ===="
echo "======================================================================="   
echo cd ~
cd ~
echo whoami
whoami
echo pwd
pwd
echo
echo
echo
echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
sudo chmod 777 /var/cache/debconf/ 
sudo chmod 777 /var/cache/debconf/passwords.dat
sudo apt-get install -y -q
echo
echo apt-get install dialog
sudo apt-get install dialog
echo
echo apt-get install apt-utils
sudo apt-get install apt-utils
sleep 1
echo
echo apt-get install zsh 018-021
sudo apt-get -qq install zsh -y
sleep 2
echo
echo
echo
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
echo echo shell
echo $SHELL 
echo
echo
echo
echo shell version
$SHELL --version
echo
echo
echo
zsh --version
echo which zsh
which zsh
echo
echo
echo
echo touch .zshrc
touch .zshrc
echo
echo cat .zshrc
cat .zshrc
echo
echo
echo
echo set zsh as default ... do any work ... with sudo or without sudo ... 2
sudo chsh -s $(which zsh)
