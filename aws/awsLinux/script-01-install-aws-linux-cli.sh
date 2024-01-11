# download aws cli
echo downloading aws cli
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
echo installing aws cli
sudo installer -pkg ./AWSCLIV2.pkg -target /
# verify aws cli install
echo verifying aws cli install
echo aws installer path at ... 
which aws
#/usr/local/bin/aws
echo aws version ...
aws --version
# aws-cli/2.10.0 Python/3.11.2 Darwin/18.7.0 botocore/2.4.5