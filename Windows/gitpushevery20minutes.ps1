function global:gitpushevery20minutes{
    Set-Location F:/GDrive/github/personal
    git pull 
    git add . 
    git commit -m "updating notes" 
    git push 
    Set-Location F:/GDrive/github/course-notes 
    git pull 
    git add . 
    git commit -m "updating notes" 
    git push 
    Set-Location /github
}
gitpushevery20minutes