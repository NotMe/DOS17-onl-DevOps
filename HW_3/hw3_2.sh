#!/bin/bash

sudo useradd -m $1

sysinfo=/home/$1/sysinfo.info

#echo $userhomedir

echo ====****==== >> $sysinfo
lscpu >> $sysinfo

echo ====****==== >> $sysinfo
lsblk >> $sysinfo

echo ====****==== >> $sysinfo
uname >> $sysinfo

echo ====****==== >> $sysinfo
df >> $sysinfo
