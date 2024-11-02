# taken from https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.4

# Update the list of packages
sudo apt-get update

# Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https software-properties-common

# Get the version of Ubuntu
source /etc/os-release

# Download the Microsoft repository keys
wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb

# Register the Microsoft repository keys
sudo dpkg -i packages-microsoft-prod.deb

# Delete the Microsoft repository keys file
rm packages-microsoft-prod.deb

# Update the list of packages after we added packages.microsoft.com
sudo apt-get update

###################################
# Install PowerShell
sudo apt-get install -y powershell

# Start PowerShell
pwsh

echo "hello from the world of github scripting"
echo "this is my first ever github cicd pipeline script"
echo "run using github actions"
echo "happy days"
echo "using powershell on linux"
echo "checking it is all working ... running Get-Command"
Get-Command -Name Get-Command
pwsh -Command {Get-Command -Name Get-Command}
echo " "
echo "Get-Process"
pwsh -Command {Get-Process}
echo " "
echo "Get-Service"
pwsh -Command {Get-Service}
echo " "
echo "Get-Date"
pwsh -Command {Get-Date}
echo " "
echo "Get-Location"
pwsh -Command {Get-Location}
echo " "
echo " "
echo "now lets try running a powershell script file"
/powershell/hello-world.ps1
echo " "
echo "... all working ... happy days ... exiting powershell"
exit

# End of script