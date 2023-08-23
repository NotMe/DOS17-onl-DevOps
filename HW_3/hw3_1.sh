#!/bin/bash

free -h | awk {"print $6"} | sed "s/available/Свободно/g" | sed "s/Gi/Гб/g" | column -t

echo ' '
mpstat | awk {"print $3,$4,$5,$6,$7,$8,$9,$10,$11,$12"} | sed "s/CPU/ЦП/g" | sed "s/usr/польз/g" | sed "s/sys/система/g" | column -t

echo ' '
ip -4 address | grep /24 | sed "s/inet/IP Адрес/g"
