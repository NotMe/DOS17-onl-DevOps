#!/bin/bash

date +"%Y-%m-%d %H:%M:%S"

echo -e '\n'notme process count:
ps -u "notme" | wc -l

echo -e '\n'memory usage:
free

echo -e '\n'cpu utilization of the last 15 min:
cat /proc/loadavg | awk {'print $3'}

echo -e '\n'usage /
df -hT / | awk {'print $4,$5,$6,$7'} | column -t
