# Clear-Host
echo " "
echo "========================================"
echo "========================================"
echo "========================================"
echo "             Powershell"
echo "========================================"
echo "========================================"
echo "========================================"
echo " "

echo " "
echo "========================================"
echo "========================================"
echo "        Section 1 - Learning"
echo "========================================"
echo "========================================"
echo " "


echo "========================================"
echo "              Install"
echo "========================================"
echo " "

# winget search Microsoft.Powershell
# winget install --id Microsoft.Powershell --source winget
# winget install --id Microsoft.Powershell.Preview --source winget


echo "========================================"
echo "               Version"
echo "========================================"

echo " "
echo "Get-Host ... shows host information"
echo "Get-Host | Format-List ... shows host information"
Get-Host | Format-List
echo "Get-Host | Format-Table ... shows host information"
echo "Get-Host | Get-Member ... shows host information"
echo "Get-Host | Get-Member -MemberType Property ... shows host information"
echo "Get-Host | Get-Member -MemberType Method ... shows host information"
echo "Get-Host | Get-Member -MemberType Event ... shows host information"
echo "Get-Host | Get-Member -MemberType ScriptProperty ... shows host information"
echo "Get-Host | Get-Member -MemberType ScriptMethod ... shows host information"

echo " "
echo "echo ps version table ... shows powershell version"
echo $PSVersionTable



echo " "
echo "========================================"
echo "           Executing Scripts"
echo "========================================"

echo " "
echo "Execution Policy"
echo "Get-ExecutionPolicy ... shows current execution policy"
echo "Set-ExecutionPolicy -ExecutionPolicy <policy> ... sets execution policy"
echo "Bypass ... allows all scripts to run"
echo "Unrestricted ... allows all scripts to run"
echo "RemoteSigned ... allows local scripts to run and signed scripts from internet"
echo "Restricted ... does not allow any scripts to run"
echo "AllSigned ... allows only signed scripts to run"

echo " "
echo "running scripts"
echo ".\script.ps1 ... runs script in current directory"
echo "script.ps1 ... runs script in current directory"
echo "C:\path\script.ps1 ... runs script in specified directory"

echo " "
echo "to simplify matters create a c:\scripts directory and add it to the path"





echo " "
echo "========================================"
echo "             List Files"
echo "========================================"

echo "Get-ChildItem -recurse | Format-Table ... also can use aliases of ls and dir"
Get-ChildItem *github* -recurse | Format-Table

echo " "
echo "========================================"
echo "                Files"
echo "========================================"

echo "Get-Item -Path <file> ... gives details of file"
echo "Get-ItemProperty -Path <file>"
echo "Get-ItemPropertyValue -Path <file> -Name <property>"

echo " "
echo "Get-Item *2024-11-powershell.ps1* | Format-List"
Get-Item *2024-11-powershell.ps1* | Format-List

echo " "
echo "Get-Content *2024-11-powershell.ps1* prints out the content of the file"
ls
Get-Content *2024-11-powershell.ps1*

echo " "
echo "New-Item -Path <file> -ItemType File"
echo "Copy-Item -Path <file> -Destination <file>"
echo "Move-Item -Path <file> -Destination <file>"
echo "Remove-Item -Path <file>"
echo "Rename-Item -Path <file> -NewName <file>"

echo " "
echo "modifying files"
echo "Get-Content -Path <file> ... gives content of file"

echo " "
echo "Get-Content -Path <file> -Tail <number> ... gives last number of lines of file"

echo " "
$scriptPath = $MyInvocation.MyCommand.Path
echo "Get-Content -Path $scriptPath ... gives content of file ... can use alias cat ... tail and head can also be used"

echo " "
echo "... head ..."
Get-Content -Path $scriptPath -Head 3

echo " "
echo "... tail ..."
Get-Content -Path $scriptPath -Tail 3

echo "Set-Content -Path <file> -Value <content>"
echo "Add-Content -Path <file> -Value <content>"
echo "Clear-Content -Path <file>"

echo " "
echo "Invoke-Item -Path <file> ... opens file in default program"

echo " "
echo "========================================"
echo "                Folders"
echo "========================================"

echo " "
echo "New-Item -Path <folder> -ItemType Directory ... creates folder ... can use alias md or mkdir"
echo "Get-Item -Path <folder> ... gives details of folder"
echo "Get-ChildItem -Path <folder> ... lists files in folder"
echo "Copy-Item -Path <folder> -Destination <folder>"
echo "Move-Item -Path <folder> -Destination <folder>"
echo "Remove-Item -Path <folder> ... can use alias rd or rmdir"
echo "Remove-Item -Path <folder> -Recurse ... removes folder and all contents"
echo "Rename-Item -Path <folder> -NewName <folder>"
echo "Set-Location -Path <folder> ... changes directory ... can use alias cd"

