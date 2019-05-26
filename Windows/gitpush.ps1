function global:gitpush{
    pwd
    git pull
    echo git commit -m $args[0]
    git add .
    git commit -m $args[0]
    git push
}
gitpush $args[0]