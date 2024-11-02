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
pwsh -command 'echo hello from powershell'

echo " "
echo "pwsh -command Get-Command"
pwsn -command Get-Command *Get-Command*

echo " "
echo "pwsh -command Get-Process"
pwsh -command Get-Process *cron*

#echo " "
#echo "pwsh -command Get-Service"
#pwsh -command Get-Service

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
echo ls
ls

echo " "
echo "cd /github/workspace"
cd /github/workspace
echo ls
ls

echo " "
echo "cd /"
cd / 
echo ls
ls

echo " "
/powershell/hello-world.ps1
pwsh /powershell/hello-world.ps1
powershell /powershell/hello-world.ps1

echo " "
echo "... is it working???"
exit

# End of script