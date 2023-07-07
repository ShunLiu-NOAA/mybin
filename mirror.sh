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

src=TARGET
target=cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/ptmp/emc.lam/Shun.Liu/
rsync -arv $src $target

exit
