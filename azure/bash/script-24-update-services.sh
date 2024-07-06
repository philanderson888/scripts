sudo systemctl restart systemd-journald.service 
sudo /etc/needrestart/restart.d/systemd-manager
sudo systemctl restart systemd-networkd.service
sudo systemctl restart systemd-resolved.service
sudo systemctl restart systemd-logind.service
sudo systemctl restart unattended-upgrades.service
services_restarted=true
