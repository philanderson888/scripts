# install from personal channel
$url = "https://github.com/philanderson888/scripts/blob/master/devops/vs_community__1830954925.1587920606.exe?raw=true"
$output = "vs_community__831057064.1598087060.exe"
$start_time = Get-Date
Invoke-WebRequest -Uri $url -OutFile $output
./vs_community__831057064.1598087060.exe
