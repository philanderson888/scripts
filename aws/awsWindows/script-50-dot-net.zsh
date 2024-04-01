wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update -y
sudo apt-get install dotnet-sdk-8.0 -y
sudo apt-get update -y
sudo apt-get install aspnetcore-runtime-8.0 -y
sudo apt-get update -y
sudo apt-get upgrade -y
mkdir dotNet
cd dotNet
dotnet new console --framework net8.0 --use-program-main
dotnet run