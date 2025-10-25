#!/bin/sh
# diskf - Format disk

device=$1
fs=$2

if [[ ! $device || ! $fs ]]; then
	printf "ERROR: Enter device and filesystem name\n"
	exit 1
fi

printf "WARNING: \"$device\" WILL BE FORMATTED AND ALL DATA WILL BE ERASED!
ARE YOU SURE YOU WANT TO CONTINUE? [y\\N] \n"

read choice
if [[ $choice != 'y' || ! $choice ]]; then
	exit 0
fi

sudo mount /dev/$device /mnt
if [ $? != 0 ]; then
	printf "ERROR: Mount of \"$device\" failed \n"
	exit 2
fi

echo "y" | sudo mkfs.$fs /dev/$device
if [ $? != 0 ]; then
	printf "ERROR: Format of \"$device\" for the \"$fs\" filesystem
failed \n"
	exit 3
fi

printf "Format complete! Would you like to partition the disk? [y\\N] \n"
read choice

if [[ $choice != 'y' || ! $choice ]]; then
	exit 0
fi

sudo cfdisk /dev/$device
