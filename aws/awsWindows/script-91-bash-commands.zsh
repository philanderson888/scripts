#!/bin/zsh
zsh
cd ./.oh-my-zsh
zsh
cd ~
echo
echo
echo
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
echo "====                   pid process id                          ===="
echo "==================================================================="
echo ... get the process id
pidof node
echo "==================================================================="
echo "====                     ps process                            ===="
echo "==================================================================="
echo check if server is already running
ps -ef | grep 'node script-41-server.js'
ps aux | grep 'node script-41-server.js'
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


