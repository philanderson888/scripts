function global:gitpush{
    Get-Location
    git pull
    Write-Output git commit -m $args[0]
    git add .
    git commit -m $args[0]
    git push
}
gitpush $args[0]