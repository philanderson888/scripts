echo
echo
echo script 09 create-react-app

echo installing npx
npm install -g npx

#echo creating react app using npx which uses latest versions of the libraries
#echo this takes too long so commenting out this line for now
#npx create-react-app server05

npm install --global yarn
yarn create react-app server09
cd server09

echo about to set the port to $port
sed -i 's/react-scripts start/PORT=3009 react-scripts start/g' package.json

echo starting react app on port $port
npm start

curl localhost:3009 -s
curl ::1:3009 -s
curl $ip:3009 -s
