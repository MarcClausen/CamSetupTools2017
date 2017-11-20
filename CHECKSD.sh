#!/bin/bash
fsck -a /dev/$11
sync
fsck -a /dev/$12
sync
fsck -a /dev/$1p1
sync
fsck -a /dev/$1p2
sync
fstrim -a
sync
