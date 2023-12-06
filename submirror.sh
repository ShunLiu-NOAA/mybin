#!/bin/bash
module load envvar/1.0
module load prod_util/2.0.10

thisdate=`$MDATE`
echo $thisdate

flnm=$1 

thisdir=`pwd`
cd $thisdir

#rm -f /lfs/h2/emc/ptmp/emc.lam/mirror/rrfs_mirror.out
mkdir -p  /lfs/h2/emc/ptmp/emc.lam/mirror
mkdir -p /lfs/h2/emc/ptmp/emc.lam/Shun.Liu
cp $dnbns/bin/mirror.sh mirror1.sh
target=$thisdir/$flnm
sed -i "s|TARGET|${target}|g" mirror1.sh
sed -i "s|THISDATE|${thisdate}|g" mirror1.sh

exit

qsub mirror1.sh
