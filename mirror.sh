#!/bin/bash

#PBS -A RRFS-DEV
#PBS -q dev_transfer
#PBS -l select=1:ncpus=1:mem=8G
#PBS -l walltime=3:02:00
#PBS -j oe -o /lfs/h2/emc/ptmp/emc.lam/mirror/rrfs_mirror_THISDATE.out
#PBS -N RRFS_mirror

module purge
module load envvar/1.0
set -x

echo $HOSTNAME
primary=$(echo $HOSTNAME | cut -c1-6)
#if [ "$primary" == "clogin" ]; then
if [ "$primary" == "cdxfer" ]; then
  desmachine=emc.lam@ddxfer.wcoss2.ncep.noaa.gov
else
  desmachine=emc.lam@cdxfer.wcoss2.ncep.noaa.gov
fi


src=TARGET
target=$desmachine:/lfs/h2/emc/ptmp/emc.lam/Shun.Liu/
rsync -arv $src $target

exit
