#!/bin/sh

# echo installing aws
#./script-01-install-aws-linux-cli.sh 

#echo script 2 ..
#echo ... b ... prints out ssh confit
#echo ... c ... logs in to aws
#echo ... a ... prints out aws config
#echo ... d ... prints out access token
#./script-02-sign-in-to-aws.sh
#sleep 10 

clear


workingDirectory=~/github/scripts/aws/awsLinux
cd $workingDirectory




terminating_old_instance=false
terminating_old_instance=true

if [ "$terminating_old_instance" = true ] ; then
    echo ====================================================
    echo ============ terminating running instances =========
    echo ====================================================
    dt=$(date '+%d/%m/%Y %H:%M:%S');
    echo $dt 
    echo terminating instance now ...
    ./script-99-terminate-aws-instances.sh
fi






create_new_instance=false
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









echo ================================================
echo ============     get public ip         =========
echo ================================================

instance_public_ip=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)

echo instance public ip is $instance_public_ip
echo '\n\n\n\n\n\n\n\n\n\n'











query_aws=false
if [ "$query_aws" = true ] ; then
    echo ======================================================
    echo =============== query ec2 instances  =================
    echo ======================================================
    ./script-04-query-aws.sh
    echo '\n\n\n\n\n\n\n\n\n\n'
fi


query_linux=true
if [ "$query_linux" = true ] ; then
    echo ==========================================================
    echo =============== upgrade and query linux  =================
    echo ==========================================================
    ./script-04-query-linux.sh
    echo '\n\n\n\n\n\n\n\n\n\n'
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
echo next : install node, express, vue, bun then run the web servers




echo ===========================================================
echo =============== install node libraries    =================
echo ===========================================================
./script-06-install-node-libraries-launcher.sh

echo
echo
echo ===========================================================
echo ===============       status update       =================
echo ===========================================================
echo linux os updated to latest ✓
echo apache, node, git, express, bun, vue installed ✓
echo apache running port 80 ✓	
echo next ... run web servers ...
echo
echo
echo
echo 






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
echo ===============       testing - no testing done        =================
echo ========================================================================
#echo now test out the servers using local ip address
#ssh -i $certificatePath $sshLoginUsername 'bash -s' < test-web-servers-from-ec2-instance.sh
#echo now test out the servers using external ip address
#./test-servers.sh



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
echo
echo
echo after 1 minute the instance will be terminated
echo terminating instance now ...
read proceed
./script-99-terminate-aws-instances.sh
echo instance has been terminated ...
echo
echo
echo end of scriptMaster
echo finish ...
