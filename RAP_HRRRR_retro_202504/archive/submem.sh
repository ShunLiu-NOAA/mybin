#!/bin/bash
module load envvar/1.0
module load prod_util/2.0.10

#for fhr in $(seq -f "%02g" 01 80)
for fhr in $(seq -f "%03g" 01 80)
do
  echo $fhr
  MEM=$fhr
  
  cp mir_mem.sh mir_mem_${MEM}.sh
  sed -i "s|MEM|${MEM}|g" mir_mem_${MEM}.sh
  qsub mir_mem_${MEM}.sh

done

exit

