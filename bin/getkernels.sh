#!/bin/sh
#===================================================================================
# getkernels v1.4 - get kernel images from kindle mmc device or backup image file
# Usage:
#   getkernels /dev/mmcblk0 : get linux kernel(s) from mmc
#   getkernels mmcblk0.img : get linux kernel(s) from file
# Copyright (C) 2012 by geekmaster
# Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
#-----------------------------------------------------------------------------------
IN="$1" # Input Name
[[ "$IN" == "" ]]&& head -n6 $0|tail -n4 && exit # if no params, show usage

BS=1024 # Block Size
S1=$((0x41000/BS)) # Start 1 (main, block number)
S2=$((0xe41000/BS)) # Start 2 (diags, block number)
DN=/dev/null
MK=/mnt/us/kernels/main_kernel.img; DK=/mnt/us/kernels/diags_kernel.img                        
EM="No linux kernels found in $IN" # Error Main
ED="No diags kernel found in $IN" # Error Diags
echo "Searching for linux kernels in $IN ..."                        
HD="$(dd if=$IN bs=$BS skip=$S1 count=1 2>$DN|hexdump -C|grep -B2 Linux-|cut -b-60)"
[[ "$HD" == "" ]]&& echo $EM && exit                                                 
set $(echo $HD); [[ $# -lt 16 ]]&& echo $EM && exit
shift 13; BO=$(((64+0x$1$2$3$4+$BS-1)/$BS))
dd if=$IN of=$MK bs=$BS skip=$S1 count=$BO && echo "~> $MK"
HD="$(dd if=$IN bs=$BS skip=$S2 count=1 2>$DN|hexdump -C|grep -B2 Linux-|cut -b-60)" 
[[ "$HD" == "" ]]&& echo $ED && exit                                                 
set $(echo $HD); [[ $# -lt 16 ]]&& echo $ED && exit
shift 13; BO=$(((64+0x$1$2$3$4+$BS-1)/$BS))
dd if=$IN of=$DK bs=$BS skip=$S2 count=$BO && echo "~> $DK"  