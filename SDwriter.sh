#!/bin/sh
clear
sleep 2
INPUTPOINT=$1
OUTPUTPOINT=$2
umount $21
sync
umount $22
sync
umount $2p1
sync
umount $2p2
sync
dd if=/dev/zero of=$OUTPUTPOINT bs=1M count=1550 status=progress conv=sync oflag=direct
dd if=$INPUTPOINT of=$OUTPUTPOINT bs=1M count=1500 status=progress conv=sync oflag=direct
sync
sleep 1
sync
fsck -y $21
sync
fsck -y $22
sync
fsck -y $2p1
sync
fsck -y $2p2
sync
fstrim -v $21
sync
fstrim -v $22
sync
fstrim -v $2p1
sync
fstrim -v $2p2
sync
echo 'Signed, sealed, delivered...'
date
echo $2
