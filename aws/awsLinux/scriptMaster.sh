#!/bin/sh

startTimeOnMasterScript=$(date +%s)


installing_aws_cli=false
if [ "$installing_aws_cli" = true ] ; then
    echo ================================================================
    echo ============     script 01 - installing aws cli     ============
    echo ================================================================
    dt=$(date '+%d/%m/%Y %H:%M:%S');
    echo ... at timestamp ... $dt 
    ./script-01-install-aws-linux-cli.sh
    read -p "... linux cli installed ... press any key to continue ..."
else
    echo =======================================================================
    echo ============     script 01 - installing aws cli - skipped  ============
    echo =======================================================================
fi



sign_in_to_aws=false
if [ "$sign_in_to_aws" = true ] ; then
    echo ================================================================
    echo ============     script 02 - sign in to aws         ============
    echo ================================================================
    dt=$(date '+%d/%m/%Y %H:%M:%S');
    echo ... at timestamp ... $dt 
    echo ... a ... prints out aws config
    echo ... b ... prints out ssh config
    echo ... c ... logs in to aws
    echo ... d ... prints out access token
    ./script-02-sign-in-to-aws.sh
    sleepTime=1
    echo sleep $sleepTime second ...
    sleep $sleepTime 
    read -p "... linux cli installed ... press any key to continue ..."
else
    echo ===================================================================
    echo ============ script 02 - sign in to aws  - skipped     ============
    echo ===================================================================
fi





clear
workingDirectory=~/github/scripts/aws/awsLinux
cd $workingDirectory




terminating_old_instance=true
if [ "$terminating_old_instance" = true ] ; then
    echo ================================================================
    echo ============ script 99 - terminating running instances =========
    echo ================================================================
    dt=$(date '+%d/%m/%Y %H:%M:%S');
    echo $dt 
    echo terminating instance now ...
    ./script-99-terminate-aws-instances.sh
fi



currentTimeOnMasterScript=$(date +%s)
timeToDeleteOldInstances=$(($currentTimeOnMasterScript-$startTimeOnMasterScript))
echo "old instances finished terminating at master script elapsed time $timeToDeleteOldInstances"

#read -p " press any key to continue .."

echo 
echo 
echo 
echo 
echo 
echo 





create_new_instance=true

if [ "$create_new_instance" = true ] ; then
    echo ====================================================
    echo =============== spin up new instance ===============
    echo ====================================================
    dt=$(date '+%H:%M:%S');
    echo spinning up new instance at $dt
    ./script-03-spin-up-aws-instance.sh
    pauseAfterInstanceCreation=45
    echo aws instance created - pause for $pauseAfterInstanceCreation seconds to allow it fully to come online ...
    sleep $pauseAfterInstanceCreation
    echo aws instance is now online
    echo '\n\n\n\n\n\n\n\n\n\n'
fi




currentTimeOnMasterScript=$(date +%s)
timeToCreateNewInstance=$(($currentTimeOnMasterScript-$startTimeOnMasterScript))
echo time to delete old instances ... $timeToDeleteOldInstances
echo "new instances finished being created at master script elapsed time $timeToCreateNewInstance"



#read -p " press any key to continue .."


echo ================================================
echo ============     get public ip         =========
echo ================================================

instance_public_ip=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)

echo instance public ip is $instance_public_ip
echo note this version of the echo command works on mac but not on linux ... echo \n\n\n
echo '\n\n\n\n'











query_aws=false
if [ "$query_aws" = true ] ; then
    echo ==================================================================
    echo =============== script 04 - query ec2 instances  =================
    echo ==================================================================
    ./script-04-query-aws.sh
    echo '\n\n\n\n'
fi






query_linux=true
if [ "$query_linux" = true ] ; then
    echo ======================================================================
    echo =============== script 04 - upgrade and query linux  =================
    echo =============== note - failing to run 'sudo' command ... =============
    echo ======================================================================
    ./script-04a-query-linux.sh
    echo '\n\n\n\n'
fi




echo ====================================================================
echo =============== install and run apache web server  =================
echo ====================================================================
./script-05-launch.sh


