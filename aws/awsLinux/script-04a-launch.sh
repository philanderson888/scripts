#!/bin/sh

instance_public_ip=$(aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)
userName=ec2-user
sshLoginUsername=$userName@$instance_public_ip
certificatePath='~/.ssh/alpine.pem'

cd ~/github/scripts/aws/awsLinux
ssh -i $certificatePath $sshLoginUsername 'bash -s' < script-04a-query-linux.sh
echo
