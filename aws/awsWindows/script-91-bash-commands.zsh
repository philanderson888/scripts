#!/bin/zsh
echo zsh
zsh
echo cd ~
cd ~
echo "==================================================================="
echo "==================================================================="
echo "====                     bash commands                         ===="
echo "==================================================================="
echo "==================================================================="
echo "==================================================================="
echo "====                          apt                              ===="
echo "==================================================================="
echo apt is an updated form of apt-get
echo apt-get released 1998
echo apt released 2014
echo apt search ... searches for all apt distributions containing that name
echo apt search ansible
apt search ansible
echo "==================================================================="
echo "====                    df disk free                           ===="
echo "==================================================================="
echo df
echo pipe output to tee disk_usage.txt
df -h | tee disk_usage.txt
echo "==================================================================="
echo "====                   json with bash                          ===="
echo "==================================================================="
BUCKET_NAME="test bucket"
OBJECT_NAME="testworkflow-2.0.1.jar"
TARGET_LOCATION="/opt/test/testworkflow-2.0.1.jar"
JSON_STRING='{"bucketname":"'"$BUCKET_NAME"'","objectname":"'"$OBJECT_NAME"'","targetlocation":"'"$TARGET_LOCATION"'"}'
echo echo object using bash
echo $JSON_STRING
echo
echo
echo
echo echo object using jq
echo "${JSON_STRING}" | jq
echo "==================================================================="
echo "====                    jo json object                         ===="
echo "==================================================================="
jo test=1 test2=hello test3="some data" test4=$(jo test5=10 test6=hello test7="some_data")
echo
echo
echo
echo create json from string literal
json01=$(jo test=1 test2=hello test3="some data" test4=$(jo test5=10 test6=hello test7="some_data"))
echo
echo
echo
echo echo json raw
echo $json01
echo
echo
echo
echo echo json with jq
echo $json01 | jq
echo
echo
echo
echo jo using variables
test1data=1
test2data=hello
test3data="some data"
json02=$(jo test="$test1data" test2="$test2data" test3="$test3data" test4=$(jo test5=10 test6=hello test7="some_data"))
echo
echo
echo
echo echo json
echo $json02 | jq
echo "==================================================================="
echo "====                      jq  array                            ===="
echo "==================================================================="
echo create an array from object strings in jq
jq -s '.' <<< '{ "a": 1 } { "b": 2 }'
echo
echo
echo
echo import a json array using jq
jq -s '.' < tmp.json
echo
echo
echo
json01=$(jq -s '.' <<< '{ "a": 1 } { "b": 2 }')
echo json01
echo $json01 | jq
echo
echo
echo
json02=$(jq -s '.' < tmp.json)
echo json02
echo $json02 | jq
echo
echo
echo

echo
echo
echo
echo create an array from object strings in jq
jq -s '.' <<< '{ "a": "mighty man" } { "b": "sole player" }'
echo
echo
echo
echo import a json array using jq
jq -s '.' < tmp2.json
echo "==================================================================="
echo "====                  jq  string literal                       ===="
echo "==================================================================="
echo '{"fruit":{"name":"apple","color":"green","price":1.20}}' | jq '.'
echo "==================================================================="
echo "====                      jq from file                         ===="
echo "==================================================================="
echo '{"fruit":{"name":"apple","color":"green","price":1.20}}' > json-01-test-data.json
jq  '.' json-01-test-data.json
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


