#PBS -A RRFS-DEV
#PBS -q dev_transfer
#PBS -l select=1:mpiprocs=1:ncpus=1
#PBS -l walltime=05:55:00
#PBS -N get_retro
#PBS -j oe -o get_retro.log
set -x

mkdir -p /lfs/h2/emc/ptmp/emc.lam/Shun.Liu
cd /lfs/h2/emc/ptmp/emc.lam/Shun.Liu

#for ihh in $(seq -f "%03g" 0 12)
#for ihh in {12..21..3}

mon=03
year=2025
COMINgfs=/lfs/f2/t2o/ptmp/emc/ptmp/emc.lam/ecflow_rap_ctl/para/dcom
cd $COMINgfs
for iday in $(seq -f "%02g" 09 10)
do
filedir=${COMINgfs}/202503${iday}
mkdir -p $filedir
cd $filedir
htar xf /NCEPPROD/hpssprod/runhistory/rh${year}/${year}${mon}/${year}${mon}${iday}/dcom_202503${iday}.tar ./af_viirs/EFIRE-VIIRSI_v1r3_npp_*.txt
#htar tvf /NCEPPROD/hpssprod/runhistory/rh${year}/${year}${mon}/${year}${mon}${iday}/dcom.202503${iday}.tar ./af_viirs/EFIRE-VIIRSI_v1r3_npp_*.txt

done
