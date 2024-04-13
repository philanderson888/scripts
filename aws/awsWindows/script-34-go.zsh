#!/bin/bash
bash
echo "======================================================================="
echo "====                        install go "
echo "======================================================================="
echo list files
ls
echo
echo
echo
echo install go using wget on linux
wget --quiet -O - https://git.io/vQhTU -o /dev/null | bash

#echo install go using curl on mac
#curl -L https://git.io/vQhTU | bash
echo source bashrc
source /home/azureuser/.bashrc
echo "======================================================================="
echo "====                        add go to PATH                         ===="
echo "======================================================================="
export PATH=$PATH:/usr/local/go/bin
source /home/azureuser/.bashrc
echo "======================================================================="
echo "====                        go version                             ===="
echo "======================================================================="
go version
echo "======================================================================="
echo "====                     run   go version                          ===="
echo "======================================================================="
cd ~
echo move to go folder
mv script-34.go go
cd go
echo
echo
echo 
echo list files in go directory
ls
echo
echo
echo
echo now can run the script-34.go file by calling it with the go command
go run ./script-34.go
echo
echo
echo
echo go build script-34.go will build hello-world file
go build ./script-34.go
echo now can run the executable file called 'script-34'
./script-34


echo "======================================================================="
echo "====      upgrade ulimit so can log in with another shell          ===="
echo "======================================================================="
sudo bash ulimit -n 1000000
echo "======================================================================="
echo "====                      spawn another shell                      ===="
echo "======================================================================="
ssh -T localhost
echo hello from a new shell 1
echo ls
ls
go version



ssh -tt
echo hello from a new shell 2
echo ls
ls
go version
