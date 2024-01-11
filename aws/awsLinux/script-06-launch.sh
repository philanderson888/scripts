#!/bin/sh

instance_public_ip=$(aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)
echo instance public ip is $instance_public_ip
userName=ec2-user
ip=$instance_public_ip
sshLoginUsername=$userName@$ip
certificatePath='~/.ssh/alpine.pem'

cd ~/github/scripts/aws/awsLinux
echo
echo        
echo
echo
echo copying script-06-server.js to remote server
scp -i $certificatePath script-06-server.js $sshLoginUsername:~
echo

echo ===================================================================
echo ==================   running node web server  =====================
echo ===================================================================
echo running script-06-run-node-web-server.sh
ssh -i $certificatePath $sshLoginUsername 'bash -s' < script-06-run-node-web-server.sh
echo
echo 
echo
dt=$(date '+%d/%m/%Y %H:%M:%S');
echo script 06 complete at 
echo $dt 

