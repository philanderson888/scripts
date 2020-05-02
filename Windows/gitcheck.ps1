Clear-Host

$output = "About to sync GitHub repos for user " + $env:USERNAME + " on machine " + $env:COMPUTERNAME
Write-Output $output

$output = "The machine we are working on is " + $env:COMPUTERNAME
Write-Output $output

if ($env:COMPUTERNAME -eq "PHILIP-DESKTOP") {
    $output = "About to sync repos for machine " + $env:COMPUTERNAME
    Write-Output $output
    $repositoryRootPath = "C:\github"
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

Write-Host "checking git diff for all repos first "

Write-Host C:\scripts 
Set-Location C:\scripts 
git status
git diff


$workingPath = $repositoryRootPath + "\2020-01-c-sharp-labs"
Write-Host $workingPath
Set-Location $workingPath
git status
git diff

$workingPath = $repositoryRootPath + "\blog"
Write-Host $workingPath
Set-Location $workingPath
git status
git diff

$workingPath = $repositoryRootPath + "\c-sharp"
Write-Host $workingPath
Set-Location $workingPath
git status
git diff

$workingPath = $repositoryRootPath + "\family-app"
Write-Host $workingPath
Set-Location $workingPath
git status
git diff


$workingPath = $repositoryRootPath + "\sparta-handouts"
Write-Host $workingPath
Set-Location $workingPath
git status
git diff

$workingPath = $repositoryRootPath + "\vue"
Write-Host $workingPath
Set-Location $workingPath
git status
git diff


$workingPath = $repositoryRootPath + "\vue-live"
Write-Host $workingPath
Set-Location $workingPath
git status
git diff



if ($env:COMPUTERNAME -eq "") {
    $output = "About to sync repos for machine " + $env:COMPUTERNAME
    Write-Output $output

    Write-Host C:\2019-04-c-sharp-labs 
    cd C:\2019-04-c-sharp-labs 
    git status
    git diff

    Write-Host C:\2019-06-c-sharp-labs 
    cd C:\2019-06-c-sharp-labs 
    git status
    git diff

    Write-Host C:\2019-09-c-sharp-labs 
    cd C:\2019-09-c-sharp-labs 
    git status
    git diff

    Write-Host C:\2019-11-c-sharp-labs 
    cd C:\2019-11-c-sharp-labs 
    git status
    git diff

    Write-Host C:\2019-12_CSharpWalkthrough 
    cd C:\2019-12_CSharpWalkthrough 
    git status
    git diff



    Write-Host C:\bootstrap
    cd C:\bootstrap
    git status
    git diff



    Write-Host C:\c-sharp-tests 
    cd C:\c-sharp-tests 
    git status
    git diff

    Write-Host c:\course-notes
    cd c:\course-notes
    git status
    git diff

    Write-Host C:\cyber
    cd C:\cyber 
    git status
    git diff



    Write-Host C:\shells
    cd C:\shells 
    git status
    git diff


    Write-Host C:\showcase 
    cd C:\showcase 
    git status
    git diff




}



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


Write-Host ""
Write-Host ""
$workingPath = $repositoryRootPath + "\c-sharp"
Write-Host $workingPath
Set-Location $workingPath
git pull 
git add . 
$commitMessage = "Updating " + $workingPath
git commit -m $commitMessage
git push 
Write-Host "" 
Write-Host "" 


Write-Host ""
Write-Host ""
$workingPath = $repositoryRootPath + "\2020-01-c-sharp-labs"
Write-Host $workingPath
Set-Location $workingPath
git pull 
git add . 
$commitMessage = "Updating " + $workingPath
git commit -m $commitMessage
git push 
Write-Host "" 
Write-Host "" 

Write-Host ""
Write-Host ""
$workingPath = $repositoryRootPath + "\family-app"
Write-Host $workingPath
Set-Location $workingPath
git pull 
git add . 
$commitMessage = "Updating " + $workingPath
git commit -m $commitMessage
git push 
Write-Host "" 
Write-Host "" 


Write-Host ""
Write-Host ""
$workingPath = $repositoryRootPath + "\vue"
Write-Host $workingPath
Set-Location $workingPath
git pull 
git add . 
$commitMessage = "Updating " + $workingPath
git commit -m $commitMessage
git push 
Write-Host "" 
Write-Host "" 


Write-Host ""
Write-Host ""
$workingPath = $repositoryRootPath + "\vue-live"
Write-Host $workingPath
Set-Location $workingPath
git pull 
git add . 
$commitMessage = "Updating " + $workingPath
git commit -m $commitMessage
git push 
Write-Host "" 
Write-Host "" 





if ($env:COMPUTERNAME -eq "") {



    Write-Host ""
    Write-Host ""
    Write-Host 2019-04-c-sharp-labs 
    cd C:\2019-04-c-sharp-labs 
    git pull 
    git add . 
    git commit -m "Updating 2019-04-labs" 
    git push 
    Write-Host "" 
    Write-Host "" 
    
    
    
    
    
    
    Write-Host ""
    Write-Host ""
    Write-Host 2019-06-c-sharp-labs 
    cd C:\2019-06-c-sharp-labs 
    git pull 
    git add . 
    git commit -m "Updating 2019-06-labs" 
    git push 
    Write-Host "" 
    Write-Host "" 
    
    
    
    
    
    
    
    
    
    Write-Host ""
    Write-Host ""
    Write-Host 2019-09-c-sharp-labs 
    cd C:\2019-09-c-sharp-labs 
    git pull 
    git add . 
    git commit -m "Updating 2019-09-labs" 
    git push 
    Write-Host "" 
    Write-Host "" 
    
    
    
    
    
    
    
    Write-Host ""
    Write-Host ""
    Write-Host 2019-11-c-sharp-labs 
    cd C:\2019-11-c-sharp-labs 
    git pull 
    git add . 
    git commit -m "Updating 2019-11-labs" 
    git push 
    Write-Host "" 
    Write-Host "" 
    
    
    
    
    
    Write-Host ""
    Write-Host ""
    Write-Host 2019-12_CSharpWalkthrough 
    cd C:\2019-12_CSharpWalkthrough 
    git pull 
    git add . 
    git commit -m "Updating CSharpWalkthrough" 
    git push 
    Write-Host "" 
    Write-Host "" 
    
    
    
    
    
    
    
    
    Write-Host ""
    Write-Host ""
    Write-Host bootstrap 
    cd C:\bootstrap 
    git pull 
    git add . 
    git commit -m "Updating bootstrap" 
    git push 
    Write-Host "" 
    Write-Host "" 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    Write-Host ""
    Write-Host ""
    Write-Host c-sharp-tests 
    cd C:\c-sharp-tests 
    git pull 
    git add . 
    git commit -m "Updating c-sharp-tests" 
    git push 
    Write-Host "" 
    Write-Host "" 
    
    
    
    
    
    
    
    
    
    
    
    
    
    Write-Host ""
    Write-Host ""
    Write-Host course-notes 
    cd c:\course-notes
    git add . 
    git commit -m "updating course-notes" 
    git push 
    Write-Host "" 
    Write-Host "" 
    
    
    
    Write-Host ""
    Write-Host ""
    Write-Host cyber
    cd c:\cyber
    git add . 
    git commit -m "updating cyber" 
    git push 
    Write-Host "" 
    Write-Host "" 
    
    
    
    
    
    
    
    
    
    Write-Host ""
    Write-Host ""
    Write-Host shells
    cd c:\shells
    git add . 
    git commit -m "updating shells" 
    git push 
    Write-Host "" 
    Write-Host "" 
    
    
    
    
    
    
    Write-Host ""
    Write-Host ""
    Write-Host showcase 
    cd C:\showcase 
    git pull 
    git add . 
    git commit -m "Updating showcase" 
    git push 
    Write-Host "" 
    Write-Host "" 
    
    
    
    
    
    
}













Set-Location $repositoryRootPath
