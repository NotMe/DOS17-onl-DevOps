#!/bin/bash
x=2
while [ $x -gt 1 ]
do
  echo "$x" >> hw4.log
  sleep 5
  x=$(( $x + 1 ))
done
