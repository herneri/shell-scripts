#!/usr/bin/env bash

# Create or remove two directories, one recursive
set -e

c() {
    mkdir $2 && printf "$2\n"

    cd $2
        mkdir $3 && printf "$3\n"
    cd ..
    exit 0
}

[[ $1 == "-c" ]] && [[ $2 ]] && [[ $3 ]] && c "$1" "$2" "$3"

r() {
    cd $2
        rmdir $3 && printf "$3\n"
    cd ..

    rmdir $2 && printf "$2\n"
    exit 0
}

[[ $1 == "-r" ]] && [[ $2 ]] && [[ $3 ]] && r "$1" "$2" "$3"

[[ $1 == "-c" ]] || [[ $1 == "-r" ]] && printf "$0: Missing directory \n" && exit 1

printf "Invalid option: '$1' \n"
