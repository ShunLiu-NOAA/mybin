#!/bin/bash

#PBS -A RRFS-DEV
#PBS -q dev_transfer
#PBS -l select=1:ncpus=1:mem=8G
#PBS -l walltime=1:00:00
#PBS -j oe -o /lfs/h2/emc/ptmp/emc.lam/mirror/rrfs_mirror.out
#PBS -N RRFS_mirror

module purge
module load envvar/1.0
set -x

# mirror  RRFSUPP files from prod to dev
#PDY=20220319
#cyc=12

mysite=$(cat /etc/cluster_name)
primary=$(head -1 /lfs/h1/ops/prod/config/prodmachinefile | cut -d ":" -f2-)
backup=$(head -2 /lfs/h1/ops/prod/config/prodmachinefile | tail -1 | cut -d ":" -f2-)

for minsback  in 60 120 180 240 300 360 420
do
  YYYYMMDDHH=`date +"%Y%m%d%H" -d "${CURRENTDATE} ${minsback} minute ago"`
  currentdate=`date +"%Y%m%d %H"`

  PDY=`echo ${YYYYMMDDHH} | cut -c1-8`
  cyc=`echo ${YYYYMMDDHH} | cut -c9-10`

  fcstlength=18
  if [ $cyc -eq 00 -o $cyc -eq 12 -o $cyc -eq 06 -o $cyc -eq 18 ] ; then
    export fcstlength="60"
  fi

  echo $fcstlength
done

source=/lfs/h2/emc/ptmp/emc.lam/rrfs/conus/prod/rrfs_a.${PDY}/${cyc}
destination==/lfs/h2/emc/ptmp/emc.lam/rrfs_dogwood/conus/prod/rrfs_a.${PDY}/${cyc}
desmachine=emc.lam@cdxfer.wcoss2.ncep.noaa.gov
ssh $desmachine mkdir -p "$destination"

exit

devdir=/lfs/h2/emc/ptmp/emc.lam/rrfs/v0.3.8_dogwood


#rsync -arv cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/lam/noscrub/emc.lam/FIX_RRFS/smoke_dust /lfs/h2/emc/ptmp/emc.lam/mirror
rsync -arv /lfs/h2/emc/ptmp/emc.lam/rrfs/v0.3.8/logs/rrfs_a.20230308/16.tar cdxfer.wcoss2.ncep.noaa.gov:/lfs/h2/emc/ptmp/emc.lam/mirror
exit

exit
