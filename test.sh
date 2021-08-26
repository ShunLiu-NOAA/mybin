#!/bin/bash

#set -x

hh=06

#for ((i=0;i<5;i++))
for ((i=0;i<${hh};i++))
do
  echo $i
done
exit

CYCL_HRS_SPINSTART=( \
"06" \
"18" \
)

CYCL_HRS_PRODSTART=( \
"12" \
"00" \
)

tindx="0 1"
for i in $tindx
do 
  cyc_spinstart=${CYCL_HRS_SPINSTART[${i}]}
  cyc_prodstart=${CYCL_HRS_PRODSTART[${i}]}

  if [ ${cyc_prodstart} = 00 ]; then
    cyc_prodstart=24
  fi
  
  if [ $hh -ge $cyc_spinstart -a $hh -le $cyc_prodstart ]; then
    let tm=cyc_prodstart-hh
    tmmark=$(printf "%02d" $tm)
    echo this_cyc: $hh spinup_start:$cyc_spinstart prod_start:$cyc_prodstart tmmark:$tmmark
    break
  else
    echo this is not spinup cycle, no TM value
  fi
done

exit

#for cyc_start in ${CYCL_HRS_PRODSTART[@]}
#do
#done
exit

#if [ $hh -lt 12 ]; then
#  echo $hh
#  let tm=hh-3
#  echo $tm
#  tmmark=$(printf "%02d" $tm)
#  echo $tmmark
#fi

for cyc_start in ${CYCL_HRS_PRODSTART[@]}
do
echo $cyc_start
 if [ ${cyc_start} = 00 ]; then
    cyc_start=24
#else
#   this_cyc_start=$cyc_start
 fi
echo $cyc_start
# if [ $hh -ge $cyc_start ]; then
#   this_spinup_time=$cyc_start
# fi 
done
exit

let tm=hh-this_spinup_time
tmmark=$(printf "%02d" $tm) 
echo $tmmark


exit
jobpre=regional_forecast
BKTYPE=0
if [ ${BKTYPE} = 0 -a ${jobpre} = regional_forecast ]; then
  echo forecast
elif [ "${jobpre}" = "regional_bufrpost" ]; then
  echo bufr
fi
