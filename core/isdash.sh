#!/bin/sh
# isdash: Determine if /bin/sh is linked to dash

result=$(ls -l /bin/sh | grep "dash")
if [ ! $result ]; then
	printf "/bin/sh is not linked to dash! \n"
	exit 1
fi
