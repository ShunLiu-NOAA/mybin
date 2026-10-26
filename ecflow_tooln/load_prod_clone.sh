module load ecflow/5.6.0.11

case ${HOSTNAME:0:1} in
  c) export ECF_HOST=cdecflow02 ;;
  d) export ECF_HOST=ddecflow02 ;;
  *) echo "unknown machine: $HOSTNAME" >&2; exit 1 ;;
esac

export ECF_PORT=32035
echo "$HOSTNAME -> $ECF_HOST:$ECF_PORT"

#load defs
cd /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/nco/rrfs-workflow/ush/prod_clone/ecf

ecflow_client --host $ECF_HOST --port $ECF_PORT --load=defs_retro.def
ecflow_client --host $ECF_HOST --port $ECF_PORT --begin=prod_clone

exit

#ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable ECF_INCLUDE /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/prod_clone.v0.0.2/include /prod_clone
#ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable ECF_INCLUDE /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/prod_clone.v0.0.2/include /prod_clone

exit
sleep 10

for cyc in $(seq -w 00 23); do
g_cyc_tmp=$(( (10#$cyc / 6) * 6 ))
g_cyc=$(printf "%02d" $g_cyc_tmp)
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable ECF_INCLUDE /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/ecflow/rrfs-workflow/ecf/include /emc_rrfs_dev/primary/${g_cyc}
#ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable PDY 20250814 /emc_rrfs_dev/primary/${g_cyc}/rrfs/v1.0/${cyc}
#ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable QUEUE devhigh /emc_rrfs_dev/primary/${cyc}
#ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable MACHINE_SITE development /emc_rrfs_dev}/primary/${cyc}
done

exit

#ecflow_client --host $ECF_HOST --port $ECF_PORT --delete=/emc_rrfs_dev_01
#trigger :TIME >= 1520 and ../../fsm/jrrfs_fsm:release_det_prep_cyc
