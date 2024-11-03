echo " "
echo "========================================"
echo "========================================"
echo "========================================"
echo "                zsh"
echo "========================================"
echo "========================================"
echo "========================================"
echo " "

echo " "
echo "========================================"
echo "========================================"
echo "        Section 1 - Learning"
echo "========================================"
echo "========================================"
echo " "


echo "========================================"
echo "              About"
echo "========================================"
echo " "

echo " "
echo "Zsh is a shell designed for interactive use, although it is also a powerful scripting language. "
echo "Many of the useful features of bash, ksh, and tcsh were incorporated into zsh; many original features were added. "
echo "The overall goal is to provide a more consistent and intuitive command set than is provided by other shells. "

echo " "
echo "zsh has features such as:"
echo " "
echo "1. Spell checking"
echo "2. Shared history"
echo "3. Auto-completion"
echo "4. Prompt themes"
echo "5. Directory jumping"
echo "6. Customizable key bindings"
echo "7. And more"


echo "========================================"
echo "              Install"
echo "========================================"
echo " "


echo " "
echo "sudo apt-get install zsh -y"
sudo apt-get install zsh -y

echo " "
echo "check the version"
echo "zsh --version"
zsh --version



echo "========================================"
echo "               Use"
echo "========================================"
echo " "


echo " "
echo "we can switch between bash and zsh using `bash` and `zsh` commands"
echo "echo $SHELL"
echo $SHELL
echo "zsh"
zsh
echo "echo $SHELL"
echo $SHELL
echo "bash"
bash
echo "echo $SHELL"
echo $SHELL


echo " "
echo "we switch between bash and zsh using the command chsh -s /bin/zsh"
echo "echo $SHELL"
echo $SHELL
echo "chsh -s /bin/zsh"
chsh -s /bin/zsh
echo "echo $SHELL"
echo $SHELL
echo "chsh -s $(which zsh)"
chsh -s $(which zsh)
sudo chsh -s /bin/zsh
sudo chsh -s $(which zsh)
echo "echo $SHELL"
echo $SHELL

echo " "
echo "is zsh a valid login shell?"
echo "cat /etc/shells | grep zsh"

echo " "
echo "is zsh the default shell?"
echo "cat /etc/passwd | grep $USER"

echo " "
echo "what is in bashrc?"
cat ~/.bashrc 

echo " "
echo "what is in zshrc?"
cat ~/.zshrc
