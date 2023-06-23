#!/bin/bash

#PBS -A RRFS-DEV
#PBS -q dev_transfer
#PBS -l select=1:ncpus=1:mem=8G
#PBS -l walltime=0:02:00
#PBS -j oe -o /lfs/h2/emc/ptmp/emc.lam/mirror/rrfs_mirror.out
#PBS -N RRFS_mirror

module purge
module load envvar/1.0
set -x

src=/lfs/h2/emc/lam/noscrub/emc.lam/Shun.Liu/gsi_regression/develop/install/bin/enkf.x
target=ddxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/ptmp/emc.lam/Shun.Liu/
rsync -arv $src $target

exit
