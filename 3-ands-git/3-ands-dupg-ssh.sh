#!/bin/bash
# This is code?
update-locale LANG=en_US.utf8
update-locale LC_ALL=en_US.utf8

echo > /etc/apt/sources.list "deb http://ftp.debian.org/debian/ jessie main
deb-src http://ftp.debian.org/debian/ jessie main
deb http://security.debian.org/debian-security jessie/updates main
deb http://security.debian.org/ jessie/updates main
deb-src http://security.debian.org/ jessie/updates main

# jessie-updates, previously known as 'volatile'
deb http://ftp.debian.org/debian/ jessie-updates main
deb-src http://ftp.debian.org/debian/ jessie-updates main"

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade -yq
DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade -yq
apt-get clean
apt-get autoremove -yq

#Completed upgrade 7-8!
os_ver=$(cat /etc/os-release | grep VERSION_ID)
if [ $os_ver = 'VERSION_ID="8"' ]
then
echo "Completed upgrade 7-8!"
else
echo "Failed upgrade 7-8!"
fi

update-locale LANG=en_US.utf8
update-locale LC_ALL=en_US.utf8

echo > /etc/apt/sources.list "deb http://ftp.debian.org/debian/ stretch main
deb-src http://ftp.debian.org/debian/ stretch main
deb http://security.debian.org/debian-security stretch/updates main
deb http://security.debian.org/ stretch/updates main
deb-src http://security.debian.org/ stretch/updates main

# stretch-updates, previously known as 'volatile'
deb http://ftp.debian.org/debian/ stretch-updates main
deb-src http://ftp.debian.org/debian/ stretch-updates main"

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade -yq
DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade -yq
apt-get clean
apt-get autoremove -yq

#Completed upgrade 8-9!
os_ver=$(cat /etc/os-release | grep VERSION_ID)
if [ $os_ver = 'VERSION_ID="9"' ]
then
echo "Completed upgrade 8-9!"
else
echo "Failed upgrade 8-9!"
fi

update-locale LANG=en_US.utf8
update-locale LC_ALL=en_US.utf8

echo > /etc/apt/sources.list "deb http://ftp.debian.org/debian/ buster main
deb-src http://ftp.debian.org/debian/ buster main
deb http://security.debian.org/debian-security buster/updates main
deb http://security.debian.org/ buster/updates main
deb-src http://security.debian.org/ buster/updates main

# buster-updates, previously known as 'volatile'
deb http://ftp.debian.org/debian/ buster-updates main
deb-src http://ftp.debian.org/debian/ buster-updates main"

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade -yq
DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade -yq
apt-get clean
apt-get autoremove -yq

#Completed upgrade 9-10!
os_ver=$(cat /etc/os-release | grep VERSION_ID)
if [ $os_ver = 'VERSION_ID="10"' ]
then
echo "Completed upgrade 9-10!"
else
echo "Failed upgrade 9-10!"
fi

echo > /etc/init.d/final.sh '#!/bin/bash

PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin

### BEGIN INIT INFO
# Provides:          final.sh
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Should-Start:      $portmap
# Should-Stop:       $portmap
# X-Start-Before:    nis
# X-Stop-After:      nis
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# X-Interactive:     true
# Short-Description: Final Setup
# Description:       This file should be used to construct scripts to be
#                    placed in /etc/init.d.
### END INIT INFO

apt-get install -yq sudo vim openssh-server

hostnamectl set-hostname ands-dev-03
useradd -m -s /bin/bash ands
echo "ands:1234567" | chpasswd
echo >> /etc/sudoers "ands ALL=(ALL)ALL"
echo > /etc/resolv.conf "nameserver 192.168.100.1"
echo > /etc/network/interfaces "auto lo
iface lo inet loopback
auto eth0
iface eth0 inet static
address 192.168.100.200
netmask 255.255.255.0
gateway 192.168.100.1"

update-rc.d final.sh remove
rm /etc/init.d/final.sh

reboot'

chmod +x /etc/init.d/final.sh
update-rc.d final.sh defaults

reboot
