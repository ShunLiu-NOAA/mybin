module load ecflow/5.6.0.11

echo $HOSTNAME
primary=$(echo $HOSTNAME | cut -c1-6)
if [ "$primary" == "cdxfer" ]; then
  export ECF_PORT=32035
  export ECF_HOST=cdecflow01
else
  export ECF_PORT=32035
  export ECF_HOST=ddecflow02
fi

#load defs
cd /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/nco/rrfs-workflow/ecf/defs

#ecflow_client --host $ECF_HOST --port $ECF_PORT --replace /para rrfs_nco_para.def false force
ecflow_client --host $ECF_HOST --port $ECF_PORT --replace /para rrfs_nco_para.def

exit

for cyc in $(seq -w 15 15); do
g_cyc_tmp=$(( (10#$cyc / 6) * 6 ))
g_cyc=$(printf "%02d" $g_cyc_tmp)
ecflow_client --host $ECF_HOST --port $ECF_PORT --requeue=force /emc_rrfs_dev/primary/${g_cyc}/rrfs/v1.0/${cyc}/prep/det
done
