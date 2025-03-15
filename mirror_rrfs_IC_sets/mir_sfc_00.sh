##!/bin/bash

#PBS -A RRFS-DEV
#PBS -q dev_transfer
#PBS -l select=1:ncpus=1:mem=2G
#PBS -l walltime=5:59:00
#PBS -j oe -o log_sfc_00.out
#PBS -N m_sfc_00

set -x

module purge
module load envvar/1.0
set -x

echo $HOSTNAME
primary=$(echo $HOSTNAME | cut -c1-6)
#if [ "$primary" == "clogin" ]; then
if [ "$primary" == "cdxfer" ]; then
  desmachine=emc.lam@ddxfer.wcoss2.ncep.noaa.gov
else
  desmachine=emc.lam@cdxfer.wcoss2.ncep.noaa.gov
fi

src=/lfs/h3/emc/lam/noscrub/emc.lam/rrfs/v1.1.5/nwges/surface
target=$desmachine:/lfs/h3/emc/lam/noscrub/emc.lam/rrfs/v1.1.5/nwges/surface

mydate=00
#mydate=24123
cd $src

#20240509.220000.sfc_data.nc.2024050921
ifl=20240509.010000.sfc_data.nc.2024050900
rsync -arv ${target}/$ifl $ifl
ifl=20240509.020000.sfc_data.nc.2024050901
rsync -arv ${target}/$ifl $ifl
exit
ifl=20240509.030000.sfc_data.nc.2024050902
rsync -arv ${target}/$ifl $ifl
ifl=20240509.040000.sfc_data.nc.2024050903
rsync -arv ${target}/$ifl $ifl
ifl=20240509.050000.sfc_data.nc.2024050904
rsync -arv ${target}/$ifl $ifl
ifl=20240509.060000.sfc_data.nc.2024050905
rsync -arv ${target}/$ifl $ifl
ifl=20240509.070000.sfc_data.nc.2024050905
rsync -arv ${target}/$ifl $ifl
ifl=20240509.080000.sfc_data.nc.2024050905
rsync -arv ${target}/$ifl $ifl
ifl=20240509.090000.sfc_data.nc.2024050905
rsync -arv ${target}/$ifl $ifl


fl=`ls -1d enkfgdas.${mydate}*`
for ifl in $fl
do
rsync -arv $ifl $target
done

echo "done", ${mydate}

exit






version=${VER}
export BASEDIR="/lfs/h3/emc/lam/noscrub/emc.lam/stmp/rrfs/${version}"
export COMOUT_BASEDIR="/lfs/h2/emc/ptmp/emc.lam/rrfs/${version}/prod"
export LOG_DIR="/lfs/h2/emc/ptmp/emc.lam/rrfs/${version}/logs"
export NWGES_BASEDIR="/lfs/h3/emc/lam/noscrub/emc.lam/rrfs/${version}/nwges"
#export BASEDIR="/lfs/h3/emc/rrfstemp/rrfs/${version}"
#export COMOUT_BASEDIR="/lfs/h3/emc/rrfstemp/rrfs/${version}/prod"
#export LOG_DIR="/lfs/h3/emc/rrfstemp/rrfs/${version}/logs"
#export NWGES_BASEDIR="/lfs/h3/emc/rrfstemp/rrfs/${version}/nwges"
export OUTDIR=${BASEDIR}

export ARCHIVEDIR="/NCEPDEV/emc-meso/2year/emc.lam/rrfs_retro/${version}"

days=${DAYSIN}
HH=${CYCSIN}
mems=${MEMSIN}

export day=${days:6:2}
export year=${days:0:4}
export month=${days:4:2}

export OUT=${OUTDIR}/log.archive.ensda_nwges.${year}${month}${day}${HH}.${SAVETYPE}

#----------------------------------------
dateval=`date`
echo "Started archive at "$dateval >> ${OUT} 2>&1

echo "Archiving RRFS retro output for ${year}${month}${day}" >> ${OUT}
/usr/local/bin/hsi mkdir -p $ARCHIVEDIR/$year/$month/$day >> ${OUT} 2>&1

for imem in ${mems}
do 
    memchar=mem00${imem}
    if [[ -e ${NWGES_BASEDIR}/$year$month$day$HH/${memchar}/fcst_fv3lam ]] ;then
      echo "Initial conditions at ${year}${month}${day}${HH}..." >> ${OUT} 2>&1
      cd ${NWGES_BASEDIR}
      htar -chvf $ARCHIVEDIR/$year/$month/$day/nwges_ens_$year$month$day${HH}_${memchar}_${SAVETYPE}.tar $year$month$day${HH}/${memchar}/fcst_fv3lam >> ${OUT} 2>&1
    fi
done

for imem in ${mems}
do 
    memchar=mem00${imem}
    if [[ -e ${NWGES_BASEDIR}/$year$month$day$HH/${memchar}/lbcs ]] ;then
      echo "Initial conditions at ${year}${month}${day}${HH}..." >> ${OUT} 2>&1
      cd ${NWGES_BASEDIR}
      htar -chvf $ARCHIVEDIR/$year/$month/$day/lbcs_ens_$year$month$day${HH}_${memchar}_${SAVETYPE}.tar $year$month$day${HH}/${memchar}/lbcs >> ${OUT} 2>&1
    fi
done

dateval=`date`
echo "Completed archive at "$dateval >> ${OUT} 2>&1

exit 0

