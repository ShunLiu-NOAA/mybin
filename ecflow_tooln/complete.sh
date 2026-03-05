module load ecflow/5.6.0.11
#export ECF_PORT=34104
export ECF_PORT=32035
export ECF_HOST=cdecflow01
#34104

for cyc in $(seq -w 05 05); do
g_cyc_tmp=$(( (10#$cyc / 6) * 6 ))
g_cyc=$(printf "%02d" $g_cyc_tmp)
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter change defstatus complete  /emc_rrfs_dev/primary/${g_cyc}/rrfs/v1.0/${cyc}/post
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter change defstatus complete  /emc_rrfs_dev/primary/${g_cyc}/rrfs/v1.0/${cyc}/product
done

exit

cyc=18
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs/v1.0/fsm
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs/v1.0/init/det
ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs/v1.0/ics/det
ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs/v1.0/ics/enkf
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs/v1.0/prep/det
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs/v1.0/prep/enkf
exit
