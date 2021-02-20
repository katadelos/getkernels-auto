#!/bin/sh

KERNEL_DIR="/mnt/us/kernels"
BIN_DIR="/mnt/us/extensions/getkernels-auto/bin"
MMC_DEV="/dev/mmcblk0"

if [ ! -d $KERNEL_DIR ]; then
  mkdir $KERNEL_DIR
fi

sh $BIN_DIR/getkernels.sh $MMC_DEV