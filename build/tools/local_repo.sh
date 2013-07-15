#!/bin/bash

[ -z "$1" ] && echo "Provide path to ISO as first argument" && exit
if (( `id -u` != 0 )); then
	echo "You are not root"
	exit
fi

mkdir -p repo
mount | grep $(pwd)/repo &>/dev/null && umount -f ./repo
mount -o loop "$1" ./repo
cd repo
python -m SimpleHTTPServer 8242
