module load ecflow/5.6.0.11
#export ECF_PORT=34104
export ECF_PORT=32035
export ECF_HOST=cdecflow01
#34104

#echo "Suite date: $ECF_DATE, time: $ECF_TIME, clock info: $ECF_CLOCK"
#ecflow_client --host $ECF_HOST --port $ECF_PORT --query variable /emc_rrfs_dev_00/primary/00:ECF_DATE
#ecflow_client --host $ECF_HOST --port $ECF_PORT --query variable /emc_rrfs_dev_00/primary/00:ECF_TIME
#exit

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

#for cyc in $(seq -w 00 1 23); do
#ecflow_client --host $ECF_HOST --port $ECF_PORT --delete=/emc_rrfs_dev_$cyc
#done
#exit

#cd /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/ecflow/rrfs-workflow/ecf/defs


#load defs
for cyc in $(seq -w 00 23); do
#cyc=00
cd /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/ecflow/rrfs-workflow/ecf/defs
ecflow_client --host $ECF_HOST --port $ECF_PORT --load=rrfs_cycled_${cyc}.def
ecflow_client --host $ECF_HOST --port $ECF_PORT --begin=emc_rrfs_dev_${cyc}
###ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable EMC_USER Shun.Liu /emc_rrfs_dev_12/primary/${cyc}
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable ECF_INCLUDE /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/ecflow/rrfs-workflow/ecf/include /emc_rrfs_dev_${cyc}/primary/${cyc}
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable PDY 20250808 /emc_rrfs_dev_${cyc}/primary/${cyc}
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable QUEUE devhigh /emc_rrfs_dev_${cyc}/primary/${cyc}
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable MACHINE_SITE development /emc_rrfs_dev_${cyc}/primary/${cyc}
done

#ecflow_client --host $ECF_HOST --port $ECF_PORT --delete=/emc_rrfs_dev_01
