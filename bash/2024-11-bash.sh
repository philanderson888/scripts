echo " "
echo "========================================"
echo "========================================"
echo "========================================"
echo "                 bash"
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

echo " "
echo "1. What is bash?"
echo "bash is a Unix shell and command language written by Brian Fox for the GNU Project as a free software replacement for the Bourne shell. "
echo "First released in 1989, it has been distributed widely as the shell for the GNU operating system and as a default shell on Linux and macOS. "
echo "It has been ported to Microsoft Windows and distributed with Cygwin and MinGW, to DOS by the DJGPP project,"
echo "to Novell NetWare and to Android via various terminal emulation applications. "


echo " "
echo "========================================"
echo "               Head"
echo "========================================"

echo " "
echo "to print the first few lines of a file use head"
head -10 ~/.bashrc


echo " "
echo "========================================"
echo "               Tail"
echo "========================================"

echo " "
echo "to print the last few lines of a file use tail"
tail -10 ~/.bashrc










echo " "
echo "========================================"
echo "========================================"
echo "    Section 2 - Installing Libraries"
echo "========================================"
echo "========================================"
echo " "



echo " "
echo "========================================"
echo "            Installing Homebrew"
echo "========================================"

echo " "
echo "to install homebrew on linux run the following command"
echo " "
echo "/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)""
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo " "
echo "brew -v"
brew -v
echo "brew update"
brew update 
echo "brew upgrade"
brew upgrade
echo "brew cleanup"
brew cleanup
echo "brew doctor"
brew doctor
echo "brew -v"
brew -v






echo " "
echo "========================================"
echo "            Installing Pnpm"
echo "========================================"

echo " "
echo "pnpm -v"
pnpm -v
echo "curl -fsSL https://get.pnpm.io/install.sh | sh -"
curl -fsSL https://get.pnpm.io/install.sh | sh -
echo "pnpm -v"
pnpm -v







echo " "
echo "========================================"
echo "            Installing Yarn"
echo "========================================"

echo " "
echo "yarn -v"
yarn -v
echo "npm install -g yarn"
npm install -g corepack
echo "corepack enable"
corepack enable
echo "yarn set version stable"
yarn set version stable
echo "yarn -v"
yarn -v





echo " "
echo "========================================"
echo "========================================"
echo "        Section 3 - a to z"
echo "========================================"
echo "========================================"
echo " "


echo " "
echo "========================================"
echo "                 kill"
echo "========================================"


echo " "
echo "to kill a process running on port 3000"
echo " "
echo "lsof -i tcp:3000"
lsof -i tcp:3000
# will display process id
echo "kill -9 #processid"
# kill -9 #processid