echo " "
echo "========================================"
echo "                Paths"
echo "========================================"

echo " "
echo "Get-Location ... shows current location ... can use alias pwd"
echo "Set-Location -Path <path> ... changes location"
echo "Push-Location -Path <path> ... saves current location and changes location"
echo "Pop-Location ... returns to saved location"

echo " "
echo "pwd"
pwd

echo " "
echo "path to this script executing right now"
$scriptPath = $MyInvocation.MyCommand.Path
echo $scriptPath





echo " "
echo "========================================"
echo "        Conditional Operators"
echo "========================================"

$a=1; if ($a -is "Int32") { write-host "a is a number" }



echo " "
echo "========================================"
echo "              Download"
echo "========================================"

echo " "
echo "Invoke-WebRequest -Uri <url> ... downloads file from url ... can use alias wget and curl"
# download
# Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi
# wget https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi
# install azure cli
#Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'
# remove
# rm .\AzureCLI.msi


echo " "
echo "========================================"
echo "        Environment Variables"
echo "========================================"

echo " "
echo "Get-Item env: ... lists all environment variables ... can use alias dir env: and printenv in bash"
# env
# dir env:

echo " "
echo "Get-Item Env:Path ... gives details of environment variable"
Get-Item Env:Path
get-item env:USER
dir env:USER

echo " "
echo "Set-Item Env:Path -Value <value> ... sets environment variable"
#Set-Item Env:Path -Value "c:\flutter\bin"
#setx PATH "c:\flutter\bin"
$env:Path = $env:Path + ";c:\flutter\bin"
get-item env:Path

echo " "
echo "Remove-Item Env:Path ... removes environment variable"

echo " "
echo "permanently set environment variable"
echo "notepad $profile"
echo "add the following line to the file"
echo "Set-Item Env:Path -Value $env:Path + ';c:\flutter\bin'"
echo "also ... on windows machine ... setx PATH $env:Path + ';c:\flutter\bin'"
echo 'also ... on windows machine ... [Environment]::SetEnvironmentVariable("newEnvVar", "NewEnvVal", "Machine")'

echo " "
echo "particular environemnt variables to be aware of"
echo "HOME ... home directory"
echo $HOME
echo "HOMEDRIVE ... home drive directory"
echo "HOMEPATH ... home path directory"

echo "USERPROFILE ... user profile directory"
echo "TEMP ... temporary directory"
echo "TMP ... temporary directory"
echo "APPDATA ... application data directory"
echo "LOCALAPPDATA ... local application data directory"
echo "PROGRAMFILES ... program files directory"
echo "PROGRAMFILES(X86) ... program files x86 directory"
echo "SYSTEMROOT ... system root directory"
echo "SYSTEMDRIVE ... system drive directory"
echo "WINDIR ... windows directory"
echo "COMPUTERNAME ... computer name"
echo "USERNAME ... user name"



echo " "
echo "========================================"
echo "             Default Path"
echo "========================================"

echo " "
echo "to set the default path on powershell start up"
echo "notepad $profile"
echo "add the following line to the file"
echo "Set-Location -Path C:\path\to\default\directory"




echo " "
echo "========================================"
echo "               Functions"
echo "========================================"

echo " "
echo "function <name> { <commands> } ... creates function"
echo "function <name> { param($param1, $param2) <commands> } ... creates function with parameters"

echo " "
echo "function Get-Files { Get-ChildItem -recurse | Format-Table }"
function Get-Files { Get-ChildItem -recurse | Format-Table }
# Get-Files

echo " "
echo "another example"
echo "function Get-Files { param($path) Get-ChildItem -Path $path -recurse | Format-Table }"
function Get-Files { param($path) Get-ChildItem -Path $path -recurse | Format-Table }
Get-Files -path "./"

echo " "
echo "another example"
echo 'function global:MyAmazingScript{ echo "You are in my amazing script - watch out" }'
function global:MyAmazingScript{
	echo "You are in my amazing script - watch out"
}
MyAmazingScript

echo " "
echo "another example"
echo "mkcd which makes a directory and changes to it"
echo 'function mkcd { param($name) New-Item -Path $name -ItemType Directory; Set-Location -Path $name }'
function mkcd { param($name) New-Item -Path $name -ItemType Directory; Set-Location -Path $name }
mkcd test
cd ..
rm -rf test

echo " "
echo "========================================"
echo "              Common Commands"
echo "========================================"

echo " "
echo "Get-Help ... gives help on command"

