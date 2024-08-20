#!/bin/bash

#You can use find command to find all your files and execute touch on every found file using -exec
#  find . -type f -exec touch {} +
#If you want to filter your result only for text files, you can use
#  find . -type f -name "*.txt" -exec touch {} +
                                 

cd /lfs/h2/emc/ptmp/emc.lam/rrfs/v0.9.7/prod/rrfs.20240510
find . -type f -exec touch {} +
touch *
exit
fldir=`ls`
echo $fldir
for ifldir in $fldir
do
  echo $ifldir
  cd ./$ifldir
  touch *
  cd ..
done

