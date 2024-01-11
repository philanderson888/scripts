# --------- s3  ---------------
echo
echo
echo printing out list of s3 storage buckets
aws s3 ls

# --------- iam ---------------

echo 
echo
echo list iam users
aws iam list-users

echo 
echo
echo list iam access keys
aws iam list-access-keys

echo 
echo
echo iam list account aliases
aws iam list-account-aliases

echo 
echo
echo iam get account summary
#aws iam get-account-summary



aws iam list-groups


aws iam list-instance-profiles

aws iam list-mfa-devices

# aws iam list-policies

# aws iam list-roles

aws iam list-user-policies --user-name philanderson888-iam-user-02



# --------- ec2 ---------------

echo descripe ec2 security groupsq
# aws ec2 describe-security-groups

echo descrbe ec2 subnets
# aws ec2 describe-subnets 

echo 
echo
echo describe ec2 instances

# aws ec2 describe-instances 
echo describe ec2 running instances
aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].[InstanceId,State.Name,PublicIpAddress]"

# aws ec2 describe-instances
echo describe ec2 all instances
aws ec2 describe-instances --filters "Name=instance-type,Values=t2.micro" --query "Reservations[].Instances[].[InstanceId,State.Name,PublicIpAddress]"

# aws instance get instance id 
aws ec2 describe-instances --query 'Reservations[*].Instances[*].{Instance:InstanceId}' --output text

# aws assign instance id to variable
instance_id=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].{Instance:InstanceId}' --output text)
echo instance id obtained dynamically is $instance_id

instance_id=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query 'Reservations[*].Instances[*].{Instance:InstanceId}' --output text)


# aws instance get public ip
echo getting public ip address of our instance
aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[*].Instances[*].PublicIpAddress' --output text
instance_public_ip=$(aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)
echo instance public ip is $instance_public_ip

echo
echo
echo tag given ec2 instance with Name=MyInstance
aws ec2 create-tags --resources $instance_id --tags Key=Name,Value=MyInstance

echo
echo
echo list all tags in use
aws ec2 describe-tags 

echo
echo
echo list instances which are tagged with Name=MyInstance
aws ec2 describe-instances --filters "Name=tag:Name,Values=MyInstance" --query "Reservations[].Instances[].InstanceId"
