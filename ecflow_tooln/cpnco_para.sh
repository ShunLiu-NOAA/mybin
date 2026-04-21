#!/bin/bash
module load envvar/1.0
module load prod_util/2.0.10

#sdate=2025060415
sdate=2026032323

thistime=`$NDATE -3 $sdate`

echo $thistime
mydate=${thistime:0:8}
cyc=${thistime:8:10}
echo $mydate $cyc

thisdate=$thistime

thistime1=`$NDATE -2 $sdate`
mydate1=${thistime1:0:8}
cyc1=${thistime1:8:10}

mkdir -p  /lfs/h2/emc/ptmp/emc.lam/mirror
mkdir -p /lfs/h2/emc/ptmp/emc.lam/Shun.Liu

#cd /lfs/h2/emc/lam/noscrub/emc.lam/Shun.Liu/mirrior
#rm -f mirrordet*.sh

# total 7 files
fl=`ls -1 /lfs/h1/ops/para/com/rrfs/v1.0/rrfs.${mydate}/${cyc}/forecast/RESTART/${mydate1}.${cyc1}*`
desdir=/lfs/h2/emc/stmp/emc.lam/com/rrfs/v1.0/rrfs.${mydate}/${cyc}/forecast/RESTART
mkdir -p $desdir
for ifl in $fl; do
  i=$((i+1))
  echo $ifl,$i
  cp $ifl $desdir &
done
