echo create new ec2 instance of ubuntu linux
echo
echo
echo
awsInstanceTemplatePath=file://script-03-spin-up-aws-instance-05-ubuntu-linux.json
echo template used is $awsInstanceTemplatePath
echo
echo
echo
aws ec2 run-instances --cli-input-json $awsInstanceTemplatePath
