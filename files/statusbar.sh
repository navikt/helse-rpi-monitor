#!/bin/sh

while true; do
    hostname=`hostname`
    uptime=`uptime`
    ip=`ip addr show dev wlan0 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1`
    avail=`free -h | grep 'Mem' | awk '{print $7}'`
    echo "$uptime | $hostname | WLAN $ip | $avail free"
    sleep 1
done
