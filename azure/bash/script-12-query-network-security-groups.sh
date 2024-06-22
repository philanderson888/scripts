echo "====================================================================="
echo "====               query network security group                  ===="
echo "====        output sent to ./output-network-security-group.txt   ===="
echo "====================================================================="
echo "=======================================================================" >> output-network-security-group.txt
echo "====                            windows server json provisioning      =============" >> output-network-security-group.txt
echo "=======================================================================" >> output-network-security-group.txt
cat ./networkSecurityGroupJsonProvision.json >> output-network-security-group.txt
query_network_security_group=true
