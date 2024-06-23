#echo "======================================================================="
#echo "====                 download express project 25100                ===="
#echo "====         git clone strongloop/express-example-app              ====" 
#echo "======================================================================="
#git clone https://github.com/strongloop/express-example-app --quiet
#echo mv express-example-app express
#mv express-example-app express
#cd express
#echo "list files"
#ls
#echo
#echo
#echo
#echo "rename the ports"
#sed -i 's/3000/3008/g' server.js
#sed -i 's/listening on port/node express server 08 responding on port/g' server.js
#echo "cat the server file"
#cat server.js
#echo "======================================================================="
#echo "====               express - npm install 25110                     ===="
#echo "======================================================================="
#npm install
#echo "npm version using npm list express"
#npm list express
#echo
#echo
#echo
#echo "======================================================================="
#echo "====                  npm start express 25120                      ===="
#echo "====                   run in non-ui thread                        ===="
#echo "======================================================================="
#npm start
#echo "======================================================================="
#echo "====                       curl ipv4   1                           ===="
#echo "======================================================================="
#curl localhost:3008 -s
#echo "======================================================================="
#echo "====                       curl ipv6    1                          ===="
#echo "======================================================================="
# curl ::1:3008 -s
#echo "======================================================================="
#echo "====                express built but not running 25130            ===="
#echo "======================================================================="
#startTime="$(date +%s)"