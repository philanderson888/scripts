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
echo 'is zsh installed?'
echo "dpkg -l zsh"
dpkg -l zsh

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
cat /etc/shells | grep zsh

echo " "
echo "is zsh the default shell?"
echo "cat /etc/passwd | grep $USER"
cat /etc/passwd | grep $USER
echo "cat /etc/passwd | grep zsh"
cat /etc/passwd | grep zsh

echo " "
echo "tip: can log out and log back in to see the changes"
echo "tip2: can also use the command `exec zsh` to switch to zsh"
echo "tip3: can also replace the shell in the /etc/passwd file"

echo " "
echo "what is in bashrc?"
cat ~/.bashrc | grep zsh 

echo " "
echo "create a zshrc file"
touch ~/.zshrc



echo " "
echo "========================================"
echo "========================================"
echo "        Section 2 - Customization"
echo "========================================"
echo "========================================"

echo " "
echo "========================================"
echo "              Oh My Zsh"
echo "========================================"

echo " "
echo "Oh My Zsh is an open-source, community-driven framework for managing your zsh configuration. "
echo "It comes bundled with a ton of helpful functions, helpers, plugins, themes, and a few things that make you shout... 'Oh My ZSH!'"

echo " "
echo "Oh My Zsh will not make you a 10x developer...but you may feel like one."

echo " "
echo "Oh My Zsh is installed by running the following command in your terminal."
echo "sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)""
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo " "
echo "is Oh My Zsh installed?"
echo "ls -a ~ | grep oh-my-zsh"
ls -a ~ | grep oh-my-zsh

echo " "
echo "what is in zshrc?"
cat ~/.zshrc

echo " "
echo "use the command `source ~/.zshrc` to reload the zshrc file"
source ~/.zshrc

echo " "
echo "use oh-my-zsh to change the theme"
echo "nano ~/.zshrc"
echo "ZSH_THEME="robbyrussell" to ZSH_THEME="agnoster""
nano ~/.zshrc


echo " "
echo "========================================"
echo "              Reload"
echo "========================================"

echo " "
echo "reload the zshrc file to view changes"
echo "omz reload"
omz reload



echo " "
echo "========================================"
echo "              Update"
echo "========================================"

echo " "
echo "update Oh My Zsh"
omz update






echo " "
echo "========================================"
echo "              Run a command"
echo "========================================"

echo " "
echo "run a command in oh-my-zsh"
echo "omz run echo 'Hello, World!'"
omz run echo 'Hello, World!'

echo " "
echo "run a command in oh-my-zsh"
zsh_stats
