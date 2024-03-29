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
echo "==============================================================="
echo "====                        install node   1                         ===="
echo "==============================================================="
startTime=$(date +%s)
ssh -i $certificatePath $sshLoginUsername 'bash -s' < script-08-install-and-run-node-express-web-server.sh
echo
echo 
echo
endTime=$(date +%s)
scriptDuration=$(($endTime-$startTime))1
echo "==============================================================="
echo "====                    install node completed                       ===="
echo "====                        $scriptDuration seconds                         ===="
echo "==============================================================="
