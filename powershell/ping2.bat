@Echo off
echo "this is a ping log" > ping2.log
:start
 Ping -n 1 8.8.8.8 >> ping2.log
 echo %date% >> ping2.log
 echo %time% >> ping2.log
 Ping -n 59 127.0.0.1 > nul
goto start