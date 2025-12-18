module load ecflow/5.6.0.11
#export ECF_PORT=34104
export ECF_PORT=32035
export ECF_HOST=cdecflow01
#34104

#load defs
for cyc in $(seq -w 00 23); do
cd /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/ecflow/rrfs-workflow/ecf/defs
#ecflow_client --host $ECF_HOST --port $ECF_PORT --alter change clock 23.07.2025 06:38 -04:00 /emc_rrfs_dev_${cyc}/primary/${cyc}
#ecflow_client --requeue=force /emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs/v1.0/prep/enkf
#ecflow_client --host $ECF_HOST --port $ECF_PORT --load=rrfs_cycled_${cyc}.def
ecflow_client --requeue=force /emc_rrfs_dev_${cyc}/primary/${cyc}/cycle_end
ecflow_client --requeue=force /emc_rrfs_dev_${cyc}/primary/${cyc}/rrfs
done

#ecflow_client --host $ECF_HOST --port $ECF_PORT --delete=/emc_rrfs_dev_01
