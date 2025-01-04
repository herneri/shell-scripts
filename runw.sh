#!/bin/sh
# runw: Run a command when input is entered

if [ "$1" = "-h" ] || [ "$1" = "--help" ] || [ ! $1 ]; then
	printf "runw: runw [PROGRAM] \n"
	exit 0
fi

cmd=$1
while [ "$input" != "q" ]; do
	read input
	clear

	if [ $input ] && [ $input != "q" ]; then
		sh -c $cmd
	fi
done
