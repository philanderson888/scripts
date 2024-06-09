echo "======================================================================="
echo "====            apt-get install zsh 18020                          ===="
echo "======================================================================="   
cd ~
echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
sudo chmod 777 /var/cache/debconf/ 
sudo chmod 777 /var/cache/debconf/passwords.dat
sudo apt-get install -y -q > /dev/null
echo apt-get install dialog
sudo apt-get install dialog > /dev/null
echo apt-get install apt-utils
sudo apt-get install apt-utils > /dev/null
sleep 1
echo apt-get install zsh
sudo apt-get -qq install zsh -y > /dev/null
sleep 1
echo zsh
zsh
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
echo cat script-18-run-zsh.sh
cat script-18-run-zsh.sh
echo
echo
echo
echo cat script-18-run-zsh.sh >> .bashrc
cat script-18-run-zsh.sh >> .bashrc
echo
echo
echo
echo echo shell
echo $0
echo
echo
echo
echo zsh version
zsh --version
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
sudo chsh -s $(which zsh)
