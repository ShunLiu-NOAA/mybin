module load ecflow/5.6.0.11
#export ECF_PORT=34104
export ECF_PORT=32035
export ECF_HOST=cdecflow01
#34104


for cyc in $(seq -w 00 1 23); do
g_cyc_tmp=$(( (10#$cyc / 6) * 6 ))
g_cyc=$(printf "%02d" $g_cyc_tmp)
echo "Suite date: $ECF_DATE, time: $ECF_TIME, clock info: $ECF_CLOCK", cyc: $cyc
ecflow_client --host $ECF_HOST --port $ECF_PORT --query variable /emc_rrfs_dev/primary/${g_cyc}/rrfs/v1.0/${cyc}:ECF_DATE
ecflow_client --host $ECF_HOST --port $ECF_PORT --query variable /emc_rrfs_dev/primary/${g_cyc}/rrfs/v1.0/${cyc}:ECF_TIME
#ecflow_client --host $ECF_HOST --port $ECF_PORT --get /emc_rrfs_dev_${cyc}/primary/${cyc}/cycle_end
echo "why::"
#ecflow_client --host $ECF_HOST --port $ECF_PORT --group="get; why=/emc_rrfs_dev_${cyc}/primary/${cyc}/cycle_end"
#ecflow_client --host $ECF_HOST --port $ECF_PORT --group="get; why=/emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs"
#ecflow_client --host $ECF_HOST --port $ECF_PORT --query state /emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs

#ecflow_client --host $ECF_HOST --port $ECF_PORT --stats /emc_rrfs_dev_06/primary/06/cycle_end
#ecflow_client --host $ECF_HOST --port $ECF_PORT --stats --path=/emc_rrfs_dev_06/primary/06/cycle_end
#ecflow_client --stats --path=/suite/family/task
done

exit
ecflow_client --host $ECF_HOST --port $ECF_PORT --query state /emc_rrfs_dev_06/primary/06/rrfs
echo "trigger::"
ecflow_client --host $ECF_HOST --port $ECF_PORT --query trigger /emc_rrfs_dev_06/primary/06/rrfs "cycle_end == complete"
#ecflow_client --why=/suite/rrfs                         # Check suite/family waiting reasons
#ecflow_client --query trigger "/suite/rrfs:cycle_end == complete"   # Is trigger true yet?
#ecflow_client --query variable /suite/rrfs:ECF_TIME     # What's the suite clock now?

exit

#ecflow_server --add_zombie_type=late:kill

#exit
#ecflow_client --host $ECF_HOST --port $ECF_PORT --force=/emc_rrfs_dev_00/primary/00/rrfs/v1.0/init/det/jrrfs_det_process_bufr

#run/execute a task
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/emc_rrfs_dev_00/primary/00/rrfs/v1.0/init/det/jrrfs_det_process_bufr

#run/execute a family
#cyc=15
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs/v1.0/init/det
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs/v1.0/init
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs/v1.0/ics/enkf
#exit

#cyc=18
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs/v1.0/fsm
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs/v1.0/init/det
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs/v1.0/prep/det
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs/v1.0/prep/det

for cyc in $(seq -w 00 1 23); do
ecflow_client --host $ECF_HOST --port $ECF_PORT --delete=/emc_rrfs_dev_$cyc
done
exit

#load defs
for cyc in $(seq -w 00 23); do
#cyc=00
cd /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/ecflow/rrfs-workflow/ecf/defs
ecflow_client --host $ECF_HOST --port $ECF_PORT --load=rrfs_cycled_${cyc}.def
ecflow_client --host $ECF_HOST --port $ECF_PORT --begin=emc_rrfs_dev_${cyc}
###ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable EMC_USER Shun.Liu /emc_rrfs_dev_12/primary/${cyc}
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable ECF_INCLUDE /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/ecflow/rrfs-workflow/ecf/include /emc_rrfs_dev_${cyc}/primary/${cyc}
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable PDY 20250616 /emc_rrfs_dev_${cyc}/primary/${cyc}
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable QUEUE devhigh /emc_rrfs_dev_${cyc}/primary/${cyc}
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable MACHINE_SITE development /emc_rrfs_dev_${cyc}/primary/${cyc}
done

#ecflow_client --host $ECF_HOST --port $ECF_PORT --delete=/emc_rrfs_dev_01
