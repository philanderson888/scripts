#!/bin/zsh
echo which shell am i using
echo $SHELL 
$SHELL --version
echo
echo
echo
echo which version of zsh is in use
zsh --version
echo "====================================================================="
echo "====                         test oh-my-zsh                            ===="
echo "====================================================================="
oh-my-zsh.sh
