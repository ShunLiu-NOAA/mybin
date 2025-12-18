
mydate=20250801
mydatem1=20250731
cyc=14
#com=/lfs/f2/t2o/ptmp/emc/Shun.Liu/com/rrfs/v1.0
com=/lfs/f2/t2o/ptmp/emc/Shun.Liu/com/rrfs/v1.0
mir=/lfs/h2/emc/stmp/emc.lam/com/rrfs/v1.0
#mir=/lfs/h3/emc/lam/noscrub/ecflow/ptmp/emc.lam/ecflow_rrfs/para/com/rrfs/v1.0

mkdir -p $com/satbias
cd $com/satbias
cp $mir/satbias/rrfs.*.${mydate}${cyc}* .
exit

mkdir -p $com/surface
cd $com/surface
ln -sf $mir/surface/${mydatem1}.* .

mkdir -p $com/HOURLY_HWP
cd $com/HOURLY_HWP
cp $mir/HOURLY_HWP/${mydate}.*.nc .
cp $mir/HOURLY_HWP/${mydatem1}.*.nc .

mkdir -p $com/RAVE_INTP
cd $com/RAVE_INTP
cp $mir/RAVE_INTP/*${mydate}*.nc .

# need lbcs if on development machine
