function global:mkcd{
    echo 'running script'
    $path = $args[0]
    echo $path
    New-Item $path -ItemType Directory
    cd $path

}
mkcd $args[0]