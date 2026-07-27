
#rrfsdir=/lfs/f2/t2o/ptmp/emc/Shun.Liu/stmp/rrfs
rrfsdir=/lfs/f2/t2o/ptmp/emc/Shun.Liu/stmp/prod_clone
find $rrfsdir -type d -path '${rrfsdir}/rrfs_*' -mmin +6000 -exec rm -rf {} +

#find ./ -type d -mmin +480 -exec rm -rf {} +
