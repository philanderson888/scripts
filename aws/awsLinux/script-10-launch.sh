#!/bin/sh

instance_public_ip=$(aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)
echo instance public ip is $instance_public_ip
userName=ec2-user
ip=$instance_public_ip
sshLoginUsername=$userName@$ip
certificatePath='~/.ssh/alpine.pem'


workingDirectory='~/github/scripts/aws/awsLinux'
library=vue
scriptPath='script-10-run-vue-web-server.sh'

echo '\n\n\n\n'
cd $workingDirectory
echo running $scriptPath
startTime=$(date +%s)
ssh -i $certificatePath $sshLoginUsername 'bash -s' < $scriptPath

echo '\n\n\n'
endTime=$(date +%s)
scriptDuration=$(($endTime-$startTime))
echo $library web server launched in $scriptDudration seconds
