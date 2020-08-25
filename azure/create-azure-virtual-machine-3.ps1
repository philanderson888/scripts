$LocationName = "UKSouth"
$ResourceGroupName = "SpartaVirtualMachine-22-Aug-2020"

# Create Resource Group 
# New-AzResourceGroup -Name  $ResourceGroupName  -Location $LocationName
# Create VM
New-AzVm `
    -ResourceGroupName $ResourceGroupName `
    -Name "myVM" `
    -Location $LocationName `
    -OpenPorts 80,3389