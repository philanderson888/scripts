echo cccc
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ./script-41-run-node.zsh
echo ddd