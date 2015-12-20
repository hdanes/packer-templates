#!/usr/bin/env bash

# Install the dependencies
yum -t -y -e 0 install epel-release
yum -t -y -e 0 install bzip2 cpp dkms gcc kernel-devel kernel-headers make perl

# Mount the VBoxGuestAdditions disk image
mkdir /media/virtualbox
mount -t iso9660 -o loop /tmp/VBoxGuestAdditions.iso /media/virtualbox

# Install the drivers
sh /media/virtualbox/VBoxLinuxAdditions.run

# Cleanup VBoxGuestAdditions
umount /media/virtualbox
rmdir /media/virtualbox
rm -f /tmp/VBoxGuestAdditions.iso

# Cleanup packages
yum -t -y -e 0 remove epel-release
yum -t -y -e 0 remove cpp dkms gcc kernel-devel kernel-headers
