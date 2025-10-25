#!/bin/sh
# Remove all uneeded pacman dependencies

dep="$(pacman -Qdt | awk '{print $1}')"

for pkg in $dep
do
	echo 'y' | pacman -Rs $pkg
done
