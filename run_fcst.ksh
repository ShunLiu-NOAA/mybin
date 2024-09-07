#! /bin/sh
#PBS -A RRFS-DEV
#PBS -q devmax
#PBS -l select=52:mpiprocs=64:ompthreads=2:ncpus=128
#PBS -l walltime=02:30:00
#PBS -N n3v85_run_fcst_prod
#PBS -j oe -o run_fcst_prod_n3v85_2024030421.log
#PBS -l place=excl

SRCDIR=/lfs/h2/emc/lam/noscrub/emc.lam/rrfs/v0.9.7/rrfs-workflow
cd $SRCDIR
module purge
source versions/run.ver
module use $SRCDIR/modulefiles
module load build_wcoss2_intel
module use $SRCDIR/modulefiles/tasks/wcoss2
module load run_fcst.local

module list

ulimit -s unlimited
ulimit -a

    export MPICH_ABORT_ON_ERROR=1
    export MALLOC_MMAP_MAX_=0
    export MALLOC_TRIM_THRESHOLD_=134217728
    export MPICH_REDUCE_NO_SMP=1
    export FOR_DISABLE_KMP_MALLOC=TRUE
    export FI_OFI_RXM_RX_SIZE=40000
    export FI_OFI_RXM_TX_SIZE=40000
    export MPICH_OFI_STARTUP_CONNECT=1
    export MPICH_OFI_VERBOSE=1
    export MPICH_OFI_NIC_VERBOSE=1

export KMP_AFFINITY=scatter
export OMP_NUM_THREADS=2
export OMP_STACKSIZE=1G


FV3_EXE=${SRCDIR}/exec/ufs_model
case=2023120400
workdir=/lfs/h2/emc/ptmp/emc.lam/rrfs/case
workdir=/lfs/f2/t2o/ptmp/emc/stmp/emc.lam/rrfs/v0.9.7/2024051801/fcst_fv3lam
cd $workdir
#cp -r fcst_fv3lam_base fcst_fv3lam
#cd fcst_fv3lam

rm -f ufs_model
cp ${FV3_EXE} ufs_model

#-------------------------------------------
# submit the job
#-------------------------------------------
mpiexec -n 3328 -ppn 64 --cpu-bind core --depth 2  ufs_model

exit

