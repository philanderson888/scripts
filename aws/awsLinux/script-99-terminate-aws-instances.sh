echo instances to be terminated are listed here

aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].[InstanceId]" --output text

instance_id=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].[InstanceId]" --output text)

echo instance id to be terminated is
echo $instance_id

if [[ -z "$instance_id" ]]; then
    echo "No instances are running"
else
    echo "Instances are running so they must be terminated"
    echo terminating aws instances
    aws ec2 terminate-instances --instance-ids $instance_id
    echo instances have been terminated ... 
fi
