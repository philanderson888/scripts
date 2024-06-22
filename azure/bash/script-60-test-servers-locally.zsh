#!/bin/zsh
echo zsh
zsh
ip=$(hostname --ip-address)
echo ip is $ip
echo
echo
echo
dt=$(date '+%H:%M:%S');
echo tesing servers starting at time $dt 
echo
echo
echo ports
web_port=80
echo web $web_port
node_port=3006
echo node $node_port
express_port=3000
echo express $express_port
bun_port=3007
echo bun $bun_port
which_port=3008
echo which $which_port
react_port_1=3009
react_port_2=3010
echo react $react_port_1 $react_port_2
vue_port_1=3020
vue_port_2=5173
echo vue $vue_port_1 $vue_port_2
echo
echo
echo
for port in $web_port $node_port $express_port $bun_port $which_port $react_port_1 $react_port_2 $vue_port_1 $vue_port_2
do
    echo
    echo
    echo
    echo port $port
    echo localhost
    curl localhost:$port
    curl 127.0.0.1:$port
    echo
    echo local ip
    curl $ip:$port -s
done
