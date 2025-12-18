module load ecflow/5.6.0.11
#export ECF_PORT=34104
export ECF_PORT=32035
export ECF_HOST=cdecflow01
#34104

#load defs
cd /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/ecflow/rrfs-workflow/ecf/defs

ecflow_client --host $ECF_HOST --port $ECF_PORT --load=rrfs_prod.def
ecflow_client --host $ECF_HOST --port $ECF_PORT --begin=emc_rrfs_dev

#exit
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
