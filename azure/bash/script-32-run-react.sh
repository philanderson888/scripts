#!/bin/zsh
zsh

echo
echo
echo
echo check is node npm npx installed
echo node -v
node -v
echo npm -v
npm -v
echo npx -v
npx -v
echo
echo
echo
echo upgrade react to latest
echo npm install react-scripts@latest
npm install react-scripts@latest -y
echo 
echo
echo
echo npx clear-npx-cache
npx clear-npx-cache
echo
echo
echo



echo "============================================================"
echo "====             install corepack 32030                 ===="
echo "============================================================"
echo cd ~
cd ~
echo
echo
echo
echo mkdir react02
mkdir react02
echo
echo
echo
echo cd react02
cd react02
echo
echo
echo
echo npm install yarn
sudo npm install --global yarn -y
echo
echo
echo
echo corepack enable
sudo corepack enable
echo
echo
echo
echo yarn update to latest 
yarn set version stable -y
yarn install -y
echo
echo
echo
echo yarn version
yarn -v
echo
echo
echo



echo find react server
echo cd ~/scripts/sample-apps/bun/bun-react-58262
cd ~/scripts/sample-apps/bun/bun-react-58262
echo
echo
echo
echo npm install bun -y
npm install bun -y
echo
echo
echo
echo bun install
bun install
echo
echo
echo
echo bun run dev
bun run dev
