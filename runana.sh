#!/bin/bash
#PBS -A RRFS-DEV
#PBS -q pridev
#PBS -l walltime=01:45:00
##PBS -l select=60:mpiprocs=128:ncpus=128
#PBS -l select=1:mpiprocs=16:ompthreads=8:ncpus=128 
##PBS -l place=vcatter:exclhost
#PBS -l place=excl
#PBS -N test_gsi
#PBS -j oe -o test.log


#/lfs/h2/emc/da/noscrub/Shun.Liu/rrfs/testD/ufs-srweather-app/regional_workflow/ush/load_modules_run_task.sh run_anal_gsi /lfs/h2/emc/da/noscrub/Shun.Liu/rrfs/testD/ufs-srweather-app/regional_workflow/jobs/JREGIONAL_RUN_ANAL

source /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/v0.7.9/rrfs-workflow/versions/build.ver
source /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/v0.7.9/rrfs-workflow/versions/run.ver

module purge
module use /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/v0.7.9/rrfs-workflow/modulefiles
module load build_wcoss2_intel
module use /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/v0.7.9/rrfs-workflow/modulefiles/tasks/wcoss2
module load run_anal_gsi.local
module list

#/lfs/h2/emc/lam/noscrub/emc.lam/rrfs/v0.7.9/rrfs-workflow/ush/load_modules_run_task.sh run_anal_gsi /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/v0.7.9/rrfs-workflow/jobs/JRRFS_RUN_ANAL

ulimit -s unlimited
ulimit -a

set -x -u -e
echo "start time:"
date

rundir=/lfs/f2/t2o/ptmp/emc/stmp/emc.lam/rrfs/v0.7.9/2024022200/anal_conv_dbz_gsi
rundir=/lfs/f2/t2o/ptmp/emc/stmp/emc.lam/rrfs/v0.7.9/2024022200/ensmean/observer_gsi

cd $rundir

rm -f pe0*
rm -f obs_input*
rm -f stdout

#rm -f fv3_dynvars
#rm -f fv3_phyvars
#rm -f fv3_tracer
#rm -f fv3_sfcdata
#
bkpath=./background

#cp  ${bkpath}/fv_core.res.tile1.nc     fv3_dynvars
##cp  ${bkpath}/fv_tracer.res.tile1.nc   fv3_tracer
#cp  ${bkpath}/sfc_data.nc              fv3_sfcdata
#cp  ${bkpath}/phy_data.nc             fv3_phyvars
#cp  ${bkpath}/fv3_grid_spec      fv3_grid_spec

#cp ./background/* .

EXEC=./gsi.x
#EXEC=/lfs/h2/emc/lam/noscrub/emc.lam/rrfs/v0.6.9/ufs-srweather-app/src/gsi/build/src/gsi/gsi.x
EXEC=/lfs/h2/emc/lam/noscrub/emc.lam/rrfs/v0.7.9/rrfs-workflow/exec/gsi.x
#APRUN="mpiexec -n 480 -ppn 8 --cpu-bind core --depth 16"
APRUN="mpiexec -n 16 -ppn 16 --cpu-bind core --depth 8"
#APRUN="mpiexec -n 360 -ppn 4 --cpu-bind core --depth 16 --label"
#APRUN="mpiexec -n 480 -ppn 4 --cpu-bind core --depth 16"
export FI_OFI_RXM_SAR_LIMIT=3145728
export OMP_STACKSIZE=500M
export OMP_NUM_THREADS=8
#export OMP_PROC_BIND=close
#export OMP_PLACES=threads

$APRUN $EXEC <gsiparm.anl > stdout 2> stderr
echo "end time:"
date
exit

cd /lfs/h2/emc/lam/save/emc.lam/Shun.Liu/code/rrfs_debug_tool
expdir=/lfs/h2/emc/lam/noscrub/emc.lam/Shun.Liu/test/gsi/exp8
mkdir $expdir

sleep 30
cp test.log $expdir
cp /lfs/h2/emc/ptmp/emc.lam/Shun.Liu/anal_conv_gsi_spinup/stdout $expdir

