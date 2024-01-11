#!/bin/sh

#echo installing aws
#./script-01-install-aws-linux-cli.sh 

#echo logging in to aws
./script-02-sign-in-to-aws.sh



clear



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
    echo aws instance is now online - lets query it
    echo '\n\n\n\n\n\n\n\n\n\n'
fi









echo ================================================
echo ============     get public ip         =========
echo ================================================

instance_id=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)

echo instance public ip is $instance_public_ip
echo '\n\n\n\n\n\n\n\n\n\n'











query_instances=false
if [ "$query_instances" = true ] ; then
    echo ======================================================
    echo =============== query ec2 instances  =================
    echo ======================================================
    cd ~/github/scripts/aws/awsLinux
    ./script-04-query-aws.sh
    ./script-04-query-linux.sh
    echo '\n\n\n\n\n\n\n\n\n\n'
fi






echo ====================================================================
echo =============== install and run apache web server  =================
echo ====================================================================
./script-05-launch.sh
# read proceed





echo ===========================================================
echo =============== install node libraries    =================
echo ===========================================================

./script-06-install-node-libraries-launcher.sh
# read proceed





echo ===========================================================
echo =============== run node web server       =================
echo ===========================================================

open -a Terminal ./script-06-launch.sh
# read proceed

echo ===========================================================
echo =============== run bun  web server       =================
echo ===========================================================

open -a Terminal ./script-07-launch.sh
read proceed



#open -a Terminal ./script-08-launch.sh
#echo not running create react app as it takes too long
# echo running script-09-install-and-run-create-react-app.sh
# ssh -i $certificatePath $sshLoginUsername 'bash -s' < script-09-install-and-run-create-react-app.sh
echo
echo
echo
#sleep 60
#echo now test out the servers using local ip address
#ssh -i $certificatePath $sshLoginUsername 'bash -s' < test-web-servers-from-ec2-instance.sh
#echo now test out the servers using external ip address
#./test-servers.sh
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
