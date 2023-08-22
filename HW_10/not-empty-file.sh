#!/bin/bash

index=0

while read file_name; do
	file_array[$index]="$file_name"
	echo ${file_array[$index]}
	index=$(($index + 1))
done

for file in "${file_array[*]}"; do
	if [[ $(wc -m ${file_array[$file]}) -gt 0 ]]; then
		echo "${file_array[$file]}"
	fi
done
