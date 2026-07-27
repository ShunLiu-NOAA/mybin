module load ecflow/5.6.0.11
#export ECF_PORT=34104
export ECF_PORT=32035
export ECF_HOST=ddecflow02


cd /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/nco/rrfs-workflow/ecf/defs


for cyc in $(seq -w 07 07); do
g_cyc_tmp=$(( (10#$cyc / 6) * 6 ))
g_cyc=$(printf "%02d" $g_cyc_tmp)
for imem in $(seq -w 001 030); do
ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/para/primary/${g_cyc}/rrfs/v1.0/${cyc}z/enkf/ics/jrrfs_enkf_make_ics_mem$imem
#ecflow_client --host $ECF_HOST --port $ECF_PORT --run=/para/primary/${g_cyc}/rrfs/v1.0/${cyc}z/enkf/prep/jrrfs_enkf_prep_cyc_spinup_ensinit_mem$imem
done
done

exit

#cd /lfs/h2/emc/lam/noscrub/emc.lam/rrfs/ecflow/rrfs-workflow/ecf/defs
