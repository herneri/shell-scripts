#!/bin/sh

dir="/usr/local/bin"
permissions="555"

if [ ! $1 ]; then
	printf "ERROR: Missing file name \n"
	exit 1
fi

cp $1 $dir/$1
chmod $permissions $dir/$1
