echo "====================================================================="
echo "====     vm templates >> output-azure-vm-image-templates.txt     ===="
echo "====================================================================="
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo "=======================================================================" >> output-azure-vm-image-templates.txt
echo "====                              images                           ====" >> output-azure-vm-image-templates.txt
echo "=======================================================================" >> output-azure-vm-image-templates.txt
echo see echo https://learn.microsoft.com/en-us/azure/virtual-machines/generation-2 for image sizes >> output-azure-vm-image-templates.txt
echo 1 Windows Server 2022 >> output-azure-vm-image-templates.txt
echo 2 Windows 11 Enterprise >> output-azure-vm-image-templates.txt
echo 3 SUSE Linux Enterprise Server 15 SP3 >> output-azure-vm-image-templates.txt
echo 4 Ubuntu Server 22.04 LTS >> output-azure-vm-image-templates.txt
echo 5 RHEL 8.5 >> output-azure-vm-image-templates.txt
echo 6 Cent OS 8.4 >> output-azure-vm-image-templates.txt
echo 7 Oracle Linux 8.4 LVM >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
touch output-azure-vm-image-templates.txt
echo all images by canonical >> output-azure-vm-image-templates.txt
#az vm image list --publisher Canonical --sku gen2 --output table --all >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo all images >> output-azure-vm-image-templates.txt
#az vm image list --sku gen2 --output table --all >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo listing vm image sizes >> output-azure-vm-image-templates.txt
#az vm list-sizes --location $resource_group_location --output table >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo azure vm list skus >> output-azure-vm-image-templates.txt
#az vm list-skus --output table >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
#az vm list-skus -l westus --output table >> output-azure-vm-image-templates.txt
echo  >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo "========================================" >> output-azure-vm-image-templates.txt
echo "==== images by publisher Microsoft   ====" >> output-azure-vm-image-templates.txt
echo "========================================" >> output-azure-vm-image-templates.txt
echo > output-azure-vm-image-templates.txt 
echo find all Gen2 SKUs published by Microsoft Windows Desktop - output to output-azure-vm-image-templates.txt
echo Gen2 SKUs published by Microsoft Windows Desktop >> output-azure-vm-image-templates.txt
#az vm image list --publisher MicrosoftWindowsDesktop --sku g2 --output table --all >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo find all Gen2 SKUs published by Microsoft Windows Desktop - output to output-azure-vm-image-templates.txt
#az vm image list --publisher MicrosoftWindowsDesktop --sku gen2 --output table --all >> output-azure-vm-image-templates.txt
echo  >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo find all Gen2 SKUs published by Canonical  - output to output-azure-vm-image-templates.txt
#az vm image list --publisher Canonical --sku gen2 --output table --all >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo find all images - output to output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo "=====================" >> output-azure-vm-image-templates.txt
echo "==== all images   ====" >> output-azure-vm-image-templates.txt
echo "=====================" >> output-azure-vm-image-templates.txt
#az vm image list >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo >> output-azure-vm-image-templates.txt
echo - images use a URN b image name c image id d VHD blob URI
echo azure image templates to use are
echo debian
echo - Ubuntu2204
echo - Debian11
echo redhat
echo - CentOS85Gen2
echo - FlatcarLinuxFreeGen2
echo - OpenSuseLeap154Gen2
echo - RHELRaw8LVMGen2
echo - SuseSles15SP3
echo windows
echo - Win2022Datacenter
echo - Win2022AzureEditionCore
