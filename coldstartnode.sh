apt update -y
apt upgrade -y
apt install nfs-util -y
apt install nfs-common -y
apt install ifconfig -y
apt install vlan -y

modprobe 8021q

read -p "Enter IP: " IP
IF=/etc/network/interfaces
echo "auto eth0" > $IF
echo "iface eth0 inet static" >> $IF
echo "  address $IP" >> $IF
echo "  netmask 255.255.255.0" >> $IF
echo "  gateway 10.0.0.1" >> $IF
echo "  dns-nameservers 1.1.1.1 9.9.9.9" >> $IF
echo "" >> $IF
echo "auto eth0.4" >> $IF
echo "iface eth0.4 inet manual" >> $IF
echo "  pre-up ip link set \$IFACE up" >> $IF
echo "  pre-down ip link set \$IFACE down" >> $IF
echo "" >> $IF
echo "auto eth0.6" >> $IF
echo "iface eth0.6 inet manual" >> $IF
echo "  pre-up ip link set \$IFACE up" >> $IF
echo "  pre-down ip link set \$IFACE down" >> $IF
systemctl restart networking.service
reboot
