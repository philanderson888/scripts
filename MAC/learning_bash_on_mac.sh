echo
echo
echo
echo
echo
echo
echo "======================================================================="
echo "======================================================================="
echo "======================================================================="
echo "====                                learning bash             =============
echo "======================================================================="
echo "======================================================================="
echo "======================================================================="
echo
echo
echo
echo
echo
echo
echo setting variables
adding_numbers=true
parsing_numbers=true
echo
echo
echo
if [ "$adding_numbers" = true ] ; then
    echo
    echo
    echo
    echo "======================================================================="
    echo "====                            parse a number from end of a string           =============
    echo "====                                    increment the number                  =============
    echo "====                            make sure the number has two digits   eg 05   =============
    echo "======================================================================="
    resource_group_prefix=ResourceGroup
    resource_group_index=05
    resource_group_name=$resource_group_prefix$resource_group_index
    resource_group_index=grep -Eo '[0-9]+$'
    echo existing resource group $resource_group_name has index $resource_group_index
    resource_group_index="$((resource_group_index + 1))"
    resource_group_index=$(printf "%02d" $resource_group_index)
    echo new resource group index = $resource_group_index
    resource_group_name=$resource_group_prefix$resource_group_index
    echo new resource group name is $resource_group_name
fi
echo
echo
echo
if [ "$parsing_numbers" = true ] ; then
    echo
    echo
    echo
    echo "======================================================================="
    echo "====                            parse a number from end of a string           =============
    echo "====                                    increment the number                  =============
    echo "====                            make sure the number has two digits   eg 05   =============
    echo "======================================================================="
    resource_group_prefix=ResourceGroup
    resource_group_index=05
    resource_group_name=$resource_group_prefix$resource_group_index
    resource_group_index=grep -Eo '[0-9]+$'
    echo existing resource group $resource_group_name has index $resource_group_index
    resource_group_index="$((resource_group_index + 1))"
    resource_group_index=$(printf "%02d" $resource_group_index)
    echo new resource group index = $resource_group_index
    resource_group_name=$resource_group_prefix$resource_group_index
    echo new resource group name is $resource_group_name
fi
