#!/bin/zsh
zsh
echo which shell am i using ... fix this later as I really really really want to be using z shell here !!!
echo $SHELL 
$SHELL --version
echo
echo
echo
echo which zsh
which zsh
echo whereis zsh
whereis zsh
echo "zsh --version"
zsh --version
echo "====================================================================="
echo "====                         set zsh as default shell                                 ===="
echo "====================================================================="

sudo chsh -s $(which zsh)

sudo chsh -s /usr/bin/zsh
