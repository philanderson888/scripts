echo "================================================================"
echo "====    only doing installs every 30 runs of this program ===="
echo "================================================================"
run_counter=$(cat .script_data/run_counter)
run_counter=$(( run_counter + 1 ))
echo there have been $run_counter runs of this script
echo store new value for next time
echo $run_counter > .script_data/run_counter
echo cat .script_data/run_counter

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
    sleep $slow_read
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
fi
aws_cli_installed=true
aws_cli_already_installed=true
powershell_installed=true
powershell_already_installed=true
jq_installed=true
jo_installed=true
