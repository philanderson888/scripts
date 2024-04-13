echo "======================================================================="
echo "====                 apt-get install nginx 23"
echo finish the job - here are some links to complete the job
echo https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04
echo https://ubuntu.com/server/docs/how-to-install-nginx
echo "======================================================================="
sudo apt-get -qq install nginx -y
echo
echo
echo
sleep 1
echo nginx version
nginx -v
