module load ecflow/5.6.0.11
#export ECF_PORT=34104
export ECF_PORT=32035
export ECF_HOST=cdecflow01
#34104

#load defs
cd /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/ecflow/rrfs-workflow/ecf/defs

ecflow_client --host $ECF_HOST --port $ECF_PORT --replace=/emc_rrfs_dev rrfs_prod.def false force

exit

for cyc in $(seq -w 15 15); do
g_cyc_tmp=$(( (10#$cyc / 6) * 6 ))
g_cyc=$(printf "%02d" $g_cyc_tmp)
ecflow_client --host $ECF_HOST --port $ECF_PORT --requeue=force /emc_rrfs_dev/primary/${g_cyc}/rrfs/v1.0/${cyc}/prep/det
done
