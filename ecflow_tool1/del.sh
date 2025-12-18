
rrfsdir=/lfs/f2/t2o/ptmp/emc/Shun.Liu/stmp/rrfs
find $rrfsdir -type d -path '${rrfsdir}/rrfs_*' -mmin +480 -exec rm -rf {} +

#find ./ -type d -mmin +480 -exec rm -rf {} +
