
mydate=20250926
mydatem1=20250926
cyc=06
cyc06=18
#com=/lfs/f2/t2o/ptmp/emc/Shun.Liu/com/rrfs/v1.0
com=/lfs/f2/t2o/ptmp/emc/ptmp/emc.lam/rrfs/v1.2.0/nwges
mir=/lfs/h2/emc/stmp/emc.lam/com/rrfs/v1.0
#mir=/lfs/h3/emc/lam/noscrub/ecflow/ptmp/emc.lam/ecflow_rrfs/para/com/rrfs/v1.0

gesdir=$com/${mydate}${cyc}
mkdir -p ${gesdir}/fcst_fv3lam
cd ${gesdir}/fcst_fv3lam
ln -sf $mir/rrfs.${mydate}/$cyc/forecast/* .

mkdir -p ${gesdir}/fcst_fv3lam_spinup
cd ${gesdir}/fcst_fv3lam_spinup
ln -sf $mir/rrfs.${mydate}/$cyc/forecast/* .

set -x
for mem in $(seq -w 01 30); do
  mkdir -p ${gesdir}/mem00$mem/fcst_fv3lam
  cd ${gesdir}/mem00$mem/fcst_fv3lam
  ln -sf $mir/enkfrrfs.${mydate}/$cyc/m0${mem}/forecast/* .
done

exit

mkdir -p $com/satbias
cd $com/satbias
cp $mir/satbias/rrfs.*.${mydate}${cyc}* .

mkdir -p $com/HOURLY_HWP
cd $com/HOURLY_HWP
cp $mir/HOURLY_HWP/${mydate}.*.nc .
cp $mir/HOURLY_HWP/${mydatem1}.*.nc .

mkdir -p $com/RAVE_INTP
cd $com/RAVE_INTP
cp $mir/RAVE_INTP/*${mydate}*.nc .


mkdir -p $com/satbias
cd $com/satbias
cp $mir/satbias/rrfs.*.${mydate}${cyc}* .

mkdir -p $com/surface
cd $com/surface
ln -sf $mir/surface/${mydatem1}.* .

exit

mkdir -p $com/HOURLY_HWP
cd $com/HOURLY_HWP
cp $mir/HOURLY_HWP/${mydate}.*.nc .
cp $mir/HOURLY_HWP/${mydatem1}.*.nc .

mkdir -p $com/RAVE_INTP
cd $com/RAVE_INTP
cp $mir/RAVE_INTP/*${mydate}*.nc .

# need lbcs if on development machine
