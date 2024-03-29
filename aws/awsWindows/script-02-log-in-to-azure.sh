if [ "$logging_in_to_azure_portal" = true ] ; then
    echo
    echo
    echo
    echo "======================================================================="
    echo "====                           logging in to azure portal     ============="
    echo "======================================================================="
    echo
    echo
    echo
    az login
    # [
    #  {
    #    "cloudName": "AzureCloud",
    #    "homeTenantId": "84db59c8-e4f2-4a8b-9c4a-2f6be457ceba",
    #    "isDefault": true,
    #    "id": "29a6dc31-f2c3-4caa-a935-2a7158618df5",
    #    "managedByTenants": [],
    #    "name": "Pay-As-You-Go",
    #    "state": "Enabled",
    #    "tenantId": "84db59c8-e4f2-4a8b-9c4a-2f6be457ceba",
    #    "user": {
    #      "name": "philanderson888@hotmail.com",
    #      "type": "user"
    #    }
    #  }
    #]
else
    echo "======================================================================="
    echo "====                          already logged in to azure portal        ============="
    echo "======================================================================="
fi
echo
echo
echo