echo querying running instance to get ip for ssh login

instance_public_ip=$(aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)
echo instance public ip is $instance_public_ip

userName=ec2-user
ip=$instance_public_ip
sshLoginUsername=$userName@$ip
certificatePath='~/.ssh/alpine.pem'

echo signing in to $ip with user $sshLoginUsername ...
ssh -i ~/.ssh/alpine.pem $sshLoginUsername

echo check which web servers are running locally

echo apache web server on port 80
curl localhost -s

echo server 06 node     
curl localhost:3006 -s

echo server 07 bun
curl localhost:3007 -s

echo server 08 express 08
curl localhost:3008 -s
