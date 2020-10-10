#!/bin/sh
# ZRAM swap - 160MB
echo 167772160 > /sys/block/zram0/disksize
/system/bin/tiny_mkswap /dev/block/zram0
/system/bin/tiny_swapon /dev/block/zram0
### Manipulation of 2nd swap ###
# Remove IMMUTABLE attribute
chattr -i /data/2ndswap
# Second swap - 128MB
tiny_fallocate 134217728 /data/2ndswap
mkswap /data/2ndswap
swapon /data/2ndswap
# Add IMMUTABLE attribute
chattr +i /data/2ndswap
# Set swappiness
echo 100 > /proc/sys/vm/swappiness
# echo 100 > /sys/fs/cgroup/memory/sw/memory.swappiness
