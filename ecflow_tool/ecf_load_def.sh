module load ecflow/5.6.0.11
export ECF_PORT=34104
#export ECF_PORT=32035
export ECF_HOST=cdecflow01
#34104

#ecflow_client --host $ECF_HOST --port $ECF_PORT --force=/nco_rrfs_dev_00/primary/00/rrfs/v1.0/init/det/jrrfs_det_process_bufr

#run/execute a task
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/nco_rrfs_dev_00/primary/00/rrfs/v1.0/init/det/jrrfs_det_process_bufr

#run/execute a family
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/nco_rrfs_dev_00/primary/00/rrfs/v1.0/init
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/nco_rrfs_dev_00/primary/00/rrfs/v1.0/ics/det

#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/nco_rrfs_dev_00/primary/00/rrfs/v1.0/prep/det

#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/nco_rrfs_dev_03/primary/03/rrfs/v1.0/prep/det

#load defs
cd /lfs/h2/emc/da/noscrub/Shun.Liu/rrfs/rrfs-workflow/ecf/defs
ecflow_client --host $ECF_HOST --port $ECF_PORT --load=rrfs_cycled_12.def
ecflow_client --host $ECF_HOST --port $ECF_PORT --begin=nco_rrfs_dev_12
#ecflow_client --host $ECF_HOST --port $ECF_PORT --delete=/nco_rrfs_dev_01
