#!/bin/sh

# MKDIR: Create or remove two directories recursively
set -e

if [ "$1" = "-c" ] && [ $2 ] && [ $3 ]; then
    mkdir $2 && printf "$2\n"

    cd $2
        mkdir $3 && printf "$3\n"
    cd ..
    exit 0
elif [ "$1" = "-r" ] && [ $2 ] && [ $3 ]; then
    cd $2
        rmdir $3 && printf "$3\n"
    cd ..

    rmdir $2 && printf "$2\n"
    exit 0
fi

[ "$1" = "-c" ] || [ "$1" = "-r" ] && printf "$0: Missing directory \n" && exit 1

printf "Invalid option: '$1' \n"