echo " "
echo "Get-Command ... lists all commands"
echo "Get-Command -Name <command> | Format-List ... gives details of command"
Get-Command -Name az* | Format-List
Get-Command -Name az* | Format-Table

echo " "
echo "Get-Alias ... lists all aliases"

echo " "
echo "Get-Module ... lists all modules"

echo " "
echo "Get-Process ... lists all processes"

echo " "
echo "Get-Service ... lists all services"



echo " "
echo "========================================"
echo "========================================"
echo "        Section 2 - A to Z"
echo "========================================"
echo "========================================"
echo " "



echo " "
echo "========================================"
echo "              Language"
echo "========================================"

echo " "
echo "Get-Culture ... gets culture"
echo "Get-UICulture ... gets user interface culture"
Get-Culture
Get-UICulture




Start-Sleep -Seconds 1
echo " "
Write-Host -NoNewLine '... continue ...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');


echo " "
echo "========================================"
echo "            Operating System"
echo "========================================"

$os=[System.Environment]::OSVersion.Platform
echo "operating system is $os"




echo " "
echo "========================================"
echo "                Wait"
echo "========================================"

echo " "
echo "Start-Sleep -Seconds 1 ... waits for 1 second"
echo "Start-Sleep -Milliseconds 100 ... waits for 100 milliseconds"
echo "Start-Sleep -Minutes 1 ... waits for 1 minute"
echo "Start-Sleep -Hours 1 ... waits for 1 hour"
echo "Start-Sleep -Days 1 ... waits for 1 day"
echo "Start-Sleep -Until (Get-Date).AddSeconds(5) ... waits until a certain time"
echo "Start-Sleep -Until (Get-Date).AddMinutes(5) ... waits until a certain time"
echo "Start-Sleep -Until (Get-Date).AddHours(5) ... waits until a certain time"
echo "Start-Sleep -Until (Get-Date).AddDays(5) ... waits until a certain time"

echo " "
echo "Wait-Process -Name <process> ... waits for process to finish"
echo "Wait-Process -Id <id> ... waits for process to finish"
echo "Wait-Process -InputObject <process> ... waits for process to finish"
echo "Wait-Process -InputObject <process> -Timeout <time> ... waits for process to finish for a certain time"
echo "Wait-Process -InputObject <process> -Timeout <time> -NoNewWindow ... waits for process to finish for a certain time in current window"

echo " "
echo "Wait-Event -SourceIdentifier <event> ... waits for event to finish eg ServerRestarted"
echo 'Restart-Computer -ComputerName test1-win2k12 -Wait -Force; Wait-Event -SourceIdentifier ServerRestarted; Write-Output "Get Process command will be executed after server restart"; Get-Process -ComputerName test1-win2k12'

echo " "
echo "can also be used to wait for a vm to stop"
echo 'Stop-AzVM -ResourceGroupName "myResourceGroup" -Name "myVM" -Force; Wait-AzVM -ResourceGroupName "myResourceGroup" -Name "myVM" -Status "Stopped"'





echo " "
echo "========================================"
echo "========================================"
echo "        Section 2 - Advanced A to Z"
echo "========================================"
echo "========================================"
echo " "


echo " "
echo "========================================"
echo "             Install Programs"
echo "========================================"

echo " "
echo "install program using start-process"
echo "Start-Process -FilePath <path> ... opens program"
echo "Start-Process -FilePath <path> -ArgumentList <arguments> ... opens program with arguments"
echo "Start-Process -FilePath <path> -ArgumentList <arguments> -Wait ... opens program with arguments and waits for it to finish"
echo "Start-Process -FilePath <path> -ArgumentList <arguments> -NoNewWindow ... opens program with arguments in current window"
echo " "
echo "example ... Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet' will run msi installer in quiet mode to install azure cli"
# Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'




echo " "
echo "========================================"
echo "              Event Logs"
echo "========================================"

echo " "
echo "Get-EventLog -LogName <log> ... gets event log"
echo "Get-EventLog -LogName <log> -Newest <number> ... gets newest number of event logs"

$os=[System.Environment]::OSVersion.Platform
echo $os
if ($os -eq 'unix') {
    echo "non-windows operating system eg linux or osx"
} else {
    echo "windows"
    Get-EventLog -LogName System -Newest 5
}





echo " "
echo "========================================"
echo "                Socket"
echo "========================================"

echo " "
echo "New-Object System.Net.Sockets.TcpClient('a2k4.com', 2300) ... connects to a socket"
echo "New-Object System.Net.Sockets.TcpClient('a2k4.com', 2300).GetStream() ... gets stream"







Start-Sleep -Seconds 1
echo " "
Write-Host -NoNewLine '... continue ...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
