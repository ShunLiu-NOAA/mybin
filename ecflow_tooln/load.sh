module load ecflow/5.6.0.14
#export ECF_PORT=34104

case ${HOSTNAME:0:1} in
  c) export ECF_HOST=cdecflow02 ;;
  d) export ECF_HOST=ddecflow02 ;;
  *) echo "unknown machine: $HOSTNAME" >&2; exit 1 ;;
esac

export ECF_PORT=32035
echo "$HOSTNAME -> $ECF_HOST:$ECF_PORT"

#load defs
cd /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/nco/rrfs-workflow/ecf/defs
cd /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/nco/rrfs-workflow/ecf/defs/retro

#ecflow_client --host $ECF_HOST --port $ECF_PORT --load=rrfs_nco_para.def
ecflow_client --host $ECF_HOST --port $ECF_PORT --load=rrfs_retro.def
ecflow_client --host $ECF_HOST --port $ECF_PORT --begin=para

exit
sleep 10

ecflow_client --host cdecflow02 --port 32035 --alter=add variable ECF_LOGHOST "cdecflow02" /para
ecflow_client --host cdecflow02 --port 32035 --alter=add variable ecflow_ver "5.6.0" /para

for cyc in $(seq -w 00 23); do
g_cyc_tmp=$(( (10#$cyc / 6) * 6 ))
g_cyc=$(printf "%02d" $g_cyc_tmp)
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable ECF_INCLUDE /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/nco/rrfs-workflow/ecf/include /para/primary/${g_cyc}
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable PDY 20240506 /para/primary/${g_cyc}/rrfs/v1.0/${cyc}z
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable PDY 20240506 /para/primary/${g_cyc}/rrfs/v1.0/cycle_end

#ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable PDY 20250814 /emc_rrfs_dev/primary/${g_cyc}/rrfs/v1.0/${cyc}
#ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable QUEUE devhigh /emc_rrfs_dev/primary/${cyc}
#ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable MACHINE_SITE development /emc_rrfs_dev}/primary/${cyc}
done

for cyc in $(seq -w 00 06 23); do
g_cyc_tmp=$(( (10#$cyc / 6) * 6 ))
g_cyc=$(printf "%02d" $g_cyc_tmp)
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter=change defstatus complete /para/primary/${g_cyc}/rrfs/v1.0/${cyc}z/ensf
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter=change defstatus complete /para/primary/${g_cyc}/rrfs/v1.0/${cyc}z/firewx
done


exit

# As emc.lam
for cyc in $(seq -w 00 23); do
ecflow_client --host ddecflow02 --port 32035 --alter=change defstatus complete /para/primary/${g_cyc}/rrfs/v1.0/${cyc}z/ensf
ecflow_client --host ddecflow02 --port 32035 --alter=change defstatus complete /para/primary/${g_cyc}/rrfs/v1.0/${cyc}z/firswx
done

exit

#ecflow_client --host $ECF_HOST --port $ECF_PORT --delete=/emc_rrfs_dev_01
#trigger :TIME >= 1520 and ../../fsm/jrrfs_fsm:release_det_prep_cyc
