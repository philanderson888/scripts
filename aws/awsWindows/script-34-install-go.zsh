echo "======================================================================="
echo "====                             install go 2                               ===="
echo "======================================================================="
ls
ls -lah
echo install go using wget on linux
wget --no-verbose -O - https://git.io/vQhTU | bash
echo install go using curl on mac
curl -L https://git.io/vQhTU | bash
echo "======================================================================="
echo "====                          add go to PATH                               ===="
echo "======================================================================="
export PATH=$PATH:/usr/local/go/bin
source /home/azureuser/.bashrc
echo "======================================================================="
echo "====                             go version                                ===="
echo "======================================================================="
go version
echo "======================================================================="
echo "====                          run   go version                                ===="
echo "======================================================================="
echo list files in home directory
ls
echo move to go folder
mv ./script-34-go ./go
cd ./go
go run ./script-34.go
echo go build script-34.go will build hello-world file
go build ./script-34.go
ls
./hello-world
echo go install path-to-file
go install ./script-34.go
