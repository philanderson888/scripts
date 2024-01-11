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
echo running script-08-install-and-run-node-express-web-server.sh
startTime=$(date +%s)
ssh -i $certificatePath $sshLoginUsername 'bash -s' < script-08-install-and-run-node-express-web-server.sh
echo
echo 
echo
endTime=$(date +%s)
scriptDuration=$($endTime-$startTime)
echo "server 05 apache web server finished after $scriptDuration"
echo "server 08 apache web server finished after ${$scriptDuration}"
