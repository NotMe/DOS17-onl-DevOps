#!/bin/bash

while read -r file_name; do
#	file_array["$index"]="$file_name"

	if [[ $(stat -c %s "$file_name") -gt 0 ]]; then
		echo "$file_name"
	fi
done
