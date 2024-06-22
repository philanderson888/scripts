#!/bin/zsh
zsh
echo
echo
echo
echo cd ~
cd ~
echo
echo
echo
echo mkdir go
mkdir go
echo
echo
echom mv script-34.go go
mv script-34.go go
echo
echo
echo
echo cd go
cd go
echo
echo
echo 
echo "======================================================================="
echo "====                        install go 34-015"
echo "======================================================================="
#echo install go using wget on linux
#wget --quiet -O - https://git.io/vQhTU -o /dev/null | bash
echo
echo
echo
echo install go using curl on mac
curl -L https://git.io/vQhTU | bash
if [[ $(command -v go) ]]; then
    echo
    echo
    echo
    echo source bashrc
    source /home/azureuser/.bashrc
    echo "======================================================================="
    echo "====                        add go to PATH                         ===="
    echo "======================================================================="
    export PATH=$PATH:/usr/local/go/bin
    source /home/azureuser/.bashrc
    echo
    echo
    echo
    echo golang is installed
    echo
    echo
    echo
    echo "======================================================================="
    echo "====                        go version                             ===="
    echo "======================================================================="
    go version
    echo "======================================================================="
    echo "====                     run   go version                          ===="
    echo "======================================================================="
    echo now can run the script-34.go file by calling it with the go command
    go run ./script-34.go
    echo
    echo
    echo
    echo go build script-34.go will build hello-world file
    go build ./script-34.go
    if [ -f ./script-34 ]; then
        echo now execute script 34
        ./script-34
    fi
    echo "======================================================================="
    echo "====      upgrade ulimit so can log in with another shell          ===="
    echo "======================================================================="
    sudo bash ulimit -n 1000000
    sleep 1
    echo "======================================================================="
    echo "====                spawn another shell 034200                     ===="
    echo "======================================================================="
    ssh -T localhost
    echo hello from a new shell 1
    echo ls
    ls
    go version
    echo
    echo
    echo
    ssh -tt
    echo hello from a new shell 2
    echo ls
    ls
    go version
else
    echo
    echo
    echo
    echo go is not installed
    echo
    echo
    echo
fi