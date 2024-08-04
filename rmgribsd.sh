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

cd /lfs/h2/emc/ptmp/emc.lam/rrfs/v0.9.6/prod/rrfs.20240506/18

cyc=18
mkdir tmp
mkdir tmp1
cd tmp
for fhr in $(seq -f "%02g" 0 60)
do 
  echo $fhr
  cp ../rrfs.t${cyc}z.prslev.f0${fhr}.conus.grib2 rrfs.t${cyc}z.prslev.f0${fhr}.conus_bad.grib2
  wgrib2 rrfs.t${cyc}z.prslev.f0${fhr}.conus_bad.grib2 -match ave -not MASSDEN -grib rrfs_conus_piece1_f0${fhr}.grib2
  wgrib2 rrfs.t${cyc}z.prslev.f0${fhr}.conus_bad.grib2 -not ave -grib rrfs_conus_piece2_f0${fhr}.grib2
  cat rrfs_conus_piece1_f0${fhr}.grib2 rrfs_conus_piece2_f0${fhr}.grib2 > ../tmp1/rrfs.t${cyc}z.prslev.f0${fhr}.conus.grib2
done

exit


 20 mkdir -p /lfs/h2/emc/ptmp/Benjamin.Blake/rrfs/na/prod/rrfs.${PDY}/${cyc}
 21 cd /lfs/h2/emc/ptmp/Benjamin.Blake/rrfs/na/prod/rrfs.${PDY}/${cyc}
 22 cp /lfs/h2/emc/ptmp/emc.lam/rrfs/na/prod/rrfs.${PDY}/${cyc}/rrfs.t${cyc}z.prslev.f0${fhr}.conus.grib2 rrfs.t${cyc}z.prslev.f0${fhr}.conus_bad.grib2
 23 wgrib2 rrfs.t${cyc}z.prslev.f0${fhr}.conus_bad.grib2 -match ave -not MASSDEN -grib rrfs_conus_piece1_f0${fhr}.grib2
 24 wgrib2 rrfs.t${cyc}z.prslev.f0${fhr}.conus_bad.grib2 -not ave -grib rrfs_conus_piece2_f0${fhr}.grib2
 25 cat rrfs_conus_piece1_f0${fhr}.grib2 rrfs_conus_piece2_f0${fhr}.grib2 > rrfs.t${cyc}z.prslev.f0${fhr}.conus.grib2
 26 
 27 mkdir -p /lfs/h2/emc/stmp/${USER}
 28 mkdir -p /lfs/h2/emc/stmp/${USER}/3panel_nam/${PDY}/${cyc}
 29 cd /lfs/h2/emc/stmp/${USER}/3panel_nam/${PDY}/${cyc}
 30 
 31 python /lfs/h2/emc/lam/noscrub/${USER}/rrfs_graphics/scripts/plot_allvars_nam.py $CDATE $fhr $domset
 32 
 33 date
 34 
 35 exit

