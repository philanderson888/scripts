#!/bin/bash
if [ "$install_apache" = true ] && [ "$os_type" == "$os_type_fedora" ]; then
    echo "==================================================="
    echo "====              install apache               ===="
    echo "==================================================="
    echo "==================================================="
    echo "====               install httpd               ===="
    echo "==================================================="
    echo install httpd
    sudo yum install httpd -y
    echo update httpd
    sudo yum update httpd -y
    echo "==================================================="
    echo "====           install firewalld               ===="
    echo "==================================================="
    sudo yum install firewalld -y
    echo "==================================================="
    echo "====            enable firewalld               ===="
    echo "==================================================="
    sudo systemctl enable firewalld
    echo "==================================================="
    echo "====             start firewalld               ===="
    echo "==================================================="
    echo start firewall
    sudo systemctl start firewalld
    echo "==================================================="
    echo "====             firewall status               ===="
    echo "==================================================="
    sudo firewall-cmd --state
    echo "==================================================="
    echo "====             firewall zones                ===="
    echo "====    home internal public trusted work      ===="
    echo "==================================================="
    sudo firewall-cmd --permanent --get-zones
    echo "==================================================="
    echo "====          firewall open ports              ===="
    echo "==================================================="
    echo add http to firewall
    sudo firewall-cmd --zone=public --add-service=http --permanent
    echo
    echo
    echo
    echo add https to firewall
    sudo firewall-cmd --zone=public --add-service=https --permanent
    echo
    echo
    echo
    echo add ports to firewall
    sudo firewall-cmd --zone=public --add-port=80/tcp
    sudo firewall-cmd --zone=public --add-port=443/tcp
    sudo firewall-cmd --zone=public --add-port=443/udp
    sudo firewall-cmd --zone=public --add-port=80/udp
    sudo firewall-cmd --zone=public --list-ports
    sudo firewall-cmd --zone=public --add-port=5000/tcp
    sudo firewall-cmd --zone=public --add-port=3000/tcp
    sudo firewall-cmd --zone=public --add-port=3001/tcp
    sudo firewall-cmd --zone=public --add-port=3002/tcp
    sudo firewall-cmd --zone=public --add-port=3003/tcp
    sudo firewall-cmd --zone=public --add-port=3004/tcp
    sudo firewall-cmd --zone=public --add-port=3005/tcp
    sudo firewall-cmd --zone=public --add-port=3006/tcp
    sudo firewall-cmd --zone=public --add-port=3007/tcp
    sudo firewall-cmd --zone=public --add-port=3008/tcp
    sudo firewall-cmd --zone=public --add-port=3009/tcp
    sudo firewall-cmd --zone=public --add-port=3010/tcp
    sudo firewall-cmd --zone=public --list-ports
    echo
    echo
    echo
    echo list services
    sudo firewall-cmd --get-services
    echo "==================================================="
    echo "====  install php php-mysqli mariadb105        ===="
    echo "==================================================="
    sudo dnf install -y httpd php php-mysqli mariadb105
    echo "==================================================="
    echo "====               start apache                ===="
    echo "==================================================="
    sudo systemctl start httpd
    echo "==================================================="
    echo "====           configure apache                ===="
    echo "==================================================="
    echo configure web server to start after every boot
    sudo systemctl enable httpd
    echo
    echo
    echo
    echo index.html path /usr/share/httpd/noindex/index.html
    cd /usr/share/httpd/noindex/
    echo write index.html
    sudo chmod 777 index.html
    echo cat index.html
    cat index.html
    echo "==================================="
    echo "==== test apache web server ======="
    echo "==================================="
    echo curl localhost -s
    curl localhost -s
    echo
    echo
    echo
    echo is http enabled
    sudo systemctl is-enabled httpd
    echo 
    echo 
    echo 
    echo install https not done yet
    # echo now installing https 
    # sudo yum install -y mod_ssl
    # generate self signed certificate
    # echo generating self signed certificate
    # cd /etc/pki/tls/certs
    # echo not sure if this command works or not
    # sudo ./make-dummy-cert localhost.crt
    echo "=============================================================="
    echo "====               install apache complete                ===="
    echo "=============================================================="
fi
