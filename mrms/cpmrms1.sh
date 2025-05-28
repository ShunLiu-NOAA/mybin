#!/bin/bash

module purge
module load envvar/1.0
module load prod_util/2.0.10


#thisday=20240912
#cyc=15

#CURRENTDATE=`$NDATE`
CURRENTDATE=2024051900

for hourback in $(seq -f "%02g" 00 120)
do
  YYYYMMDDHH=`$NDATE -$hourback $CURRENTDATE`
  echo $YYYYMMDDHH
  PDY=`echo ${YYYYMMDDHH} | cut -c1-8`
  cyc=`echo ${YYYYMMDDHH} | cut -c9-10`
  #srcdir=/lfs/f2/t2o/ptmp/emc/stmp/emc.lam/rrfs/v0.9.7/${YYYYMMDDHH}/process_radarref/00
  srcdir=/lfs/h2/emc/ptmp/emc.lam/rrfs/v1.1.5/prod/rrfs.$PDY/$cyc
  nwhold=/lfs/h2/emc/lam/noscrub/emc.lam/nwges/mrms/$PDY
  mkdir -p $nwhold
  rsync $srcdir/rrfs.mrms.${YYYYMMDDHH}.nc $nwhold/rrfs.mrms.${YYYYMMDDHH}.nc
  #rsync $srcdir/Gridded_ref.nc $nwhold/rrfs.mrms.${YYYYMMDDHH}.nc

done


exit
srcdir=/lfs/f2/t2o/ptmp/emc/stmp/emc.lam/rrfs/v0.9.1/${thisday}${cyc}/process_radarref/00
nwhold=/lfs/h2/emc/lam/noscrub/emc.lam/nwges/mrms/$thisday

mkdir -p $nwhold
cp $srcdir/Gridded_ref.nc $nwhold/rrfs.mrms.${thisday}${cyc}.nc
