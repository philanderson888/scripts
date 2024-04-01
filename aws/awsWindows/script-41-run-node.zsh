echo "=============================================================="
echo "====               run node web server                    ===="
echo "=============================================================="



echo "=============================================================="
echo "====               configure web server                   ===="
echo "=============================================================="

echo first check if server is already running
ps -ef | grep 'node script-41-server.js'
ps aux | grep 'node script-41-server.js'
echo also list processes on port 3006
lsof -i :3006
echo ... get the process id
pidof node



echo "=============================================================="
echo "====                  run web server                     ===="
echo "=============================================================="

echo print current location
pwd
echo list files
ls


echo now starting the node server - this works ... pause for now ... run in a new terminal with source command
node script-41-server.js
echo 
echo testing web server with curl command
curl localhost:3006

echo successfully spun up a nodejs web server wow !!! happy days
echo end of script 06 install and run node web server