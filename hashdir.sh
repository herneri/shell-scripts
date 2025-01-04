#!/bin/sh

# hashdir: Create a list of hashes for all a directory's
# content, then hash that list to represent the directory.

# Copyright 2025 Eric Hernandez

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

hash_algo="sha256sum"
child_hashes=""

is_dir() {
	file $1 | awk '{print $2}' | grep "directory" > /dev/null
	return $?
}

# $1 = Directory
# $2 = Is function recursively called?
hash_dir() {
	local files=$(ls $PWD/$1)
	[ $2 ] || [ $1 != "." ] && cd $1

	for file in $files;
	do
		if ! is_dir $file; then
			child_hashes=$(printf "$child_hashes\n$(sh -c "$hash_algo $PWD/$file | awk '{print \$1}'")")
			continue
		fi
		
		hash_dir $file true
	done

	[ $2 ] || [ $1 != "." ] && cd ..
	return
}

if [ ! $1 ] || ! is_dir $1 ; then
	printf "ERROR: The first argument must be a valid directory \n"
	exit 1
fi

[ $2 ] && case $2 in
	"-m")
		hash_algo="md5sum"
	;;

	"-s2")
		hash_algo="sha256sum"
	;;

	"-s5")
		hash_algo="sha512sum"
	;;

	*)
		printf "ERROR: Invalid hash option. Valid options are:\n"
		printf "%s \tmd5 \n-s2 \tsha256 \n-s5 \tsha512\n" "-m"
		exit 2
	;;
esac

hash_dir $1
printf "$(sh -c "printf \"$child_hashes\" | $hash_algo | awk '{print \$1}'")\t$1\n"
