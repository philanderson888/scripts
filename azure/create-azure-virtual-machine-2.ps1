# Create Resource Group 
New-AzResourceGroup -Name SpartaVirtualMachine-22-Aug-2020 -Location UKSouth
New-AzVm `
    -ResourceGroupName "SpartaVirtualMachine-22-Aug-2020" `
    -Name "myVM" `
    -Location "UKSouth" `
    -VirtualNetworkName "myVnet" `
    -SubnetName "mySubnet" `
    -SecurityGroupName "myNetworkSecurityGroup" `
    -PublicIpAddressName "myPublicIpAddress" `
    -OpenPorts 80,3389