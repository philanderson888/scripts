echo "======================================================================="
echo "====                    nginx"
echo "======================================================================="
echo nginx tutorials
echo https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04
echo https://ubuntu.com/server/docs/how-to-install-nginx
sudo apt-get -qq install nginx -y > /dev/null
sleep 1
echo nginx -v
nginx -v
sleep 1
