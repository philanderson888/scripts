az group create --name win-10-with-docker-22-aug-2020 --location uksouth
# get credentials
$cred = Get-Credential
# new vm
New-AzVm `
    -ResourceGroupName "win-10-with-docker-22-aug-2020" `
    -Name "win10" `
    -Location "UK South" `
    -VirtualNetworkName "myVnet" `
    -SubnetName "mySubnet" `
    -SecurityGroupName "myNetworkSecurityGroup" `
    -PublicIpAddressName "myPublicIpAddress" `
    -OpenPorts 80 `
    -Credential $cred

