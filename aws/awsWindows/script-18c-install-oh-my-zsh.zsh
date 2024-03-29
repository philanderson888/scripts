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
echo "====                             install oh my zsh                                  ===="
echo "====================================================================="
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# sudo lchsh $USER if you are on Fedora.
# Note that this will not work if Zsh is not in your authorized shells list (/etc/shells)
# or if you don't have permission to use chsh. 
# If that's the case you'll need to use a different procedure.
# If you use lchsh you need to type /bin/zsh to make it your default shell.
# Log out and log back in again to use your new default shell.
# Test that it worked with echo $SHELL. Expected result: /bin/zsh or similar.
# Test with $SHELL --version. Expected result: 'zsh 5.8' or similar

