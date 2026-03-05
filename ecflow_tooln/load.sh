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

ecflow_client --host $ECF_HOST --port $ECF_PORT --load=rrfs_nco_para.def
ecflow_client --host $ECF_HOST --port $ECF_PORT --begin=para

#exit
sleep 10

for cyc in $(seq -w 00 23); do
g_cyc_tmp=$(( (10#$cyc / 6) * 6 ))
g_cyc=$(printf "%02d" $g_cyc_tmp)
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable ECF_INCLUDE /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/nco/rrfs-workflow/ecf/include /para/primary/${g_cyc}
#ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable PDY 20250814 /emc_rrfs_dev/primary/${g_cyc}/rrfs/v1.0/${cyc}
#ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable QUEUE devhigh /emc_rrfs_dev/primary/${cyc}
#ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable MACHINE_SITE development /emc_rrfs_dev}/primary/${cyc}
done

exit

#ecflow_client --host $ECF_HOST --port $ECF_PORT --delete=/emc_rrfs_dev_01
#trigger :TIME >= 1520 and ../../fsm/jrrfs_fsm:release_det_prep_cyc
