##!/bin/bash

#PBS -A RRFS-DEV
#PBS -q dev_transfer
#PBS -l select=1:ncpus=1:mem=2G
#PBS -l walltime=5:59:00
#PBS -j oe -o log_gdas.out
#PBS -N m_mem_MEM

set -x

module purge
module load envvar/1.0
set -x

tcyc="00 06 12 18"
fdate=14
srcdir=/lfs/h2/emc/ptmp/russ.treadon/prsonde
target=/lfs/h3/emc/lam/noscrub/emc.lam/com/gfs/v16.3
thisdate=202503${fdate}
for cyc in $tcyc ; do
  mkdir -p ${target}/enkfgdas.${thisdate}/${cyc}/atmos/memMEM
  grbfile=${srcdir}/enkfgdas.${thisdate}/${cyc}/atmos/memMEM/gdas.t${cyc}z.atmf006.nc
  grbfile2=${srcdir}/enkfgdas.${thisdate}/${cyc}/atmos/memMEM/gdas.t${cyc}z.atmf009.nc
  cp $grbfile ${target}/enkfgdas.${thisdate}/${cyc}/atmos/memMEM
  cp $grbfile2 ${target}/enkfgdas.${thisdate}/${cyc}/atmos/memMEM
done

exit






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

