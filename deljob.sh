qq | grep rrfs_mirr | awk '{print $1}' > zzz
ids=`cat zzz`
for ii in $ids; do
  echo $ii
  qdel $ii
done

