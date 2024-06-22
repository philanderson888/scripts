echo "======================================================================="
echo "====                      install express                          ===="
echo "======================================================================="
echo "tutorial https://code.visualstudio.com/docs/nodejs/nodejs-tutorial"
echo
echo install express using ...
echo touch ~/.zshrc
touch ~/.zshrc
echo
echo
echo
echo amend the path so it accepts npm install -g commands
echo 'export NODE_PATH="'$(npm root -g)'"' >> ~/.bash_profile && . ~/.bash_profile
echo 'export NODE_PATH="'$(npm root -g)'"' >> ~/.zshrc && . ~/.zshrc
echo
echo
echo
echo sudo npm install express -g
sudo npm install -g express -y
echo
echo
echo
echo npm install express-generator
sudo npm install -g express-generator -y
echo
echo
echo
echo "======================================================================="
echo "====                  express has been installed                   ===="
echo "======================================================================="

echo "======================================================================="
echo "====           create express using express command"
echo "======================================================================="
echo cd ~
cd ~
echo
echo
echo
echo ls
ls
echo
echo
echo
echo create express app
echo express myExpressApp2 --view pug
express myExpressApp2 --view pug
echo
echo
echo
echo cd myExpressApp2
cd myExpressApp2
echo
echo
echo
echo npm install 
npm install -y
echo
echo
echo
echo "======================================================================="
echo "====      npm start - express - running on port 3000               ===="
echo "======================================================================="
echo npm start
npm start



