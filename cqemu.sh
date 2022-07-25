#!/bin/sh

# QEMU: Create and run a Qemu KVM

if [ $1 ] && [ $2 ] && [ $3 ] && [ $4 ]; then
    qemu-img create -f qcow2 $1.img $3
    qemu-system-x86_64 -enable-kvm -cpu host -m $4 -cdrom $2 -drive file=$1.img && exit 0
fi

printf "Provide a name, iso, disk size, and RAM size \n" && exit 1
