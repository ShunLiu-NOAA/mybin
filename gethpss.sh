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
cp $dnbns/bin/htar_get_orig.sh htar_get.sh
#cp htar_sub_orig.sh htar_sub.sh
#target=$thisdir/$flnm
target=$flnm
sed -i "s|TARGET|${target}|g" htar_get.sh
sed -i "s|THISDATE|${thisdate}|g" htar_get.sh
sed -i "s|THISDIR|${thisdir}|g" htar_get.sh

qsub htar_get.sh

exit
