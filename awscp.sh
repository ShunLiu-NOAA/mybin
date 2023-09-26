#!/bin/bash

#PBS -A RRFS-DEV
#PBS -q dev_transfer
#PBS -l select=1:ncpus=1:mem=8G
#PBS -l walltime=4:02:00
#PBS -j oe -o /lfs/h2/emc/ptmp/emc.lam/mirror/aws.out
#PBS -N AWS_cp

module purge
module load envvar/1.0
module load awscli/2.7.35
set -x

src=/lfs/h2/emc/lam/noscrub/emc.lam/Shun.Liu/test/anal_conv_dbz_gsi_spinup_all/fv3_mem
#target=$desmachine:/lfs/h2/emc/ptmp/emc.lam/Shun.Liu/

. /lfs/h2/emc/lam/noscrub/Benjamin.Blake/key.bdp

aws s3 cp --recursive $src s3://noaa-rrfs-pds/anal_conv_dbz_gsi_spinup/fv3_mem

exit
