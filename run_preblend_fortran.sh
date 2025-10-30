#!/bin/bash
#PBS -N test_preblending
#PBS -j oe
#PBS -o preblend_fortran.out
#PBS -l select=2:mpiprocs=64:ompthreads=2:ncpus=128:mem=500gb
##PBS -l select=2:mpiprocs=128:ompthreads=1:ncpus=128:mem=500gb
#PBS -l place=excl
#PBS -A RRFS-DEV
#PBS -q devhigh
#PBS -l walltime=000:15:00

set -x

MAKE_ICS="YES"

start0=$(date +%s)
start=$(date +%s)
export PS4='+ $SECONDS + '
export PYTHONUNBUFFERED=1
export EXP_NAME="preblend_fortran_test"
mkdir -p $PBS_O_WORKDIR/$EXP_NAME
do_copy="YES"
#do_copy="NO"
cdate="2025060919"
#dir="/lfs/h2/emc/lam/noscrub/Ming.Hu/test/preblend/case/2025060919"
dir="/lfs/f2/t2o/ptmp/emc/Shun.Liu/stmp//rrfs_ics_19_v1.0_new/enkf/m001/rrfs_enkf_make_ics_mem001_19.213224246.cbqs01"
dir="/lfs/f2/t2o/ptmp/emc/Shun.Liu/stmp/rrfs/rrfs_ics_07_v1.0/enkf/m001/rrfs_enkf_make_ics_mem001_07.222824884.cbqs01"
dir="/lfs/f2/t2o/ptmp/emc/Shun.Liu/stmp/rrfs/rrfs_ics_07_v1.0/enkf/m001/rrfs_enkf_make_ics_mem001_4Ming"
#mpiexec -n 128 -ppn 64 --cpu-bind core --depth 2 /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/ecflow/rrfs-workflow/exec/fv3lam_pre_blending.exe
rrfsv1="/lfs/h2/emc/lam/noscrub/emc.lam/rrfs/ecflow"

module purge
cd $rrfsv1/rrfs-workflow
source versions/run.ver
module use modulefiles
module load build_wcoss2_intel
module load tasks/wcoss2/make_ics.local.lua
module list

cd $dir
#cd $PBS_O_WORKDIR/$EXP_NAME
#if [[ $do_copy == "YES" ]]; then
#    echo -ne "Copying files..............\r"
#    # GDAS FILES
#    cp ${dir}/out.atm.tile7.nc ./out.atm.tile7.nc
#    cp ${dir}/gfs_ctrl.nc      ./gfs_ctrl.nc
#
#    # RRFS FILES
#    #cp ./${dir}/fv_core.res.tile1.nc   ./fv_core.res.tile1.nc
#    #cp ./${dir}/fv_tracer.res.tile1.nc ./fv_tracer.res.tile1.nc
#    cp ${dir}/fv_core.res.nc         ./fv_core.res.nc
#    echo "Copying files.............. Done."
#fi

# FIX FILES
#CRES="C3463"

#DO_ENS_BLENDING="TRUE"
#EXTRN_MDL_NAME_ICS="GDASENKF"
#NCORES_PER_NODE=128
#end=$(date +%s)
#echo "Elapsed Time (1): $((end - start)) seconds"
#
#start=$(date +%s)
#  echo "Pre-Blending Starting."
  ulimit -s unlimited
  export OMP_STACKSIZE=600M #8*[3951*{65+67+66}]*96/1048576 = 600804864/1048576 = 573 MB
  export FI_OFI_RXM_SAR_LIMIT=3145728
  export FI_MR_CACHE_MAX_COUNT=0
  export MPICH_OFI_STARTUP_CONNECT=1
  export OMP_NUM_THREADS=2
#
#  CRES="C3463"
#  # Required FIX files
#  cp $dir/${CRES}_grid.tile7.nc .
#  cp $dir/${CRES}_oro_data.tile7.halo0.nc .
#  cp $dir/fv_core.res.nc .
#  cp /lfs/h2/emc/lam/noscrub/Ming.Hu/test/preblend/data/cold2warm_tqp.nc .
#  cp /lfs/h2/emc/lam/noscrub/Ming.Hu/test/preblend/data/cold2warm_all.nc .
#
#  # Shortcut the file names
#  echo "Elapsed Time (2): $((end - start)) seconds"
#
#  # Run convert coldstart files to fv3 restart (rotate winds and remap).
#  start=$(date +%s)
#  echo "Going in chgres_cold2fv3 now."
#  cp  /lfs/h2/emc/lam/noscrub/Ming.Hu/rrfs/v0.9.2/rrfs-workflow/exec/fv3lam_pre_blending.exe .
#  mpiexec -n 64 -ppn 32 --cpu-bind core --depth 4 ./fv3lam_pre_blending.exe
   cp /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/para/packages/fix_rrfs_20250623/gsi/RRFS_NA_3km/cold2warm_all.nc .
   mpiexec -n 128 -ppn 64 --cpu-bind core --depth 2 /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/ecflow/rrfs-workflow/exec/fv3lam_pre_blending.exe
   #mpiexec -n 256 -ppn 128 --cpu-bind core --depth 1 /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/ecflow/rrfs-workflow/exec/fv3lam_pre_blending.exe
#
#  end=$(date +%s)
#  echo "Elapsed Time (3): $((end - start)) seconds"
#
#end=$(date +%s)
#echo "Total Elapsed Time: $((end - start0)) seconds"
#end=$(date +%Y%m%d%H%M)
