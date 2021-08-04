
fldir=`ls -1d 20*`

basepath='/work/noaa/da/Shun.Liu/ptmp/DARTH_v20210413'

for ifldir in $fldir
do
# echo $ifldir
  diagdir=$basepath/$ifldir/GSI_out
  iodadir=$basepath/$ifldir/IODA
  numdiag=`ls -1d $ifldir/GSI_out/*.nc4 | wc |cut -c1-10`
  numioda=`ls -1d $ifldir/IODA/*.nc4 | wc | cut -c1-10`
  echo $ifldir,     ,$diagdir,$numdiag,$iodadir,$numioda
done
