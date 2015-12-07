#!/bin/bash

D=$1
T=$2

if [ -z "$1" ];then
     /usr/sbin/ntpdate ntp.api.bz;/usr/sbin/hwclock -w
else
    date -s "$1 $2"
fi
