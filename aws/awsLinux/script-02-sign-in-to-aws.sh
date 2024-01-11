# download and install aws cli
# ./install-aws-linux-cli.sh

# copy aws config file to ~/.aws
echo 
if cp -f aws/config ~/.aws/config; then
    echo copy aws/config to ~/.aws/config - success
else
    echo copy aws/config to ~/.aws/config - failure
fi


# copy ssh config file to ~/.ssh
echo 
if cp -f ssh/config ~/.ssh/config; then
    echo copy ssh/config to ~/.ssh/config - success
else
    echo copy ssh/config to ~/.ssh/config - failure
fi



# sign in to aws cli
aws sso login



echo
echo
echo printing out access token from aws sso cache
echo
cat ~/.aws/sso/cache/*.*

echo
echo
echo printing out list of accounts for given sign in token
aws sso list-accounts --access-token "aoaAA..."
