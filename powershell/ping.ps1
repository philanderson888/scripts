Write-Host nul > output.log
$a = 5
$b = 6
$c = 7
$d = $a,$b,$c
Foreach ($i in $d)
{
 $i + 5
}

while (1 -eq 1 ){
    $now = Get-Date
    Write-Host $now
    $now >> output.log
    Test-Connection -count 1 8.8.8.8  >> output.log
    start-sleep -seconds 2
}



if (!(Test-NetConnection 8.8.8.8 -InformationLevel Quiet  ))
{
    $output = "Ping Failed to 8.8.8.8 @ $now"
    write-verbose ($output)
}
else {
    write-verbose -Message ("Sleeping")
    start-sleep -Seconds 2
}
#Clear-Host
write-verbose -Message "Testing"