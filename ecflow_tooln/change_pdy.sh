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

#ecflow_client --host $ECF_HOST --port $ECF_PORT --load=rrfs_prod.def
#ecflow_client --host $ECF_HOST --port $ECF_PORT --begin=emc_rrfs_dev

set -x
for cyc in $(seq -w 00 11); do
g_cyc_tmp=$(( (10#$cyc / 6) * 6 ))
g_cyc=$(printf "%02d" $g_cyc_tmp)
#ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable ECF_INCLUDE /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/ecflow/rrfs-workflow/ecf/include /emc_rrfs_dev/primary/${g_cyc}
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable PDY 20260410 /para/primary/${g_cyc}/rrfs/v1.0/${cyc}z
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable PDY 20260410 /para/primary/${g_cyc}/rrfs/v1.0/cycle_end
#ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable PDY 20250804 /emc_rrfs_dev_${cyc}/primary/${cyc}
#ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable QUEUE devhigh /emc_rrfs_dev/primary/${cyc}
#ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable MACHINE_SITE development /emc_rrfs_dev}/primary/${cyc}
done

#ecflow_client --host $ECF_HOST --port $ECF_PORT --delete=/emc_rrfs_dev_01
