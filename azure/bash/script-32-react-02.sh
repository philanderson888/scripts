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
echo ls
ls
echo
echo
echo
echo yarn create react app
yarn create react-app react02
echo
echo
echo
echo cd react02
cd react02
port=3010
echo about to set the port to $port
sed -i 's/react-scripts start/PORT=3010 react-scripts start/g' package.json
echo starting react app on port $port
npm start
