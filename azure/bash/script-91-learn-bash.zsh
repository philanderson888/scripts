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
echo "apt is an updated form of apt-get"
echo "apt-get released 1998"
echo "apt released 2014"
echo "apt search .. searches for all apt distributions containing that name"
echo "apt search ansible"
apt search ansible
apt-cache search ansible
echo "==================================================================="
echo "====                     array length                          ===="
echo "==================================================================="
fruits_array=("apple" "banana" "cherry")
echo "fruits array has length ${#fruits_array[@]}"
echo "==================================================================="
echo "====                    array printing                         ===="
echo "==================================================================="
fruits_array=("apple" "banana" "cherry")
printf '%s\n' "${fruits_array[@]}"
echo "==================================================================="
echo "====                    array for each                         ===="
echo "==================================================================="
fruits_array=("apple" "banana" "cherry")
for fruit in "${!fruits_array[@]}"
do
    fruit_name=${resource_group_names[$fruit]}
    echo fruit is $fruit also known as $fruit_name
done
echo "==================================================================="
echo "====                    df disk free                           ===="
echo "==================================================================="
echo df
echo pipe output to tee disk_usage.txt
df -h | tee disk_usage.txt
echo "==================================================================="
echo "====                      export                               ===="
echo "==================================================================="
echo export command will add a variable to the list of environment variables
echo this list of environment variables is available to this shell and to all child shells until machine reboot
echo so its a good way of passing on variables if multiple shells are going to be spawned
echo this is why the environment variables are exported at login in the .bashrc shell
echo export command by itself shows all exported variables
echo export
export
echo
echo
echo
echo export -p shows variables exported on current shell only
export -p
echo
echo
echo
echo export phil_variable=22
export phil_variable=22
echo
echo
echo
echo bash
bash
echo phil_variable
phil_variable
echo
echo
echo
echo can also just export the variable
echo export phil_variable
export phil_variable
echo
echo bash
bash
echo 
echo phil_variable
phil_variable
echo
echo
echo
echo export functions as well which can be super handy using the -f flag
phil_function() {
    echo this is phil function and its exported to environment variables as well
    echo this function can be called from any shell or sub shell of this one
}
export -f phil_function
echo
echo
echo
echo invoke bash shell
bash
echo
echo
echo
echo now call the phil_function
phil_function
echo "==================================================================="
echo "====                       for loop                            ===="
echo "==================================================================="
for i in {1..5}
do
   echo "for loop counter is $i"
done
echo "==================================================================="
echo "====                    for each loop                          ===="
echo "==================================================================="
for w in word1 word2 word3
do
  echo "for each loop prints every word ... $w"
done
echo "==================================================================="
echo "====                 for each over array                       ===="
echo "==================================================================="
fruits_array=("apple" "banana" "cherry")
for fruit in "${!fruits_array[@]}"
do
    fruit_name=${resource_group_names[$fruit]}
    echo fruit is $fruit also known as $fruit_name
done
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
echo "=============================================================="
echo "====                   jq  array                          ===="
echo "=============================================================="
sleep 2
echo create json from string literal
sleep 2
json01=$(jq -s '.' <<< '{ "a": 1 } { "b": 2 }')
echo $json01 | jq
sleep 2
echo
echo
echo import json from a file
sleep 2
json02=$(jq '.' < tmp.json)
echo $json02 | jq
sleep 2
echo
echo
echo create a json array from string literal
jq -s '.' <<< '{ "a": "mighty man" } { "b": "sole player" }'
sleep 2
echo
echo
echo
echo create json array from file
jq '.' < tmp2.json
sleep 2
echo
echo
echo
echo create json array with one object from variables
sleep 2
json03data="here is some data"
json03=$(jq -s '.' <<< '
    { 
        "d": "'"$json03data"'"
    }'
)
echo $json03 | jq
sleep 2
echo
echo
echo add to json array
sleep 2
json01=$(echo $json01 | jq '. += 
    [
        { 
            "c": 3
        }
    ]
')
echo $json01 | jq
sleep 2
echo
echo
echo
echo add to json array with spaces in strings
sleep 2
json02=$(
    echo $json02 | jq '. += 
    [
        {  
            "name": "Phil Anderson",  
            "email": "phil@company.com" 
        }
    ]'
)
echo $json02 | jq
sleep 2
echo
echo
echo add to json array with variables
sleep 2
json01data=15
json01=$(echo $json01 | jq '. += 
    [
        { 
            "d": "'"$json01data"'"
        }
    ]
')
echo $json01 | jq
sleep 2
echo
echo
echo add to json array using variables with spaces
sleep 2
json02data_name="Rob Walsh"
json02data_email="rob@walshconstruction.com"
json02=$(
    echo $json02 | jq '. += 
    [
        {  
            "name": "'"$json02data_name"'",
            "email": "'"$json02data_email"'"
        }
    ]'
)
echo $json02 | jq
sleep 2
echo
echo
echo now extract data from json
sleep 2
echo lets start with just one single json object, not an array
sleep 2
echo
echo
echo get all the names
sleep 2
echo $json02 | jq -r '.[].name'
echo
echo
echo get all the emails
sleep 2
echo $json02 | jq -r '.[].email'
sleep 2
echo
echo
echo can I now just get an individual field from an individual item within the array
echo
echo
loop_counter=-1
echo $json02 | jq -c '.[]' | while read i; do
    echo
    loop_counter=$(( loop_counter + 1 ))
    echo array index $loop_counter
    echo $i | jq -c '.[]' | while read j; do
        j="${j#\"}"
        j="${j%\"}"
        echo $j
    done
done
sleep 2
echo
echo
echo
echo ok i have created arrays of json objects
sleep 1
echo and i have pushed data to them also
sleep 1
echo using variable data and not just string literal fixed data
sleep 1
echo happy days
sleep 1
echo
echo
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
ps -ef | grep 'node script-25-server.js'
ps aux | grep 'node script-25-server.js'
echo "==================================================================="
echo "====                        script                             ===="
echo "==================================================================="
echo this command stops the script and opens a new interactive window
echo so dont actually run it now ... or it will stop the script ...
echo script /dev/null
#script /dev/null
echo "==================================================================="
echo "====                        shell                              ===="
echo "==================================================================="
echo SHELL gives the default shell name but not necessarily the current shell name
echo $SHELL
echo
echo
echo
echo 0 gives the current shell name
echo $0
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
sleep 1
echo loop over regular array
echo
echo
echo
json02=$(jq '.' < tmp.json)
echo $json02 | jq
json02=$(
    echo $json02 | jq '. += 
    [
        {  
            "name": "Phil Anderson",  
            "email": "phil@company.com" 
        }
    ]'
)
echo $json02 | jq
echo
echo
echo
loop_counter=-1
echo $json02 | jq -c '.[]' | while read i; do
    echo
    loop_counter=$(( loop_counter + 1 ))
    echo array index $loop_counter
    echo $i | jq -c '.[]' | while read j; do
        j="${j#\"}"
        j="${j%\"}"
        echo $j
    done
done
