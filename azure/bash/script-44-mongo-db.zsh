echo import public gpg key
curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo
echo
echo
echo was key added correctly
echo apt-key list
apt-key list
echo
echo
echo
echo point apt to correct source for mongo db files
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
echo
echo
echo
echo sudo apt-get update
sudo apt-get update
echo
echo
echo
echo sudo apt-get install mongodb-org
sudo apt-get install mongodb-org -y
echo
echo
echo
echo get mongo db version
mongod --version
echo
echo
echo
echo start mongo db
sudo systemctl start mongod.service
sudo systemctl status mongod
echo
echo
echo
echo set service to start at boot 
echo sudo systemctl enable mongod
sudo systemctl enable mongod
echo
echo
echo
echo run diagnostic command on the database
mongo --eval 'db.runCommand({ connectionStatus: 1 })'










