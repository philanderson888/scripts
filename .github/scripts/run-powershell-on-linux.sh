# taken from https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.4
sudo apt-get update
sudo apt-get install -y wget apt-transport-https software-properties-common
# Get the version of Ubuntu
source /etc/os-release
wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y powershell

echo " "
echo "script to run powershell commands on linux ubuntu ... "

echo " "
echo "run powershell executable"
pwsh

echo " "
echo "pwsh -command 'echo hello from powershell'"
pwsh -command 'echo "hello from powershell"'

echo " "
echo "pwsh -command Get-Process"
pwsh -command Get-Process *cron*

echo " "
echo "pwsh -command Get-Date"
pwsh -command Get-Date

echo " "
echo "pwsh -command Get-Location"
pwsh -command Get-Location

echo " "
echo "now lets try running a powershell script file"
echo " "
echo pwd
pwd

echo " "
echo "cd powershell"
cd powershell
echo ls *hello*
ls *hello*

echo " "
echo "cat hello-world-01.ps1"
cat hello-world-01.ps1

echo " "
echo 1
chmod +x hello-world-01.ps1
echo "./hello-world.ps1"
./hello-world-01.ps1

echo " "
echo 2
pwsh -command hello-world-01.ps1

echo " "
echo 3
pwsh -command ./hello-world-01.ps1

echo " "
echo 4
pwsh hello-world-01.ps1

echo " "
echo 5
pwsh ./hello-world-01.ps1

echo " "
echo "... is it working???"
exit

# End of script