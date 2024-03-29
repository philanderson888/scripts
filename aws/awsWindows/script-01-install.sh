if [ "$installing_aws_cli" = true ] ; then
    echo "======================================================================="
    echo "====                               installing aws client      ============="
    echo "======================================================================="
    brew update
    brew install azure-cli
    aws_cli_installed=true
else
    echo "======================================================================="
    echo "====                           aws client is already installed         ============="
    echo "======================================================================="
    aws_cli_already_installed=true
fi
aws_version=$(aws --version)
if [ "$installing_powershell" = true ] ; then
    echo "======================================================================="
    echo "====                            installing powershell         ============="
    echo "======================================================================="
    brew update
    brew install powershell/tap/powershell
    brew upgrade powershell
    pwsh
    echo
    echo
    echo
    echo installing powershell preview edition
    brew install powershell/tap/powershell-preview
    pwsh-preview
    brew upgrade powershell-preview
    powershell_installed=true
else
    echo "======================================================================="
    echo "====                           powershell is already instsalled        ============="
    echo "======================================================================="
    powershell_already_installed=true
fi
powershell_version=$(pwsh --version)
