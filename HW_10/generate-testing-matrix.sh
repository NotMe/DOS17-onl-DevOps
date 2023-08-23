#!/bin/bash

os=("linux" "unix" "windows" "macos")
arch=('x86' 'amd64' 'mips' 'aarch64')

for arch in "${arch[*]}"; do
	for os in "${os[*]}"; do
		echo $arch-$os
	done
done
