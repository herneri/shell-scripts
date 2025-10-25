#!/bin/sh
# cinit: Create common files and directories for an average C or C++ program.

main_file=""

mkdir src
mkdir headers

touch Makefile
touch README.md

git init

if [ "$1" = "-n" ]; then
	exit 0
fi

if [ "$1" = "-p" ]; then
	main_file="main.cpp"
else
	main_file="main.c"
fi

printf "int main() {\n\treturn 0;\n}" >> $main_file
