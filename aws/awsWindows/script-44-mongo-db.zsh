






echo =====
echo install mongo db
echo =====






wget -qO - https://www.mongodb.org/static/pgp/server-3.0.asc | sudo apt-key add -

echo this one

echo "deb http://repo.mongodb.org/apt/ubuntu precise/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

echo or this one

echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

echo update

sudo apt-get update

echo install mongodb

sudo apt-get install -y mongodb-org

echo get mongo db version

mongod --version

echo start mongo db

sudo service mongod start









