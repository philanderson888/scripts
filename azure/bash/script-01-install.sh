echo "================================================================"
echo "====    only doing installs every 30 runs of this program ===="
echo "================================================================"
run_counter=$(cat .script_data/run_counter)
echo there have been $run_counter runs of this script

refresh_limit=30
number_of_installs=$(($run_counter % $refresh_limit))

if [ $number_of_installs -eq 0 ] ; then
    echo only checking for updates every $refresh_limit runs of this program
    echo check for homebrew updates
    echo brew upgrade
    brew upgrade
    echo brew update
    brew update
    brew doctor
    echo
    echo
    echo
    echo update omz using omz update
    omz update
    sleep 1
    echo "==================================================================="
    echo "====                   install azure client                    ===="
    echo "==================================================================="
    brew install azure-cli
    sleep 1
    echo "==================================================================="
    echo "====                    install powershell                     ===="
    echo "==================================================================="
    brew install powershell/tap/powershell
    brew upgrade powershell
    sleep 1
    echo "==================================================================="
    echo "====             install powershell preview                    ===="
    echo "==================================================================="
    brew install powershell/tap/powershell-preview
    echo
    sleep 2
    echo the command pwsh-preview will change the shell to powershell
    brew upgrade powershell-preview
    sleep 1
    echo "==================================================================="
    echo "====                        install jq                         ===="
    echo "==================================================================="
    echo brew install jq
    brew install jq
    sleep 1
    echo "==================================================================="
    echo "====                     install jo                            ===="
    echo "==================================================================="
    echo brew install jo 
    brew install jo
    echo "==================================================================="
    echo "====                     install ttab                          ===="
    echo "====              this opens new tab windows                   ===="
    echo "==================================================================="
    echo install with homebrew ... 
    echo brew tap mklement0/ttab https://github.com/mklement0/ttab.git
    echo brew install mklement0/ttab/ttab
    brew tap mklement0/ttab https://github.com/mklement0/ttab.git
    brew install mklement0/ttab/ttab
fi
aws_cli_installed=true
aws_cli_already_installed=true
powershell_installed=true
powershell_already_installed=true
jq_installed=true
jo_installed=true
