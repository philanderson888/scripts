# install chocolatey
$url = "https://chocolatey.org/install.ps1"
$output = "install-chocolatey.ps1"
$start_time = Get-Date
Invoke-WebRequest -Uri $url -OutFile $output
./install-chocolatey.ps1
# install docker
choco install docker-desktop --pre /y
