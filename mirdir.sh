#!/bin/bash
module load envvar/1.0
module load prod_util/2.0.10

#sdate=2025060415
#sdate=2025060415

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

exp=rrfs_det_prep_cyc_10
wkdir=/lfs/h2/emc/ptmp/emc.lam/Shun.Liu/$exp
cd $wkdir
rm -f mirrordet*.sh

# total 7 files
fl=`ls -1 $wkdir/*`
desdir=/lfs/h2/emc/stmp/emc.lam/$exp
for ifl in $fl; do
  i=$((i+1))
  echo $ifl,$i
  cd $wkdir
  cp MIRROR_det.sh mirrordet${i}.sh

  target=$ifl
  sed -i "s|TARGET|${target}|g" mirrordet${i}.sh
  sed -i "s|THISDATE|${thisdate}|g" mirrordet${i}.sh
  sed -i "s|DESDIR|${desdir}|g" mirrordet${i}.sh
  qsub mirrordet${i}.sh
done

exit
