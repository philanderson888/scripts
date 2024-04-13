#!/bin/zsh
echo zsh - setting zsh as the shell - but does it work
zsh
echo
echo
echo
echo shell
echo $SHELL 
echo
echo
echo
echo shell version
$SHELL --version
echo
echo
echo
echo which zsh
which zsh
echo
echo
echo
echo whereis zsh
whereis zsh
echo
echo
echo
echo zsh version
zsh --version
echo "====================================================================="
echo "====                set zsh as default shell                     ===="
echo "====================================================================="
sudo chsh -s $(which zsh)
sudo chsh -s /usr/bin/zsh
echo
echo
echo
echo has the shell changed - let us see 
echo shell
echo $SHELL
