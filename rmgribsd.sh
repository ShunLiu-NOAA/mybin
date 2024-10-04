#!/bin/bash
 
date
 
domset='conus'

module load python/3.8.6
module use /lfs/h1/mdl/nbm/save/apps/modulefiles
module load python-modules/3.8.6
module load proj/7.1.0
module load geos/3.8.1
module load libjpeg-turbo/2.1.0
export PYTHONPATH="${PYTHONPATH}:/lfs/h2/emc/lam/noscrub/Benjamin.Blake/python:/lfs/h2/emc/lam/noscrub/Benjamin.Blake/rrfs_graphics/modulefiles"
module load imagemagick/7.0.8-7
module load wgrib2/2.0.8_wmo

#set -x

#ncyc='00 06 12 18'
ncyc='00'
for cyc in $ncyc
do

cd /lfs/h2/emc/ptmp/emc.lam/rrfs/v0.9.7/prod/rrfs.20240530/$cyc

mkdir tmp
mkdir tmp1
mkdir tmp_orig
cd tmp
for fhr in $(seq -f "%02g" 00 60)
do 
  echo $fhr
  cp ../rrfs.t${cyc}z.prslev.f0${fhr}.conus.grib2 rrfs.t${cyc}z.prslev.f0${fhr}.conus_bad.grib2
  mv ../rrfs.t${cyc}z.prslev.f0${fhr}.conus.grib2 ../tmp_orig
  wgrib2 rrfs.t${cyc}z.prslev.f0${fhr}.conus_bad.grib2 -match ave -not MASSDEN -grib rrfs_conus_piece1_f0${fhr}.grib2
  wgrib2 rrfs.t${cyc}z.prslev.f0${fhr}.conus_bad.grib2 -not ave -grib rrfs_conus_piece2_f0${fhr}.grib2
  cat rrfs_conus_piece1_f0${fhr}.grib2 rrfs_conus_piece2_f0${fhr}.grib2 > ../rrfs.t${cyc}z.prslev.f0${fhr}.conus.grib2
done

done

exit


