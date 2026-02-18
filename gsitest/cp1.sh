
bkdir=bk2
rm -fr bk2
mkdir -p $bkdir
sleep 3
cp ./background/fv_tracer.res.tile1.nc ./$bkdir &
cp ./background/phy_data.nc ./$bkdir &
cp ./background/fv_core.res.tile1.nc ./$bkdir &
cp ./background/sfc_data.nc ./$bkdir &

