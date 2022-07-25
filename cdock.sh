#!/bin/sh

# DOCKER: Create, start, and open a container with one command
# -c to create | -r to remove

if [ "$1" = "-c" ] && [ $2 ] && [ $3 ] && [ $4 ]; then
    docker create --name $2 -i -t $3 $4
    docker start $2
    docker exec -it $2 $4 && exit 0
fi

[ "$1" = "-c" ] && printf "Please provide a name, image, and command \n" && exit 1

r() {
    docker kill $2
    docker rm $2
}

[ "$1" = "-r" ] && [ $2 ] && r "$1" "$2" && exit 0

[ "$1" = "-r" ] && printf "Missing name \n" && exit 2

printf "Invalid option '$1' \n" && exit 3
