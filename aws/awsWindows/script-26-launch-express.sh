#!/bin/sh
printHeading "====                  run express"
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ../awsWindows/script-26-run-express.zsh
