#!/bin/bash

#PBS -A RRFS-DEV
#PBS -q dev_transfer
#PBS -l select=1:ncpus=1:mem=8G
#PBS -l walltime=3:02:00
#PBS -j oe -o /lfs/h2/emc/ptmp/emc.lam/mirror/rrfs_hpss_get_THISDATE.out
#PBS -N HPSS_mirror

module purge
module load envvar/1.0
set -x

echo $HOSTNAME

cd THISDIR

htar xf /NCEPDEV/emc-da/1year/Shun.Liu/TARGET.tar
#/usr/local/bin/htar -xf /NCEPDEV/emc-meso/1year/emc.lam/tmp/TARGET.tar

exit
