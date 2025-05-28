##!/bin/bash

#PBS -A RRFS-DEV
#PBS -q dev_transfer
#PBS -l select=1:ncpus=1:mem=2G
#PBS -l walltime=5:59:00
#PBS -j oe 
#PBS -N output_rrfs_retro_det_diag

set -x

export BASEDIR="/lfs/h2/emc/lam/noscrub/emc.lam/nwges/mrms"
export OUTDIR=${BASEDIR}

export ARCHIVEDIR="/NCEPDEV/emc-meso/5year/emc.lam/mrms_rrfsv1_grid"

days=${DAYSIN}
#cycs=${CYCSIN}

export day=${days:6:2}
export year=${days:0:4}
export month=${days:4:2}

#----------------------------------------
dateval=`date`
echo "Started archive at "$dateval
echo "Archiving RRFS mrms for ${year}${month}${day}"

#/usr/local/bin/hsi mkdir -p $ARCHIVEDIR/$year/$month

OUT=${OUTDIR}/log.archive.mrms.${year}${month}${day}

cd $BASEDIR

#for onecyc in ${cycs}; do
    onerun=$year$month$day
    echo "Archive files from ${onerun}"
    cd ${BASEDIR}
    #/usr/local/bin/htar -chvf $ARCHIVEDIR/$year/$month/$year$month$day.tar ${onerun}/*mrms* >> ${OUT} 2>&1
    /usr/local/bin/htar -chvf $ARCHIVEDIR/$year$month$day.tar ./${onerun}/* >> ${OUT} 2>&1
#done

dateval=`date`
echo "Completed archive at "$dateval >> ${OUT} 2>&1
exit 0
