echo "============================================================"
echo "====             install corepack 32030                 ===="
echo "============================================================"
echo npm install yarn
sudo npm install --global yarn -y
echo corepack enable
sudo corepack enable
echo
echo
echo
echo yarn update to latest 
yarn set version stable -y
yarn install -y
echo yarn version
yarn -v
echo yarn create react app
yarn create react-app server09
cd server09
echo about to set the port to $port
sed -i 's/react-scripts start/PORT=3009 react-scripts start/g' package.json
echo starting react app on port $port
npm start
curl localhost:3009 -s
curl ::1:3009 -s
curl $ip:3009 -s