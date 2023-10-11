#!/bin/bash

flnm=$1 

thisdir=`pwd`
cd $thisdir

rm -f /lfs/h2/emc/ptmp/emc.lam/mirror/rrfs_mirror.out
mkdir -p /lfs/h2/emc/ptmp/emc.lam/mirror
cp $dnbns/bin/mirror.sh mirror1.sh
target=$thisdir/$flnm
sed -i "s|TARGET|${target}|g" mirror1.sh

qsub mirror1.sh
