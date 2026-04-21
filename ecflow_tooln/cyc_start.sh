
mydate=20260413
mydatem1=20260413
cyc=10
cyc06=10
#com=/lfs/f2/t2o/ptmp/emc/Shun.Liu/com/rrfs/v1.0
#com=/lfs/f2/t2o/ptmp/emc/Shun.Liu/com/rrfs/v1.0
#com=/lfs/f2/t2o/ptmp/emc/para/com/rrfs/v1.0
com=/lfs/h3/emc/lam/noscrub/emc.lam/com/rrfs/v1.0
mir0=/lfs/h1/ops/para/com/rrfs/v1.0
mir=/lfs/h2/emc/stmp/emc.lam/com/rrfs/v1.0
mir1=/lfs/h2/emc/stmp/emc.lam/com/rrfs/v1.0
#mir=/lfs/h3/emc/lam/noscrub/ecflow/ptmp/emc.lam/ecflow_rrfs/para/com/rrfs/v1.0

#################################
#  restart files
#################################
rm -fr $com/rrfs.${mydate}/$cyc
mkdir -p $com/rrfs.${mydate}/$cyc
cd $com/rrfs.${mydate}/$cyc
ln -sf $mir0/rrfs.${mydate}/$cyc/* .
ln -sf $mir0/rrfs.${mydate}/$cyc/lbcs .

#cd $com/rrfs.${mydate}/$cyc/forecast/RESTART
#ln $mir1/rrfs.${mydate}/$cyc/forecast/RESTART/* .

mySPIN=true
#mySPIN=false
if [[ "${mySPIN}" == "true" ]]; then
rm -fr $com/rrfs.${mydate}/${cyc}_spinup
mkdir -p $com/rrfs.${mydate}/${cyc}_spinup
cd  $com/rrfs.${mydate}/${cyc}_spinup
ln -sf $mir0/rrfs.${mydate}/${cyc}_spinup/* . 
#ln -sf $mir1/rrfs.${mydate}/${cyc}_spinup/* . 
fi

rm -f $com/enkfrrfs.${mydate}/$cyc
mkdir -p $com/enkfrrfs.${mydate}/$cyc
cd $com/enkfrrfs.${mydate}/$cyc
ln -sf $mir0/enkfrrfs.${mydate}/$cyc/* .
#ln -sf $mir0/enkfrrfs.${mydate}/$cyc/lbcs .
#ln -sf $mir/enkfrrfs.${mydate}/${cyc06} .

#################################
#  other files
#################################
mkdir -p $com/satbias
cd $com/satbias
cp $mir0/satbias/satbias.${mydate}/rrfs.*.${mydate}${cyc}* .

mkdir -p $com/HOURLY_HWP/hourly_hwp.${mydate}
cd $com/HOURLY_HWP/hourly_hwp.${mydate}
cp $mir0/HOURLY_HWP/hourly_hwp.${mydate}/*.nc .

mkdir -p $com/RAVE_INTP/rave_intp.${mydate}
cd $com/RAVE_INTP/rave_intp.${mydate}
cp $mir0/RAVE_INTP/*${mydate}/*.nc .

mkdir -p $com/surface
cd $com/surface
ln -sf $mir0/surface/surface.${mydate}/${mydatem1}.* .

exit

exit

# need lbcs if on development machine
