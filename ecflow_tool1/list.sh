module load ecflow/5.6.0.11
#export ECF_PORT=34104
export ECF_PORT=32035
export ECF_HOST=ddecflow01
#34104

ecflow_client --host $ECF_HOST --port $ECF_PORT --reloadwsfile /lfs/h2/emc/lam/noscrub/emc.lam/ecflow/submit/submit/ddecflow01.32035.ecf.lists

exit
#load defs
for cyc in $(seq -w 00 23); do
#cyc=00
cd /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/ecflow/rrfs-workflow/ecf/defs
ecflow_client --host $ECF_HOST --port $ECF_PORT --load=rrfs_cycled_${cyc}.def
ecflow_client --host $ECF_HOST --port $ECF_PORT --begin=emc_rrfs_dev_${cyc}
###ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable EMC_USER Shun.Liu /emc_rrfs_dev_12/primary/${cyc}
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable ECF_INCLUDE /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/ecflow/rrfs-workflow/ecf/include /emc_rrfs_dev_${cyc}/primary/${cyc}
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable PDY 20250625 /emc_rrfs_dev_${cyc}/primary/${cyc}
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable QUEUE devhigh /emc_rrfs_dev_${cyc}/primary/${cyc}
ecflow_client --host $ECF_HOST --port $ECF_PORT --alter add variable MACHINE_SITE development /emc_rrfs_dev_${cyc}/primary/${cyc}
done

#ecflow_client --host $ECF_HOST --port $ECF_PORT --delete=/emc_rrfs_dev_01
