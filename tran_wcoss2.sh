#!/bin/bash
#BSUB -e export.stderr.%J
#BSUB -o export.stdout.%J
#BSUB -J export
#BSUB -q dev_transfer
#BSUB -W 05:00
#BSUB -P GFS-DEV
#BSUB -R affinity[core(1)]
#BSUB -M 100

#export a file from WCOSS(mars/venus) to WCOSS2 (dogwood)
cd /gpfs/dell2/emc/modeling/noscrub/Shun.Liu/tide/tmpnwprd
file=`ls -1 *tz`
for ifile in $file
do
  scp -pr $ifile Shun.Liu@cdxfer01.wcoss2.ncep.noaa.gov:/lfs/h2/emc/da/noscrub/Shun.Liu/wcoss/tmpnwprd
done
