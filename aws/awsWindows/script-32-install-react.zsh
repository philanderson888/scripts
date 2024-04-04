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
echo upgrade react to latest
echo npm install react-scripts@latest
npm install react-scripts@latest -y
echo 
echo
echo

echo creating react app
npx create-react-app server05

echo cd server05
cd server05

echo ls
ls

echo npm start
echo this does work but it blocks the script - so removing for now ... will create on different thread ...
#npm start


#echo npm install yarn

corepack enable
#sudo npm install --global yarn -y

echo yarn update to latest 
#yarn set version stable -y
#yarn install -y

echo
echo
echo

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