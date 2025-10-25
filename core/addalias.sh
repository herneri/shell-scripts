#!/bin/sh
# addalias: Append an alias to the shell's rc file

if [ ! $1 ] || [ ! $2 ]; then
	printf "ERROR: No alias given \n"
	printf "addalias: addalias [NAME] [VALUE] \n"
	exit 1
fi

shell_rc="$(echo $SHELL | sed 's./bin/..')rc"
name=$1
value=$2

if grep "$name=" ~/.$shell_rc; then
	printf "ERROR: alias already exists \n"
	exit 2
fi

echo "alias $name=\"$value\"" >> ~/.$shell_rc

if [ $? != 0 ]; then
	printf "ERROR: Failed to write to rc file \n"
	exit 2
fi
