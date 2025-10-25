#!/bin/sh
# gc: Add changes and commit them to a git repo, while pushing if specified.

if [ $# -lt 2 ]; then
	printf "gc: Must at least specify some path(s) and a commit message \n"
	exit 1
fi

for path in $1
do
	git add $path
done

git commit -m "$2"

if [ "$3" = "-p" ]; then
	if [ $4 ]; then
		git push origin $4
		exit 0
	fi

	git push origin master
fi
