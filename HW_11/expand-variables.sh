#!/bin/bash

set -e

usage() {
	echo "Usage: $0 [-f <FILE>] <KEY_VALUE_PAIR>" 1>&2
	exit 1
}

while getopts ":f:" file; do
	case "${file}" in
	f)
		f=${OPTARG}
		;;
	*)
		echo "unknown argumment"
		usage
		;;
	esac
done

if [ -z "${f}" ]; then
	stdin=$(cat)

	while [ -n "$1" ]; do
		export "${1?}"
		shift
	done

	echo "$stdin" | envsubst > template_cred.json
else
	shift
	shift
	while [ -n "$1" ]; do
		export "${1?}"
		shift
	done
	envsubst < "${f}" > template_cred.json
fi

echo "${SERVER_URL}"
echo "${DB_CONNECTION_STRING}"
