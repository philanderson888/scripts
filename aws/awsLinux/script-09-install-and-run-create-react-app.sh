echo
echo
echo create react02 using create react app
echo
echo
echo
echo installing npx
npm install -g npx
echo
echo
echo
echo npm install yarn
npm install --global yarn > /dev/null
echo 
echo
echo
echo yarn create react app react 01
yarn create react-app react01
cd react01
echo
echo
echo
port=3009
echo set port to $port
sed -i 's/react-scripts start/PORT=3009 react-scripts start/g' package.json
echo
echo
echo
echo start react01 app on port $port
npm start
