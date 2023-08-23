#!/bin/sh

num=$1

if (expr "$num" : "[0-9]" > /dev/null) && [ $(("$num" % 2)) -eq 0 ]; then
	echo "$num" "is EVEN"
elif (expr "$num" : "[0-9]" > /dev/null) && [ $(("$num" % 2)) -ne 0 ]; then
	echo "$num" "is ODD"
else
	echo "$num" "is NOT a NUMBER"
	exit 1
fi
