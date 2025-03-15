#!/bin/bash
module load envvar/1.0
module load prod_util/2.0.10

for fhr in $(seq -f "%02g" 02 21)
do
  echo $fhr
  thisdate=$fhr
  fhr1=$(printf "%02d" $((10#$fhr - 1)))
  echo $fhr, $fhr1
  
  cp mir_sfc.sh mir_sfc_${thisdate}.sh
  sed -i "s|THISDATE|${thisdate}|g" mir_sfc_${thisdate}.sh
  sed -i "s|DATEm1|${fhr1}|g" mir_sfc_${thisdate}.sh
  qsub mir_sfc_${thisdate}.sh

done

exit

