


stalist='72562 72634 72558 72662 72645 72672 72476 72659'

rm -f exit_sta*
for icyc in $(seq -f "%02g" 0 23)
do
cp /lfs/f2/t2o/ptmp/emc/ptmp/emc.lam/ecflow_rap_ctl/para/com/obsproc/v1.2/rap.20250311/rap.t${icyc}z.prepbufr.tm00 prepbufr
a.out > station_$icyc

for ista in $stalist
do
  grep $ista station_$icyc >> exit_sta_$icyc
done

done
