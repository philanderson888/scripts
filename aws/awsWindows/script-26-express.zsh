echo "======================================================================="
echo "====                 git clone express  2                          ===="
echo "======================================================================="
git clone https://github.com/strongloop/express-example-app --quiet
echo "folder has been downloaded"
echo "rename folder"
mv express-example-app express
echo "move into folder"
cd express
echo "list files"
ls
echo "rename the ports"
sed -i 's/3000/3008/g' server.js
sed -i 's/listening on port/node express server 08 responding on port/g' server.js
echo "cat the server file"
cat server.js
echo "======================================================================="
echo "====                    npm install express  2                     ===="
echo "======================================================================="
npm install
echo "list files now"
ls
echo "npm version using npm list express"
npm list express
