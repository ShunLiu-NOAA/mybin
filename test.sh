#!/bin/bash

#set -x

##############
# test array number
##############

fldir=/lfs/h2/emc/ptmp/emc.lam/rrfs/v0.5.0/prod/rrfs.20230523/00
numfile=`ls $fldir/rrfs.*.prslev.f*.conus_3km.grib2 | wc | awk '{ print $1 }'`

if [ $numfile > 8 ]; then
   echo $numfile
fi


indx="03 04 05"
cyc=08

for i in $indx
do
  if [ "$cyc" == $i ]; then
    echo $cyc
  fi 
done 
exit

spinup=( "03" "04" 05" "06" "07" "08")

#for i in  
#do 
#done

topline=`grep bash test.sh | head -n1 | tail -n1`

if [ "$topline" == "DEAD" ]; then
  echo $topline
else
  echo non string
fi

exit

exit

CYCL_HRS_SPINSTART=( \
)

if [ ${#CYCL_HRS_SPINSTART[@]} -gt 0 ]; then
echo there are parameters
fi

hh=8
tt="${CYCL_HRS_SPINSTART[${hh#0}]}"

echo $tt
exit


for i in $(seq -f "%03g" 0 80)
do
#ifl=/gpfs/dell1/nco/ops/com/gfs/prod/enkfgdas.20211118/00/atmos/mem064/gdas.t00z.atmf006.nc
  echo $i
done

#############
# extract substring
#  ${string:P:L}
#Here P is a number that indicates the starting index of the substring and L is the length of the substring. 
#If you omit the L parameter then the rest of the string is returned, starting from position P
#############
mydate=2021082700
echo ${mydate:0:8}
exit

##############
# test array number
##############

CYCL_HRS_SPINSTART=( \
"1" \
"2" \
"3" \
"4" \
"5" \
"6" \
"7" \
"8" \
"9" \
)

hh=8
tt="${CYCL_HRS_SPINSTART[${hh#0}]}"

echo $tt
exit

##############
# test case
##############
test=23

case $test in
11)
taskname=get_extrn_lbcs
;;
12)
taskname=make_ics
;;
13)
taskname=make_lbcs_00
;;
21)
taskname=prep_cyc_spinup
;;
22)
taskname=anal_gsi_input_spinup
;;
23)
taskname=run_fcst_spinup
;;
31)
taskname=prep_cyc_prod
;;
32)
taskname=anal_gsi_input_prod
;;
33)
taskname=run_fcst_prod
;;
esac


##############
# test if
##############
CRES=C3359
if [ $CRES = 'C3359' ]; then
  echo $CRES
fi
exit

##############
# test sed
##############
files=`/usr/bin/ls -1 1*`
for  file in $files
do
sed 's/.bashrc/bin\'/loadp'/g' $file > $file.new
exit
mv $file.new $file
done


files='drive_plots.xml'
for  file in $files
do
sed '171,177s/fv3lamdax/rdas/; 171,177s/fv3lam/rrfs/' $file > $file.new
mv $file.new $file
done


exit

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
