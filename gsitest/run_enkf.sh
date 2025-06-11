#!/bin/bash
#PBS -A RRFS-DEV
#PBS -q pridev
#PBS -l walltime=00:45:00
#PBS -l select=20:mpiprocs=8:ompthreads=16:ncpus=128
##PBS -l select=60:mpiprocs=8:ompthreads=16:ncpus=128 
##PBS -l place=vcatter:exclhost
##PBS -l place=excl
#PBS -N test_enkf
#PBS -j oe -o enkf.log


#module reset
#gsidir=/lfs/h2/emc/lam/noscrub/emc.lam/Shun.Liu/GSI_rrfs_release
gsidir=/lfs/h2/emc/lam/noscrub/emc.lam/Shun.Liu/GSI_debug_fix
moddir=${gsidir}/modulefiles
module use $moddir
module load gsi_wcoss2.intel.lua
module load envvar/1.0
module load cray-pals/1.2.2

#source /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/v1.1.3/rrfs-workflow/versions/build.ver
#source /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/v1.1.3/rrfs-workflow/versions/run.ver

#gsiexec=${gsidir}/build/src/gsi/gsi.x
gsiexec=${gsidir}/build/src/enkf/enkf.x
#gsiexec=/lfs/h2/emc/lam/noscrub/emc.lam/rrfs/para/packages/rrfs.v1.0.0/exec/enkf.x
#gsiexec=/lfs/h2/emc/lam/noscrub/emc.lam/Shun.Liu/GSI_rrfs_release/build/src/enkf/enkf.x


ulimit -s unlimited
ulimit -a

set -x -u -e
echo "start time:"
date
#rundir=/lfs/h3/emc/lam/noscrub/emc.lam/stmp/rrfs/v1.0.0/anal_conv_dbz_gsi_spinup_zlib
rundir=/lfs/h3/emc/lam/noscrub/emc.lam/stmp/rrfs/v1.0.0/rrfs_enkf_updt_02.201906217.cbqs01
cd $rundir

rm -f pe0*
rm -f obs_input*
rm -f stdout
rm -f stderr
rm -f fort.2*

#rm -f anl_grid.480.3950.2700
#rm -f xnorm_new.480.1351.1976

bkpath=./background

#cp  ${bkpath}/fv3_dynvars .
#cp  ${bkpath}/fv3_sfcdata .
#cp  ${bkpath}/fv3_tracer .


EXEC=$gsiexec
APRUN="mpiexec -n 160 -ppn 8 --cpu-bind core --depth 16"
export FI_OFI_RXM_SAR_LIMIT=3145728
export OMP_STACKSIZE=500M
export OMP_NUM_THREADS=16

$APRUN $EXEC <enkf.nml > pr-stdout 2> pr-stderr
echo "end time:"
date
exit

