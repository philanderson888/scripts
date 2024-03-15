echo "======================================================="
echo "===== powershell script running on windows server ====="
echo "======================================================="

# aws cli for windows

## install aws cli for windows powershell

# Install-Module -Name AWS.Tools.Installer


# check powershell installed and running (well ... it's a windows server ... duh !)
$PSVersionTable.PSVersion

# check for admin rights ... well ... logging in to admin session ... duh !
(New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
# true

# check ssh installed
Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'

echo "start ssh service"
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
echo " "
echo " "
echo " "
echo "check sshd service is running"
Get-Service "sshd"
echo " "
echo " "
echo " "
echo "open firewall to allow ssh"
if (!(Get-NetFirewallRule -Name "OpenSSH-Server-In-TCP" -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {
    Write-Output "Firewall Rule 'OpenSSH-Server-In-TCP' does not exist, creating it..."
    New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
} else {
    Write-Output "ssh firewall rule 'OpenSSH-Server-In-TCP' already exists"
}
echo " "
echo " "
echo " "
echo "======================================================="
echo "========          environment variables        ========"
echo "======================================================="
Get-ChildItem env:
echo " "
echo " "
echo " "
echo "setting ssh config parameters"
cd $env:ProgramData
cd ssh
New-Item -Name "sshd_config" -ItemType File
echo "PasswordAuthentication yes" >> sshd_config
echo "PubkeyAuthentication yes" >> sshd_config
echo " "
echo " "
echo " "
echo "sshd config file now holds ..."
cat sshd_config
echo "one private ssh key reads"
cat .\ssh_host_dsa_key

echo "restart sshd to take the new changes into account"
Restart-Service sshd
echo "server should now accept ssh authentication requests via private key"
echo " "
echo " "
echo " "
echo "============================================================="
echo "=====   end powershell script running on windows server ====="
echo "============================================================="
