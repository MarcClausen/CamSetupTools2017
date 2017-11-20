#!/bin/bash
mkdir -pv mountdir
IP_STR="ip=192.168.1.$1::192.168.0.1:255.255.0.0:rpi:eth0:off";
echo "Setting IP to '$IP_STR'..."
# Edit the boot file to include the correct IP.
echo "dwc_otg.lpm_enable=0 console=serial0,115200 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait $IP_STR" > /tmp/cmdline.txt
mount /dev/mmcblk0p1 mountdir
mv /tmp/cmdline.txt ./mountdir/
sync
umount /dev/mmcblk0p1
fsck -y /dev/mmcblk0p1
sync
fsck -y /dev/mmcblk0p2
sync
echo FINISHED $1
date