echo
echo
echo ===========================================================
echo ===============       status update       =================
echo ===========================================================
echo linux os updated to latest ✓
echo apache web server installed and running on port 80 ✓	
currentTimeOnMasterScript=$(date +%s)
currentScriptDuration=$(($currentTimeOnMasterScript-$startTimeOnMasterScript))
echo "apache web server install finished and running on port 80 at elapsed time $currentScriptDuration"
echo next : install node, express, vue, bun then run the web servers
echo 
echo 
echo 
sleep 15
echo 
echo 
echo 
echo =========================================================================
echo =================== install node, vue, bun libraries    =================
echo =========================================================================
./script-06-install-node-libraries-launcher.sh
echo 
echo 
echo 
echo ===========================================================
echo ===============       status update       =================
echo ===========================================================
echo linux os updated to latest ✓
echo apache, node, git, express, bun, vue installed ✓
echo apache running port 80 ✓	
currentTimeOnMasterScript=$(date +%s)
currentScriptDuration=$(($currentTimeOnMasterScript-$startTimeOnMasterScript))
echo "node libraries installation finished at elapsed time $currentScriptDuration"
echo 
echo 
echo 
echo 
echo 
echo 
echo next ... run web servers ...
echo
echo
echo
echo 


sleep 15



echo ===========================================================
echo =============== run node web server       =================
echo ===========================================================
open -a Terminal ./script-06-launch.sh







echo ===========================================================
echo =============== run bun  web server       =================
echo ===========================================================
open -a Terminal ./script-07-launch.sh






#open -a Terminal ./script-08-launch.sh
#echo not running create react app as it takes too long
# echo running script-09-install-and-run-create-react-app.sh
# ssh -i $certificatePath $sshLoginUsername 'bash -s' < script-09-install-and-run-create-react-app.sh




echo =============================================================
echo ================== run vue web server  ======================
echo =============================================================

./script-10-launch-run-vue-web-server.sh



echo
echo
echo ===========================================================
echo ===============       status update       =================
echo ===========================================================
echo linux os updated to latest ✓
echo apache, node, git, express, bun, vue installed ✓
echo apache running port 80 ✓	
echo node, express, bun, vue web servers now running
echo
echo
echo
echo 





echo
echo
echo
echo ========================================================================
echo ===============       testing - from localhost         =================
echo ========================================================================
instance_public_ip=$(aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)
userName=ec2-user
sshLoginUsername=$userName@$instance_public_ip
certificatePath='~/.ssh/alpine.pem'
cd ~/github/scripts/aws/awsLinux
echo '\n\n\n'
echo running script to test web servers
ssh -i $certificatePath $sshLoginUsername 'bash -s' < test-web-servers-from-ec2-instance.sh



echo
echo
echo
echo ==========================================================================
echo ===============       testing - public ip and port       =================
echo ==========================================================================
./test-servers.sh



echo
echo
echo ===========================================================
echo ===============       status update       =================
echo ===========================================================
echo linux os updated to latest ✓
echo apache, node, git, express, bun, vue installed ✓
echo react not installed - too big ✗
echo apache running port 80 ✓
echo node, express, bun, vue web servers now running ✓
echo testing web servers using curl localhost - not done ✗	✘	✖	❌ ✕	
echo testing web servers using curl public ip - not done ✗	✘	✖	❌ ✕	
echo
echo ways to develop this script
echo 1 install the above web servers on different flavours of linux
echo     a amazon ec2 linux
echo     b ubuntu linux
echo     c centos linux
echo     d red hat linux
echo     e alpine linux ... mini distribution
echo 2 use docker to run all the same above servers ...
echo 3 use windows to run all the same above servers ...
echo 4 use kubernetes to install multiple copies of the same web server as a cluster?
echo 5 use yaml to build a web server to perform the same task
echo 6 develop use of networks on amazon - internal networks, internal firewalls and external networks and firewalls just so i become an expert in hiding and exposing the right ports
echo 7. sockets - can i install 2 linux instances and just open a socket between them
echo 8. metasploit - can i install this and do some network scans automatically
echo 9. can i install some exe or .sh on a machine and run it, by downloading remotely ? 
echo ...
echo 
echo 
echo 
echo after 1 minute the instance will be terminated

for timerCount in {1..60}
do
sleep 1
printf .
done

echo terminating instance now ...
./script-99-terminate-aws-instances.sh
echo instance has been terminated ...
echo
echo
echo end of scriptMaster
echo finish ...
