Clear-Host

$output = "The machine we are working on is " + $env:COMPUTERNAME
Write-Output $output

$output = "About to run git pull on the following repos for user " + $env:USERNAME
Write-Output $output

if ($env:COMPUTERNAME -eq "PHILIP-DESKTOP") {
    $output = "About to sync repos for machine " + $env:COMPUTERNAME
    Write-Output $output
    $repositoryRootPath = "C:\github\"
}
else{
    $repositoryRootPath = "C:\"
}

$output = "Repository Root Path Is " + $repositoryRootPath
Write-Host $output

Write-Host "about to run git pull for the following GitHub repositories: "
$ListOfGithubRepositories = Get-ChildItem -Path $repositoryRootPath -Directory

Write-Host C:\scripts
foreach($repository in $ListOfGithubRepositories){
    Write-Host $repository
}

Write-Host ""
Write-Host ""

Write-Host C:\scripts 
Set-Location C:\scripts 
git pull

foreach($repository in $ListOfGithubRepositories){
    Write-Host $repository
    Write-Host '================='
    Set-Location $repository
    git pull
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host ""
}

Remove-Item -Force c:\users\$env:USERNAME\WindowsPowerShell\*
copy-item -Path c:\scripts\Windows\* -Destination c:\users\$env:USERNAME\WindowsPowerShell

Write-Host ""
Write-Host ""

Set-Location $repositoryRootPath

Pause