#!/bin/bash
#set -x
. 1.sh

#echo $FCST_LEN_HRS
echo ${FCST_LEN_HRS_CYCLES[-1]}
echo ${FCST_LEN_HRS_CYCLES[1]}
echo ${FCST_LEN_HRS_CYCLES[2]}
for i in ${!FCST_LEN_HRS_CYCLES[@]}
do
  echo $i
  FCST_LEN_HRS_CYCLES[i]=1
done
echo "==============="
echo ${FCST_LEN_HRS_CYCLES[-1]}
echo ${FCST_LEN_HRS_CYCLES[1]}
echo ${FCST_LEN_HRS_CYCLES[2]}
