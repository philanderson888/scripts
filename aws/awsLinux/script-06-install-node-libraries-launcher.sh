#!/bin/sh

echo =======================================================
echo ============== installing node libraries ==============
echo =======================================================

startTime=$(date +%s)
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

echo install all node libraries
ssh -i $certificatePath $sshLoginUsername 'bash -s' < script-06-install-node-libraries-script.sh

endTime=$(date +%s)
duration=$((endTime-startTime))
echo installing all node libraries took $duration seconds