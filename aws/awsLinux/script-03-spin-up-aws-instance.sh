echo create new ec2 instance

aws ec2 run-instances --cli-input-json file://script-03-spin-up-aws-instance.json
