echo create-react-app
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
echo
echo
echo
echo npm install
npm install
echo
echo
echo
port=3009
echo about to set the port to $port
sed -i 's/react-scripts start/PORT=3009 react-scripts start/g' package.json
echo starting react app on port $port
echo npm start
npm start
