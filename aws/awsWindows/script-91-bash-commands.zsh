#!/bin/zsh
echo zsh
zsh
echo
echo
echo
echo cd ~
cd ~
echo
echo
echo
echo cat ./.oh-my-zsh
cat ./.oh-my-zsh
echo "==================================================================="
echo "==================================================================="
echo "====                     bash commands                         ===="
echo "==================================================================="
echo "==================================================================="
echo "==================================================================="
echo "====                    df disk free                           ===="
echo "==================================================================="
echo df
echo pipe output to tee disk_usage.txt
df -h | tee disk_usage.txt
echo "==================================================================="
echo "====         lsof list processes running                       ===="
echo "==================================================================="
echo also list processes on port 3006
lsof -i :3006
echo "==================================================================="
echo "====   nohup - no hangup - run command in background process   ===="
echo "==================================================================="
echo echo mkdir ~/nohup
mkdir ~/nohup
echo cd ~/nohup
cd ~/nohup
echo
echo
echo
echo create script 1
touch script1.sh
echo 
echo 
echo
echo chmod 777 script1.sh
chmod 777 ./script1.sh
echo
echo
echo "echo ... echo hello >> script1.sh"
echo "echo hello world from script1.sh" >> script1.sh
echo
echo
echo
echo cat ./script1.sh
cat ./script1.sh
echo
echo
echo
echo ls
ls
echo
echo
echo
echo nohup script1.sh - does this run in a background process - not sure
sudo nohup ./script1.sh
echo
echo
echo
echo cd ~
cd ~
echo "==================================================================="
echo "====                  open a new window                        ===="
echo "==================================================================="
echo open a terminal works on mac but not linux so will not work here
open -a Terminal ~
echo "==================================================================="
echo "====                   pid process id                          ===="
echo "==================================================================="
echo ... get the process id
pidof node
echo "==================================================================="
echo "====                        ping                               ===="
echo "==================================================================="
ping -c 4 localhost
ping -c 4 127.0.0.1
ping -c ::1
ping -c 4 google.com
echo "==================================================================="
echo "====                     ps process                            ===="
echo "==================================================================="
echo check if server is already running
ps -ef | grep 'node script-41-server.js'
ps aux | grep 'node script-41-server.js'
echo "==================================================================="
echo "====                        script                             ===="
echo "==================================================================="
echo this command stops the script and opens a new interactive window
echo so dont actually run it now ... or it will stop the script ...
echo script /dev/null
#script /dev/null
echo "==================================================================="
echo "====                        stat                               ===="
echo "==================================================================="
echo stat command shows details about a file
echo stat file
stat disk_usage.txt
echo "==================================================================="
echo "====                        tail                               ===="
echo "==================================================================="
echo tail prints last 10 lines of a file
echo tail disk_usage.txt
tail ./disk_usage.txt
echo "==================================================================="
echo "====           tee - named after plumbing T splitter           ===="
echo "====                   write to standard output                ===="
echo "====            and one or more files at the same time         ===="
echo "==================================================================="
echo df
echo pipe output to tee disk_usage.txt
df -h | tee disk_usage.txt
echo
echo
echo


