module purge
module load lsf/10.1
module use /gpfs/dell3/usrx/local/dev/emc_rocoto/modulefiles/
module load ruby/2.5.1 rocoto/1.3.0rc2 #rocoto/1.2.4

cyctime=202106272300
#rocotostat -w FV3LAM_wflow.xml -d FV3LAM_wflow.db -c all

#taskname=anal_gsi_input_f000
taskname=run_fcst_f000
taskname=prep_start_prod
rocotocheck -w FV3LAM_wflow.xml -d FV3LAM_wflow.db -c $cyctime -t $taskname
rocotorewind -w FV3LAM_wflow.xml -d FV3LAM_wflow.db -c $cyctime -t $taskname
rocotoboot -w FV3LAM_wflow.xml -d FV3LAM_wflow.db -c $cyctime -t $taskname

#rocotocheck -w FV3LAM_wflow.xml -d FV3LAM_wflow.db -c $cyctime -t anal_gsi_input_prod
#rocotoboot -w FV3LAM_wflow.xml -d FV3LAM_wflow.db -c $cyctime -t anal_gsi_input_prod
#rocotoboot -w FV3LAM_wflow.xml -d FV3LAM_wflow.db -c $cyctime -t prep_start_f000
#rocotocomplete -w FV3LAM_wflow.xml -d FV3LAM_wflow.db -c $cyctime -t anal_gsi_input_f000
#rocotoboot -w FV3LAM_wflow.xml -d FV3LAM_wflow.db -c $cyctime -t prep_start_f000
#rocotoboot -w FV3LAM_wflow.xml -d FV3LAM_wflow.db -c $cyctime -t run_fcst_f000
exit
#rocotocheck -w FV3LAM_wflow.xml -d FV3LAM_wflow.db -c 202105180000 -t get_extrn_lbcs
rocotocheck -w FV3LAM_wflow.xml -d FV3LAM_wflow.db -c 202105180000 -t get_extrn_ics
rocotoboot -w FV3LAM_wflow.xml -d FV3LAM_wflow.db -c 202105180000 -t get_extrn_ics
#rocotocheck -w FV3LAM_wflow.xml -d FV3LAM_wflow.db -c 202105180000 -t prep_coldstart

#rocotostat -w FV3LAM_wflow.xml -d FV3LAM_wflow.db -c all
#rocotocheck -w FV3LAM_wflow.xml -d FV3LAM_wflow.db -c 202105140300 -t anal_gsi_input
#rocotostat -w /gpfs/dell2/emc/modeling/noscrub/Ming.Hu/rrfs/RRFS_dev2/FV3LAM_wflow.xml -d /gpfs/dell2/emc/modeling/noscrub/Ming.Hu/rrfs/RRFS_dev2/FV3LAM_wflow.db -c all
