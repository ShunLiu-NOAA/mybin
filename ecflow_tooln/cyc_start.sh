
mydate=20260304
mydatem1=20260304
cyc=19
cyc06=19
#com=/lfs/f2/t2o/ptmp/emc/Shun.Liu/com/rrfs/v1.0
#com=/lfs/f2/t2o/ptmp/emc/Shun.Liu/com/rrfs/v1.0
com=/lfs/f2/t2o/ptmp/emc/para/com/rrfs/v1.0
mir=/lfs/h1/ops/para/com/rrfs/v1.0
mir1=/lfs/h2/emc/stmp/emc.lam/com/rrfs/v1.0
#mir=/lfs/h3/emc/lam/noscrub/ecflow/ptmp/emc.lam/ecflow_rrfs/para/com/rrfs/v1.0

rm -fr $com/rrfs.${mydate}/$cyc
mkdir -p $com/rrfs.${mydate}/$cyc
cd $com/rrfs.${mydate}/$cyc
ln -sf $mir/rrfs.${mydate}/$cyc/* .

#cd $com/rrfs.${mydate}/$cyc/forecast/RESTART
#ln $mir1/rrfs.${mydate}/$cyc/forecast/RESTART/* .


rm -fr $com/rrfs.${mydate}/${cyc}_spinup
mkdir -p $com/rrfs.${mydate}/${cyc}_spinup
cd  $com/rrfs.${mydate}/${cyc}_spinup
ln -sf $mir/rrfs.${mydate}/${cyc}_spinup/* . 

exit

mkdir -p $com/enkfrrfs.${mydate}/$cyc
cd $com/enkfrrfs.${mydate}/$cyc
ln -sf $mir/enkfrrfs.${mydate}/$cyc/* .
#ln -sf $mir/enkfrrfs.${mydate}/${cyc06} .

mkdir -p $com/satbias
cd $com/satbias
cp $mir/satbias/rrfs.*.${mydate}${cyc}* .

mkdir -p $com/HOURLY_HWP/hourly_hwp.${mydate}
cd $com/HOURLY_HWP/hourly_hwp.${mydate}
cp $mir/HOURLY_HWP/hourly_hwp.${mydate}/*.nc .

mkdir -p $com/RAVE_INTP/rave_intp.${mydate}
cd $com/RAVE_INTP/rave_intp.${mydate}
cp $mir/RAVE_INTP/*${mydate}/*.nc .

mkdir -p $com/surface
cd $com/surface
ln -sf $mir/surface/${mydatem1}.* .

exit

exit

# need lbcs if on development machine
