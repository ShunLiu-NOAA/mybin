module load ecflow/5.6.0.11
#export ECF_PORT=34104

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


for cyc in $(seq -w 00 06 23); do
g_cyc_tmp=$(( (10#$cyc / 6) * 6 ))
g_cyc=$(printf "%02d" $g_cyc_tmp)
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter=change defstatus complete /para/primary/${g_cyc}/rrfs/v1.0/${cyc}z/ensf
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter=change defstatus complete /para/primary/${g_cyc}/rrfs/v1.0/${cyc}z/firewx
done

exit
