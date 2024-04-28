#!/bin/zsh
echo zsh
zsh
cd ~
startTime="$(date +%s)"
echo "=================================================================="
echo "====           npm install create-vue 28020                   ===="
echo "=================================================================="
cd ~
echo mkdir vue28020
mkdir vue28020
echo cd vue28020
cd vue28020
sudo npm install -g create-vue
npm install create-vue
echo
echo
echo
echo ls
ls
echo
echo
echo
echo "=================================================================="
echo "====                  git clone vue 28030                     ===="
echo "=================================================================="
cd ~
echo git clone github kontent-ai sample-app-vue
git clone https://github.com/kontent-ai/sample-app-vue
echo
echo
echo
echo mv sample-app-vue vue28030
mv sample-app-vue vue28030
cd vue28030
echo
echo
echo
echo ls
ls
echo
echo
echo
echo npm install
npm install
echo
echo
echo
endTime=$(date +%s)
scriptDuration=$(($endTime-$startTime))
echo "=================================================================="
echo "====        git clone vue 28030 took $scriptDuration s        ===="
echo "=================================================================="
