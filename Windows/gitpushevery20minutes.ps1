function global:gitpushevery20minutes{
    Set-Location /github/notes
    git pull 
    git add . 
    git commit -m "updating notes" 
    git push 
    Set-Location /github/course-notes 
    git pull 
    git add . 
    git commit -m "updating notes" 
    git push 
    Set-Location /github
}
gitpushevery20minutes