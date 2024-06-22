echo using this tutorial
echo "https://learn.microsoft.com/en-us/azure/app-service/quickstart-nodejs?tabs=linux&pivots=development-environment-cli"
echo steps are ...
echo 1. install node 
echo 2. install npm
echo 3. install azure cli
echo 4. remove old install
echo rm - rf ~/temp 
rm -rf ~/temp 
echo
echo
echo
echo create new directory
echo mkdir ~/temp
mkdir ~/temp
echo
echo 
echo
echo cd ~/temp
cd ~/temp
echo
echo
echo
echo 4. scaffold app using ...
echo npx express-generator myExpressApp --view ejs
npx express-generator myExpressApp --view ejs -y
# alternative npx express-generator myExpressApp2 --view=ejs -y
echo
echo
echo
echo change directory
echo cd myExpressApp
cd myExpressApp
echo
echo
echo
echo npm install
npm install
echo
echo
echo
echo run server
echo DEBUG=myexpressapp:* npm start
DEBUG=myexpressapp:* npm start
echo
echo
echo