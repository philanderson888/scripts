echo "Add Docker's official GPG key"
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "Add the repository to Apt sources"

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

echo install docker
sudo apt-get install docker-ce -y
sudo apt-get install docker-ce-cli -y
sudo apt-get install containerd.io -y
sudo apt-get install docker-buildx-plugin -y
sudo apt-get install docker-compose-plugin -y0

echo
echo
echo
echo groupadd docker
sudo groupadd docker
echo
echo
echo
echo usermod docker
sudo usermod -aG docker ${USER}
echo
echo
echo
echo su user
su -s ${USER}
echo
echo
echo
echo docker run hello world
docker run hello-world
echo
echo
echo
echo if it gives errors then try this
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
echo
echo
echo
ls 
ls
ls -lah
sudo chmod g+rwx "$HOME/.docker" -R
echo
echo
echo
sudo chmod 666 /var/run/docker.sock
echo
echo
echo
echo finished block optional if errors arise
echo
echo
echo
echo docker run hello world
docker run hello-world
echo
echo
echo
echo docker run hello world
docker run hello-world
echo
echo
echo
echo docker pull ubuntu
docker pull ubuntu
echo
echo
echo
echo docker run ubuntu
docker run ubuntu whoami
echo 
echo 
echo
echo docker pull debian
docker pull debian
echo
echo
echo
echo docker run debian
docker run debian whoami
echo
echo
echo
echo end docker script
echo
echo
echo
