Clear-Host

$output = "About to sync GitHub repos for user " + $env:USERNAME + " on machine " + $env:COMPUTERNAME
Write-Output $output

$output = "The machine we are working on is " + $env:COMPUTERNAME
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

Remove-Item -Force c:\users\$env:USERNAME\WindowsPowerShell\*
copy-item -Path c:\scripts\Windows\* -Destination c:\users\$env:USERNAME\WindowsPowerShell

Write-Host ""
Write-Host ""

Write-Host "checking git diff for the following GitHub repositories: "
$ListOfGithubRepositories = Get-ChildItem -Path $repositoryRootPath -Directory

Write-Host C:\scripts
foreach($repository in $ListOfGithubRepositories){
    Write-Host $repository
}

Write-Host ""
Write-Host ""

Write-Host C:\scripts 
Set-Location C:\scripts 
git status
git diff
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""


Write-Host F:\gdrive\github\personal 
Set-Location F:\gdrive\github\personal
git status
git diff
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""

Write-Host F:\gdrive\github\course-notes
Set-Location F:\gdrive\github\course-notes
git status
git diff
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""


Set-Location $repositoryRootPath
foreach($repository in $ListOfGithubRepositories){
    Write-Host $repository
    Write-Host '================='
    Set-Location $repository
    git status
    git diff
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host ""
}

Write-Host ""
Write-Host ""
Write-Host "Repository Check Complete"
Write-Host "Press Enter To Continue Or Control-C To Cancel Push And Pull To GitHub"
Write-Host ""
Write-Host ""
Write-Host ""


Set-Location "c:\"
pause

Clear-Host
Write-Host "Pushing and pulling github repos"



Write-Host ""
Write-Host ""
Write-Host scripts 
Set-Location C:\scripts 
git pull 
git add . 
git commit -m "Updating scripts" 
git push 
Write-Host "" 
Write-Host "" 



foreach($repository in $ListOfGithubRepositories){
    Write-Host $repository
    Write-Host '================='
    Set-Location $repository
    git pull 
    git add . 
    $commitMessage = "Updating " + $workingPath
    git commit -m $commitMessage
    git push 
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host ""
}




Set-Location $repositoryRootPath
