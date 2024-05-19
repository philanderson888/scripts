#!/bin/sh
printHeading "====                  run express 26"
ssh -i $ssh_key $admin_username@$public_ip_address 'zsh -s' < ../awsWindows/script-26-run-express-01.zsh
