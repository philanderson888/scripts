#!/bin/zsh
zsh
echo find bun server
echo cd ~/scripts/sample-apps/bun/bun-vue-01-63892
cd ~/scripts/sample-apps/bun/bun-vue-01-63892
echo
echo
echo
echo install bun
echo curl - f s S L https://bun.sh/install 
curl -fsSL https://bun.sh/install | bash
echo
echo
echo
echo add bun to path
touch ~/.bashrc
echo 'BUN_INSTALL="/home/azureuser/.bun"' >> ~/.bashrc
echo 'PATH="$BUN_INSTALL/bin:$PATH"' >> ~/.bashrc
echo
echo
echo
echo source /home/azureuser/.bashrc
source /home/azureuser/.bashrc
echo
echo
echo
echo find bun server
echo cd ~/scripts/sample-apps/bun/bun-vue-01-63892
cd ~/scripts/sample-apps/bun/bun-vue-01-63892
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
echo bun dev
bun dev
