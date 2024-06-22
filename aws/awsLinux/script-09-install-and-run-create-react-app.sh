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
echo  npm install yarn
npm install --global yarn > /dev/null
echo 
echo
echo
echo yarn create react app react 01
yarn create react-app react01
cd react02
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
# for react 03 app
#echo creating react app using npx which uses latest versions of the libraries
#echo this takes too long so commenting out this line for now
#npx create-react-app server05