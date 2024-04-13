echo
echo
echo script create-react-app
echo
echo
echo
echo npx version
npx -v
echo
echo
echo
echo mkdir react32010 and cd into it
cd ~
mkdir react32010
cd react32010
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
cd ~
echo creating react app
echo npx create-react-app@latest my-app - - use-npm
npx create-react-app@latest react32020 --use-npm
echo
echo
echo
echo cd react32020
cd react32020
echo
echo
echo
echo ls
ls
#echo npm start
#npm start




echo "============================================================"
echo "====             install corepack 32030                 ===="
echo "============================================================"
#echo npm install yarn
#sudo npm install --global yarn -y
echo corepack enable
sudo corepack enable
echo
echo
echo
#echo yarn update to latest 
#yarn set version stable -y
#yarn install -y
#echo yarn version
#yarn -v
#echo yarn create react app
#yarn create react-app server09
#cd server09
#echo about to set the port to $port
#sed -i 's/react-scripts start/PORT=3009 react-scripts start/g' package.json
#echo starting react app on port $port
#npm start
#curl localhost:3009 -s
#curl ::1:3009 -s
#curl $ip:3009 -s
