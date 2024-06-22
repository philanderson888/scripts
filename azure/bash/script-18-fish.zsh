echo "======================================================================="
echo "====             apt-get install fish 04350                        ===="
echo "======================================================================="
sudo apt-add-repository ppa:fish-shell/release-3 -y  > /dev/null
sudo apt-get -qq update -y > /dev/null
sudo apt-get -qq install fish -y > /dev/null
sleep 1
fish --version
