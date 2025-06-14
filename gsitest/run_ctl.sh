#!/bin/bash
#PBS -A RRFS-DEV
#PBS -q pridev
#PBS -l walltime=00:45:00
#PBS -l select=60:mpiprocs=128:ncpus=128
##PBS -l select=60:mpiprocs=8:ompthreads=16:ncpus=128 
##PBS -l place=vcatter:exclhost
#PBS -l place=excl
#PBS -N test_gsi
#PBS -j oe -o test.log


module reset
#gsidir=/lfs/h2/emc/lam/noscrub/emc.lam/Shun.Liu/GSI_rrfs_release
#gsidir=/lfs/h2/emc/lam/noscrub/emc.lam/Shun.Liu/GSI_rrfs_release
gsidir=/lfs/h2/emc/lam/noscrub/emc.lam/Shun.Liu/GSI_debug_fix
moddir=${gsidir}/modulefiles
module use $moddir
module load gsi_wcoss2.intel.lua
module load envvar/1.0
module load cray-pals/1.2.2

gsiexec=${gsidir}/build/src/gsi/gsi.x


ulimit -s unlimited
ulimit -a

set -x -u -e
echo "start time:"
date
rundir=/lfs/h3/emc/lam/noscrub/emc.lam/stmp/rrfs/v1.0.0/rrfs_det_analysis_gsi_test
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
APRUN="mpiexec -n 480 -ppn 8 --cpu-bind core --depth 16"
export FI_OFI_RXM_SAR_LIMIT=3145728
export OMP_STACKSIZE=500M
export OMP_NUM_THREADS=16

$APRUN $EXEC <gsiparm.anl > pr-stdout 2> pr-stderr
echo "end time:"
date
exit

