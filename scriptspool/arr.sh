#!/bin/bash
#set -x
. arr1.sh

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

flpath=/tem/spinup/test

IFS="/"
arr=($flpath)
str=`echo ${flpath[@]} | grep spinup`
echo $str

spinup="spinup"
if grep -q $spinup <<< "$flpath"; then
   echo "it is spinup cycle"
fi
