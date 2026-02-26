#PBS -N test_gsi
#PBS -j oe
#PBS -S /bin/bash
#PBS -q devhigh
#PBS -A RRFS-DEV
#PBS -l walltime=00:25:00
#PBS -l place=vscatter:excl,select=60:ncpus=128:ompthreads=16:mem=500G
#PBS -l debug=true
##PBS -j oe -o test.log

set -x

rundir=/lfs/f2/t2o/ptmp/emc/Shun.Liu/stmp/rrfs/rrfs_analysis_gsi_16_v1.0/det/rrfs_det_analysis_gsi_16.debug
cd $rundir

rrfsdir=/lfs/h2/emc/lam/noscrub/emc.lam/rrfs/ecflow/rrfs-workflow
source ${rrfsdir}/versions/build.ver
source  ${rrfsdir}/versions/run.ver

#module purge
#module use  ${rrfsdir}/modulefiles
#module load build_wcoss2_intel
#module use  ${rrfsdir}/modulefiles/tasks/wcoss2
#module load analysis_gsi.local
#
module reset
module use -a /apps/ops/para/nco/modulefiles/core
module load prod_util/${prod_util_ver}
module load prod_envir/${prod_envir_ver}

module load intel/${intel_ver}
module load craype/${craype_ver}
module load python/${python_ver}
module load cray-mpich/${cray_mpich_ver}
module load cray-pals/${cray_pals_ver}
module load hdf5-D/${hdf5_ver}
module load netcdf-D/${netcdf_ver} 
module load pnetcdf-D/${pnetcdf_ver}
module load cfp/${cfp_ver}  
module load bacio/${bacio_ver}
module load w3emc/${w3emc_ver}
module load sp/${sp_ver} 
module load ip/${ip_ver}
module load nemsio/${nemsio_ver}
module load ncdiag-A/${ncdiag_ver} 
module load libjpeg/${libjpeg_ver}
module load crtm/${crtm_ver}
module load udunits/${udunits_ver} 
module load gsl/${gsl_ver}
module load nco/${nco_ver}
module load cfp/${cfp_ver}


#ulimit -s unlimited
#ulimit -a

set -x -u -e
echo "start time:"
date

#rundir=/lfs/h2/emc/lam/noscrub/emc.lam/Shun.Liu/test/anal_conv_dbz_gsi_spinup_coldstart
#rundir=/lfs/h3/emc/lam/noscrub/emc.lam/stmp/rrfs/v1.0.0/rrfs_det_analysis_gsi_test

rm -f pe0*
rm -f obs_input*
rm -f stdout
rm -f stderr
rm -f fort.2*
#rm -f berror_prewgt_reg_vIntrp.dat
rm -f satbias_out.int
#rm -f anl_grid.480.3950.2700
#rm -f xnorm_new.480.1351.1976

#rm -f fv3_dynvars
#rm -f fv3_phyvars
#rm -f fv3_tracer
#rm -f fv3_sfcdata
#
bkpath=./bk3

mv  ${bkpath}/fv_core.res.tile1.nc     fv3_dynvars
mv  ${bkpath}/fv_tracer.res.tile1.nc   fv3_tracer
mv  ${bkpath}/sfc_data.nc              fv3_sfcdata
mv  ${bkpath}/phy_data.nc             fv3_phyvars
#cp  ${bkpath}/fv3_grid_spec      fv3_grid_spec
#cp  ${bkpath}/fv3_dynvars .
#cp  ${bkpath}/fv3_sfcdata .
#cp  ${bkpath}/fv3_phyvars .
#cp  ${bkpath}/fv3_tracer .


#cp ./background/* .
#cp ./background/* .

#EXEC=./gsi.x
#EXEC=/lfs/h2/emc/lam/noscrub/emc.lam/rrfs/v1.0.0/rrfs-workflow/exec/gsi.x
EXEC=${rrfsdir}/exec/gsi.x_new
#EXEC=/lfs/h2/emc/da/noscrub/Shun.Liu/GSI/build/src/gsi/gsi.x
#EXEC=/lfs/h2/emc/lam/noscrub/emc.lam/rrfs/v0.9.2/rrfs-workflow/sorc/gsi/build/src/gsi/gsi.x
APRUN="mpiexec -n 480 -ppn 8 --cpu-bind core --depth 16"
#APRUN="mpiexec -n 480 -ppn 16 --cpu-bind core --depth 8"
#APRUN="mpiexec -n 360 -ppn 4 --cpu-bind core --depth 16 --label"
#APRUN="mpiexec -n 480 -ppn 4 --cpu-bind core --depth 16"

#ulimit -s unlimited
#ulimit -a
export FI_OFI_RXM_SAR_LIMIT=3145728
export OMP_STACKSIZE=500M
export OMP_NUM_THREADS=16

#mpiexec -n 480 -ppn 8 --cpu-bind core --depth 16 ./gsi.x
mpiexec -n 480 -ppn 8 --cpu-bind core --depth 16 ${EXEC} <gsiparm.anl > stdout 2> stderr
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
