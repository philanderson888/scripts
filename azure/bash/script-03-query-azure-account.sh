echo "============================================================="
echo "====                  azure status                       ===="
echo "============================================================="
echo azure logged in account is ...
az account show --query "user.name" --output tsv
echo
echo
echo
echo "============================================================="
echo "====                 azure account list                  ===="
echo "============================================================="
az account list --query "[].{name:name, cloudName:cloudName, subscriptionId:subscriptionId, tenantId:tenantId}" --output table
echo
echo
echo