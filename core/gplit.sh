#!/bin/sh
# Prepend a GPL License notice to a file (currently just v3)

if [ ! $1 ] || [ ! $2 ] || [ ! "$3" ] || [ "$1" = "-h" ]; then
	printf "gplit: usage: gplit [FILE_PATH] [PROGRAM_NAME] [AUTHOR_NAME]\n"
	exit 1
fi

year=$(date +%Y)
file_path="$1"
program_name="$2"
author="$3"

v3="\
/*
**	Copyright $year $author
**
**	This file is part of $program_name.
**
**	$program_name is free software: you can redistribute it and/or modify it
**	under the terms of the GNU General Public License as published by the
**	Free Software Foundation, either version 3 of the License, or (at your option)
**	any later version.
**
**	$program_name is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
**	the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
**	See the GNU General Public License for more details.
**
**	You should have received a copy of the GNU General Public License along with $program_name.
**	If not, see <https://www.gnu.org/licenses/>.
*/

"

if  [ ! -f $file_path ]; then
	printf "gplit: $file_path was not found\n"
	exit 2
fi

file_content=$(cat $file_path)
printf "$v3$file_content" > $file_path
