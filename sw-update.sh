#!/bin/bash

# simple bash script to automatically update the software
# using the apt package manager


# TODO: write a function to log the current dat
# TODO: Make log messages more sophisticated and informative
# TODO: put log file into dmesg or syslog or /var/log/sw-update or something
if [ `id -u` != 0 ] ; then
        echo "Must be run as root."
	touch ~/sw-update-log.txt
	echo $(date) >> ~/sw-update-log.txt
	echo "Error: must run as root" >> ~/sw-update-log.txt
	echo $(whoami) >> ~/sw-update-log.txt
	exit 1
fi


#TODO: detect presence of deborphan and invoke it.


apt -y update
apt upgrade
apt autoremove
#apt-get clean # clear the cache
#purge-old-kernels --keep 2 # should be done by apt directly now


mkdir -p /var/log/sw-update/
touch /var/log/sw-update/log.txt
echo $(date) >> /var/log/sw-update/log.txt
exit 0
