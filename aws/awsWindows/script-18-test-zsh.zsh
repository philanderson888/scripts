#!/bin/zsh
zsh
echo shell in use is $0
echo shell version is $0 --version
echo which zsh
which zsh
echo whereis zsh
whereis zsh
echo "====================================================================="
echo "====                set zsh as default shell                     ===="
echo "====================================================================="
sudo chsh -s $(which zsh)
sudo chsh -s /usr/bin/zsh
#echo if on fedora use lchsh $USER
#sudo lchsh $USER
#echo If you use lchsh you need to type /bin/zsh to make it your default shell.
#echo Log out and log back in again to use your new default shell.
#echo Test that it worked with echo $SHELL. Expected result: /bin/zsh or similar
#echo Test with $SHELL --version. Expected result: 'zsh 5.8' or similar
