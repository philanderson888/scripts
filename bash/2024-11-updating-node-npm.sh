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

node -v
npm -v
npm install -g npm@latest
npm -v
node -v

echo " "
echo "========================================"
echo "            Updating Yarn"
echo "========================================"

yarn -v
npm install -g corepack
corepack enable
yarn set version stable
yarn -v

echo " "
echo "========================================"
echo "            Updating Pnpm"
echo "========================================"

pnpm -v
curl -fsSL https://get.pnpm.io/install.sh | sh -
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
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo " "
echo "update homebrew"
brew update 

echo " "
echo "brew upgrade node"
brew upgrade node
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
pnpm -v
curl -fsSL https://get.pnpm.io/install.sh | sh -

echo " " 
echo "or can use wget (if curl is not installed)"
echo " "
echo "brew install wget on a mac"
echo "sudo apt install wget on linux"
sudo apt install wget

echo " "
echo "wget -qO- https://get.pnpm.io/install.sh | sh -"
wget -qO- https://get.pnpm.io/install.sh | sh -

pnpm -v
