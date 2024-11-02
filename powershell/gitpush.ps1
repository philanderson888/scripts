function global:gitpush{
    Get-Location
    git pull
    Write-Output git commit -m $args[0]
    git add .
    git commit -m $args[0]
    git push
    git checkout master 
    git branch
    Set-Location /github
}
gitpush $args[0]