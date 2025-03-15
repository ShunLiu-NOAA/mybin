#!/bin/bash
module load envvar/1.0
module load prod_util/2.0.10

for fhr in $(seq -f "%02g" 02 30)
do
  echo $fhr
  thisdate=$fhr
  
  cp mir_mem.sh mir_mem_${thisdate}.sh
  sed -i "s|THISDATE|${thisdate}|g" mir_mem_${thisdate}.sh
  qsub mir_mem_${thisdate}.sh

done

exit

