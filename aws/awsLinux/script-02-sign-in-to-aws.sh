# download and install aws cli
# ./install-aws-linux-cli.sh

# echo install jq json parser
# brew install jq

echo
echo copy aws config file to ~/.aws
if cp -f aws/config ~/.aws/config; then
    echo copy aws/config to ~/.aws/config - success
else
    echo copy aws/config to ~/.aws/config - failure
fi


echo
echo copy ssh config file to ~/.ssh
if cp -f ssh/config ~/.ssh/config; then
    echo copy ssh/config to ~/.ssh/config - success
else
    echo copy ssh/config to ~/.ssh/config - failure
fi


echo sign in to aws cli
aws sso login
echo aws configure sso also signs user in ...
# aws configure sso 



echo
echo
echo printing out all data in all files in aws sso cache
echo
cat ~/.aws/sso/cache/*.*


#Declaring variable
main_string='"Welcome to "LinuxSimply" website!"'

#Removing outermost quotes
updated_string="${main_string#\"}"
updated_string="${updated_string%\"}"

#Displaying the output
echo "Main string: $main_string"
echo "Updated string: $updated_string"



echo
echo 
echo 
echo printing out contents of files in in ~/.aws/sso/cache
awsCache=~/.aws/sso/cache/*
for jsonFile in $awsCache
  do 
    echo 
    echo 
    echo "Processing $jsonFile"
    echo 
    cat $jsonFile | jq

    if grep -q accessToken $jsonFile; then

      echo $jsonFile contains the string accessToken
      
      cat $jsonFile | jq .accessToken

      chmod 777 $jsonFile

      accessToken=$(cat $jsonFile | jq .accessToken)

      echo for some reason jq is returning the string including the double quotes ... just stripping them out here ... 
      accessTokenWithoutQuotes="${accessToken#\"}"
      accessTokenWithoutQuotes="${accessTokenWithoutQuotes%\"}"

      echo access token is ...
      echo $accessToken
      echo $accessTokenWithoutQuotes

    fi
    
done




echo
echo
echo printing out list of accounts
aws sso list-accounts --access-token $accessToken
aws sso list-accounts --access-token $accessTokenWithoutQuotes
