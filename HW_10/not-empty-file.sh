#!/bin/bash

while read -r file_name; do
	if [[ $(stat -c %s "$file_name") -gt 0 ]]; then
		echo "$file_name"
	fi
done
