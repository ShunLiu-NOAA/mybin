#!/bin/bash

#PBS -A RRFS-DEV
#PBS -q pridev
#PBS -l select=1:ncpus=1:mem=8G
#PBS -l walltime=1:02:00
#PBS -j oe
#PBS -N rrfs_cpfile

##PBS -j oe -o /lfs/h2/emc/ptmp/emc.lam/mirror/rrfs_mirror_2025070210.out
##PBS -N rrfs_mirror

module purge
module load envvar/1.0
module load prod_util/2.0.10

set -x

#sdate=2026030921
sdate=${DAYSIN}

thistime=$sdate

echo $thistime
mydate=${thistime:0:8}
cyc=${thistime:8:10}
echo $mydate $cyc

thisdate=$thistime

thistime1=`$NDATE +1 $sdate`
mydate1=${thistime1:0:8}
cyc1=${thistime1:8:10}

if [[ "${cyc}" == "19" ]]; then
    cyc="19_spinup"
fi

mkdir -p  /lfs/h2/emc/ptmp/emc.lam/mirror
mkdir -p /lfs/h2/emc/ptmp/emc.lam/Shun.Liu

#cd /lfs/h2/emc/lam/noscrub/emc.lam/Shun.Liu/mirrior
#rm -f mirrordet*.sh

# total 7 files
imem=${MEM}

mySPIN=spinup
if [[ "${mySPIN}" == "spinup" ]]; then
fl=`ls -1 /lfs/h1/ops/para/com/rrfs/v1.0/enkfrrfs.${mydate}/${cyc}/m0${imem}/forecast/RESTART/${mydate1}.${cyc1}*`
desdir=/lfs/h2/emc/stmp/emc.lam/com/rrfs/v1.0/enkfrrfs.${mydate}/${cyc}/m0${imem}/forecast/RESTART

mkdir -p $desdir
for ifl in $fl; do
  i=$((i+1))
  echo $ifl,$i
  cp -p $ifl $desdir
done
fi

fl=`ls -1 /lfs/h1/ops/para/com/rrfs/v1.0/enkfrrfs.${mydate}/${cyc}/m0${imem}/forecast/INPUT/gfs_ctrl.nc`
desdir=/lfs/h2/emc/stmp/emc.lam/com/rrfs/v1.0/enkfrrfs.${mydate}/${cyc}/m0${imem}/forecast/INPUT
mkdir -p $desdir
for ifl in $fl; do
  cp -p $ifl $desdir
done
