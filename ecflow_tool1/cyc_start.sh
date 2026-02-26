
mydate=20260222
mydatem1=20260222
cyc=15
cyc06=15
#com=/lfs/f2/t2o/ptmp/emc/Shun.Liu/com/rrfs/v1.0
com=/lfs/f2/t2o/ptmp/emc/Shun.Liu/com/rrfs/v1.0
mir=/lfs/h1/ops/para/com/rrfs/v1.0
#mir=/lfs/h2/emc/stmp/emc.lam/com/rrfs/v1.0
#mir=/lfs/h3/emc/lam/noscrub/ecflow/ptmp/emc.lam/ecflow_rrfs/para/com/rrfs/v1.0

mkdir -p $com/rrfs.${mydate}/$cyc
cd $com/rrfs.${mydate}/$cyc
ln -sf $mir/rrfs.${mydate}/$cyc/* .
#ln -sf $mir/rrfs.${mydate}/${cyc}_spinup .
cd  $com/rrfs.${mydate}
ln -sf $mir/rrfs.${mydate}/${cyc} ./${cyc}_spinup
#ln -sf $mir/rrfs.${mydate}/${cy06} .

mkdir -p $com/enkfrrfs.${mydate}/$cyc
cd $com/enkfrrfs.${mydate}/$cyc
ln -sf $mir/enkfrrfs.${mydate}/$cyc/* .
#ln -sf $mir/enkfrrfs.${mydate}/${cyc06} .

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
