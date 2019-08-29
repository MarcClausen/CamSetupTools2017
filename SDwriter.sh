#!/bin/sh
clear
sleep 2
# Warning!
# This script uses the DD command, which can destroy your data is used improperly
# This includes data on internal system storage
# I assume zero liability. You are on your own.

INPUTPOINT=$1
OUTPUTPOINT=$2
#The first argument is the input file (Your Image)
#The second argument is the device to write to (SDcard)

MEGABYTES=$3
# This is how many megabytes you wanna write 
# Pick a number slightly higher than the amount of data to be written

# EXAMPLE USAGE:
# sh SDwriter.sh image.img /dev/mmcblk0 2500

umount $2
sync
umount $2
sync
umount $2p1
sync
umount $2p2
sync
dd if=/dev/zero of=$OUTPUTPOINT bs=1M count=$MEGABYTES status=progress conv=sync oflag=direct
dd if=$INPUTPOINT of=$OUTPUTPOINT bs=1M count=$MEGABYTES status=progress conv=sync oflag=direct
sync
sleep 1
sync
fsck -y $2
sync
fsck -y $2
sync
fsck -y $2p1
sync
fsck -y $2p2
sync
fstrim -v $2
sync
fstrim -v $2
sync
fstrim -v $2p1
sync
fstrim -v $2p2
sync
echo 'Signed, sealed, delivered...'
date
echo $2
