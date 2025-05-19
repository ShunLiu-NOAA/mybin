#!/bin/bash

curtime=$(date +"%Y%m%d.%H%M")
curhour=$(date +"%Y%m%d.%H")
curdate=$(date +"%Y%m%d")

#curdatem1=`date "+%Y%m%d%H" --date="1 hour ago"`
#curdatem2=`date "+%Y%m%d%H" --date="2 hour ago"`
#curdatem3=`date "+%Y%m%d%H" --date="3 hour ago"`

curdatem1=$(date -d '1 hour ago' +"%H")
curdatem2=$(date -d '2 hour ago' +"%H")
curdatem3=$(date -d '3 hour ago' +"%H")

echo $curdatem1, $curdatem2, $curdatem3

logdir=/lfs/h2/emc/ptmp/emc.lam/rrfs/v0.9.1/logs/enkfrrfs.$curdate
cd $logdir

#allcyc=$(ls -1d * | grep -Eo '^[0-9]+')
allcyc='$curdatem1 $curdatem2 $curdatem3'
echo $allcyc


allblock=0

for cyc in ${allcyc}; do
echo $cyc
cd $cyc
logfile=FV3LAM_wflow_n3enkf91.log

#str1=$(grep 'Submission of cldanl_nonvar_prod_mem0001 succeeded' "$logfile")
#str1=$(grep 'Submitting cldanl_nonvar_prod_mem0001' "$logfile")
str1=$(grep 'Submitting enkf_radarref' "$logfile")
str2=$(grep 'run_fcst_prod_mem0001, ' "$logfile" | grep 'SUCCEEDED (F)')
str3=$(grep 'run_fcst_prod_long_mem0001, ' "$logfile" | grep 'SUCCEEDED (F)')

# Initialize defaults
jobstatus=0
starttime="none"
endtime="none"

# Check str1
if [ -n "$str1" ]; then
    starttime=$(echo "$str1" | awk '{print $1, $2}')
    jobstatus=1

    if [ -n "$str2" ]; then
        endtime=$(echo "$str2" | awk '{print $1, $2}')
        jobstatus=0
    fi

    if [ -n "$str3" ]; then
        endtime=$(echo "$str3" | awk '{print $1, $2}')
        jobstatus=0
    fi
fi

# Output results
#jobstatus=0 is no block, jobstatus=1 is block submission
echo "str1: $str1", $starttime, $endtime
echo "str2: $str2"
echo "str3: $str3"
echo "Job Status: $jobstatus"
echo `pwd`
set -x
if [ "$jobstatus" -eq 0 ]; then
  echo "in if block"
  echo $curtime, "block start time and end time: $starttime, $endtime"
  echo $curtime, block start time and end time: $starttime, $endtime >> blocklist_$cyc
else
  allblock=1
  echo $curtime, "block start time and end time: $starttime, $endtime", "   BLOCKed" >> blocklist_$cyc
fi
set +x

rm -f noblock_post
if [ "$jobstatus" -eq 0 ]; then
  echo "print" "jobstatus"
  echo $curtime, "no block" > noblock_post
fi

cd ..
done

echo 'all block', $allblock, $curtime
cd $logdir
rm -f noblock_post
if [ "$allblock" -eq 0 ]; then
  echo $curtime, "no block" > noblock_post
  echo $curtime, block start time and end time: $starttime, $endtime >> blocklist_$cyc
else
  echo $curtime, "block start time and end time: $starttime, $endtime", "   BLOCKed" >> blocklist_$cyc
fi



exit
