echo "======================================================================="
echo "===================  physical disks  =========================="
echo "======================================================================="

Get-PhysicalDisk

Get-PhysicalDisk | ft -AutoSize DeviceId,Model,MediaType,BusType,Size

Get-PhysicalDisk | ft -AutoSize DeviceId,Model,@{Name="Size, Gb"; Expression={$_.Size/1Gb}}

Get-PhysicalDisk | ft -AutoSize DeviceId,Model,@{Name="Size, Gb"; Expression={[int]($_.Size/1GB)}}


echo try this

Get-Disk

Get-Disk | Format-Table -AutoSize Number,FriendlyName,Size,PartitionStyle

Get-Disk | Format-Table -AutoSize Number,FriendlyName,@{Name="Size, Gb"; Expression={[int]($_.Size/1GB)}}

Get-Disk | Select Manufacturer, SerialNumber, UniqueId

Get-Partition

Get-Partition -DiskNumber 0

get-partition -DriveLetter U | get-disk

Get-Partition -DriveLetter C

Get-Volume


Get-Volume -DriveLetter C



echo "======================================================================="
echo "==================  logical system drives  =========================="
echo "======================================================================="

echo getting system logical drives

Get-PSDrive -PSProvider 'FileSystem'

echo "======================================================================="
echo "===================  logical drives  =========================="
echo "======================================================================="

echo getting all logical drives

Get-PSDrive


echo "======================================================================="
echo "===================  logical volumes =========================="
echo "======================================================================="

echo getting all logical volumes

Get-Volume

echo also another way

Get-PSDrive [System.IO.DriveInfo]::getdrives()
wmic diskdrive
wmic volume

echo also another way

wmic logicaldisk get name

wmic logicaldisk get caption 

wmic logicaldisk get deviceid, volumename, description

echo also another way 

fsutil fsinfo drives

echo get size not sure this works 

Get-CimInstance -ComputerName yourhostname win32_logicaldisk | foreach-object {write " $($.caption) $('{0:N2}' -f ($.Size/1gb)) GB total, $('{0:N2}' -f ($_.FreeSpace/1gb)) GB free "}



echo "======================================================================="
echo "===================  volumes per disk =========================="
echo "======================================================================="




strComputer = “.”
Set objWMIService = GetObject(“winmgmts:\\” & strComputer & “\root\cimv2”)

Set colDiskDrives = objWMIService.ExecQuery(“SELECT * FROM Win32_DiskDrive”)
For Each objDrive In colDiskDrives
    Wscript.Echo “Physical Disk: ” & objDrive.Caption & ” — ” & objDrive.DeviceID 
    strDeviceID = Replace(objDrive.DeviceID, “\”, “\\”)
    Set colPartitions = objWMIService.ExecQuery _
        (“ASSOCIATORS OF {Win32_DiskDrive.DeviceID=””” & _
            strDeviceID & “””} WHERE AssocClass = ” & _
                “Win32_DiskDriveToDiskPartition”)
    For Each objPartition In colPartitions
        Wscript.Echo “Disk Partition: ” & objPartition.DeviceID
        Set colLogicalDisks = objWMIService.ExecQuery _
            (“ASSOCIATORS OF {Win32_DiskPartition.DeviceID=””” & _
                objPartition.DeviceID & “””} WHERE AssocClass = ” & _
                    “Win32_LogicalDiskToPartition”)
        For Each objLogicalDisk In colLogicalDisks
            Wscript.Echo “Logical Disk: ” & objLogicalDisk.DeviceID
        Next
        Wscript.Echo
    Next
    Wscript.Echo
Next


echo storage module 

Get-Command -Module Storage



echo "======================================================================="
echo "====                      logical volumes                                      ===="
echo "======================================================================="

diskpart

list volume 
