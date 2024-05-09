#!/bin/bash
#PBS -A RRFS-DEV
#PBS -q devmax
#PBS -l walltime=00:45:00
##PBS -l select=60:mpiprocs=128:ncpus=128
#PBS -l select=60:mpiprocs=8:ompthreads=16:ncpus=128 
##PBS -l place=vcatter:exclhost
#PBS -l place=excl
#PBS -N test_gsi
#PBS -j oe -o test.log


#/lfs/h2/emc/da/noscrub/Shun.Liu/rrfs/testD/ufs-srweather-app/regional_workflow/ush/load_modules_run_task.sh run_anal_gsi /lfs/h2/emc/da/noscrub/Shun.Liu/rrfs/testD/ufs-srweather-app/regional_workflow/jobs/JREGIONAL_RUN_ANAL

source /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/v0.9.2/rrfs-workflow/versions/build.ver
source /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/v0.9.2/rrfs-workflow/versions/run.ver

module purge
module use /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/v0.9.2/rrfs-workflow/modulefiles
module load build_wcoss2_intel
module use /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/v0.9.2/rrfs-workflow/modulefiles/tasks/wcoss2
module load run_analysis_gsi.local.lua

ulimit -s unlimited
ulimit -a

set -x -u -e
echo "start time:"
date

rundir=/lfs/h2/emc/lam/noscrub/emc.lam/Shun.Liu/test/anal_conv_dbz_gsi_spinup_coldstart
cd $rundir

rm -f pe0*
rm -f obs_input*
rm -f stdout
rm -f stderr
rm -f fort.2*

#rm -f fv3_dynvars
#rm -f fv3_phyvars
#rm -f fv3_tracer
#rm -f fv3_sfcdata
#
bkpath=./bk

#cp  ${bkpath}/fv_core.res.tile1.nc     fv3_dynvars
##cp  ${bkpath}/fv_tracer.res.tile1.nc   fv3_tracer
#cp  ${bkpath}/sfc_data.nc              fv3_sfcdata
#cp  ${bkpath}/phy_data.nc             fv3_phyvars
#cp  ${bkpath}/fv3_grid_spec      fv3_grid_spec

#cp ./background/* .
#cp ./background/* .

#EXEC=./gsi.x
#EXEC=/lfs/h2/emc/lam/noscrub/emc.lam/rrfs/v0.9.2/rrfs-workflow/exec/gsi.x
EXEC=/lfs/h2/emc/lam/noscrub/emc.lam/rrfs/v0.9.2/rrfs-workflow/sorc/gsi/build/src/gsi/gsi.x
APRUN="mpiexec -n 480 -ppn 8 --cpu-bind core --depth 16"
#APRUN="mpiexec -n 480 -ppn 16 --cpu-bind core --depth 8"
#APRUN="mpiexec -n 360 -ppn 4 --cpu-bind core --depth 16 --label"
#APRUN="mpiexec -n 480 -ppn 4 --cpu-bind core --depth 16"
export FI_OFI_RXM_SAR_LIMIT=3145728
export OMP_STACKSIZE=500M
export OMP_NUM_THREADS=16
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

???END
