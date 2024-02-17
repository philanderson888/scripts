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
echo copying bun server to remote server
scp -i $certificatePath bunServer.tsx $sshLoginUsername:~
echo running script-07-install-and-run-bun-web-server.sh
ssh -i $certificatePath $sshLoginUsername 'bash -s' < script-07-install-and-run-bun-web-server.sh
echo
echo
dt=$(date '+%d/%m/%Y %H:%M:%S');
echo script 07 install and run bun web server - complete at timestamp $dt 
