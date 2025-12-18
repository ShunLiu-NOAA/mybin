module load ecflow/5.6.0.11
#export ECF_PORT=34104
export ECF_PORT=32035
export ECF_HOST=cdecflow01
#34104

#echo "Suite date: $ECF_DATE, time: $ECF_TIME, clock info: $ECF_CLOCK"
#ecflow_client --host $ECF_HOST --port $ECF_PORT --query variable /emc_rrfs_dev_00/primary/00:ECF_DATE
#ecflow_client --host $ECF_HOST --port $ECF_PORT --query variable /emc_rrfs_dev_00/primary/00:ECF_TIME
#exit

cyc=18
g_cyc_tmp=$(( (10#$cyc / 6) * 6 ))
g_cyc=$(printf "%02d" $g_cyc_tmp)
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs/v1.0/fsm
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs/v1.0/init/det
ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/emc_rrfs_dev/primary/${g_cyc}/rrfs/v1.0/${cyc}/ics/det
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/emc_rrfs_dev/primary/${g_cyc}/rrfs/v1.0/${cyc}/ics/enkf
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs/v1.0/prep/det
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs/v1.0/prep/enkf
exit
