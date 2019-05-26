#!/bin/bash
# RUN AS ROOT
# Sometimes run out of room in root partition.
# Shrinks space from fedora-home and adds that space to root partition


if [ $# -lt 1 ]; then
    echo "Input amount of space to add to root from home partition. (e.g. 10G for 10 GB)"
    exit
fi

echo "BEFORE"
lvscan
echo "-----------------------------------------------------------"
lvreduce -L -$1 /dev/mapper/fedora-home
lvextend -l +100%FREE /dev/fedora/root

echo "AFTER"
echo "-----------------------------------------------------------"
lvscan


