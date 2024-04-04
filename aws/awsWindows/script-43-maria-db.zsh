





echo =====
echo install maria db
echo =====





echo update

sudo apt update -y

echo install maria db

sudo apt install mariadb-server -y



echo start maria db

sudo systemctl start mariadb.service -y


echo mysql secure installation

sudo mysql_secure_installation -y



echo test maria db

sudo systemctl status mariadb


echo maria db version

mariadb -V

sudo mysqladmin version




