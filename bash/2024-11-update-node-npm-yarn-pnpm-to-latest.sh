echo " "
echo "========================================"
echo "========================================"
echo "========================================"
echo "                 node"
echo "========================================"
echo "========================================"
echo "========================================"
echo " "

echo " "
echo "========================================"
echo "========================================"
echo "        Section 1 - Updating Node"
echo "========================================"
echo "========================================"
echo " "


echo " "
echo "========================================"
echo "            Updating Node and NPM"
echo "========================================"

echo " "
echo "node -v"
node -v
echo "npm -v"
npm -v
echo "npm install -g npm@latest"
npm install -g npm@latest
echo "node -v"
node -v
echo "npm -v"
npm -v


echo " "
echo "========================================"
echo "            Updating Yarn"
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
echo "            Updating Pnpm"
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
echo "       Updating Node using Homebrew"
echo "========================================"

echo " "
echo "on a mac you can use homebrew to update node and npm"
echo " "

echo " "
echo "on a linux machine we have to install homebrew first to see how this is done"

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
echo "add homebrew to your path"
echo >> /home/runner/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/runner/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

source /home/runner/.bashrc

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
echo "brew install node"
brew install node
echo "brew upgrade node"
brew upgrade node

echo " "
echo "npm install -g npm"
npm install -g npm

echo " "
npm -v
node -v

echo " "
echo "also another newer way using n"
echo " "

sudo brew install n
n latest

echo " "
echo "so we have now updated node and npm to latest, let's check with yarn and pnpm"

echo " "
echo "========================================"
echo "            Updating Yarn"
echo "========================================"

echo " "
yarn -v
npm install -g corepack
corepack enable
yarn set version stable
yarn -v

echo " "
echo "========================================"
echo "            Updating Pnpm"
echo "========================================"

echo " "
echo "pnpm -v"
pnpm -v
echo "sudo apt-get install curl -y"
sudo apt-get install curl -y
echo "curl -v"
curl -v

echo "curl -fsSL https://get.pnpm.io/install.sh | sh -"
curl -fsSL https://get.pnpm.io/install.sh | sh -

echo " " 
echo "or can use wget (if curl is not installed)"
echo " "
echo "brew install wget on a mac"
echo "sudo apt-get install wget on linux"
sudo apt-get install wget -y


pwd
ls 



echo " "
echo "wget -qO- https://get.pnpm.io/install.sh | sh -"
wget -qO- https://get.pnpm.io/install.sh | sh -

pnpm -v
