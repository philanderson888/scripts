function global:gitpushevery20minutes{
    Set-Location /github/notes
    git pull 
    git add . 
    git commit -m "updating notes" 
    git push 
    Set-Location f:/GDrive/github/course-notes 
    git pull 
    git add . 
    git commit -m "updating notes" 
    git push 
    Set-Location /github
}
gitpushevery20minutes