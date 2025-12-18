find ./ -type d -mmin +480 -exec rm -rf {} +
exit

for cyc in $(seq -w 09 1 11); do
rm -fr rrfs_det_prdgen_f???_??_??_${cyc}.*.*
rm -fr rrfs_det_post_f???_??_??_${cyc}.*.*
rm -fr rrfs_det_process_smoke_${cyc}.*.*
rm -fr rrfs_det_prep_cyc_${cyc}.*.*
rm -fr rrfs_det_prdgen_f???_00_00_long_${cyc}.*.*
rm -fr rrfs_ics_${cyc}_v1.0
rm -fr rrfs_forecast_${cyc}_v1.0
rm -fr rrfs_det_analysis_nonvarcld_${cyc}.*.*
rm -fr  rrfs_enkf_updt_${cyc}.*.*
rm -fr rrfs_post_${cyc}_v1.0
rm -fr rrfs_enkf_radarref_${cyc}.*.*
rm -fr rrfs_enkf_analysis_nonvarcld_mem???_${cyc}.*.*
rm -fr rrfs_enkf_save_restart_mem0??_f1_${cyc}.*.*
rm -fr rrfs_enkf_prep_cyc_*_${cyc}.*.*
rm -fr  rrfs_enkf_save_restart_mem???_f???_${cyc}.*.*
rm -fr rrfs_ensf_post_mem???_f???_${cyc}.*.*
rm -fr rrfs_ensf_prdgen_mem0??_f0??_${cyc}.*.*
rm -fr rrfs_ensf_make_lbcs_??_mem0??__${cyc}.*.*
rm -fr rfs_firewx_post_f0??_${cyc}.*.*
done
~                                              

#!/bin/bash
set -x

#### DATAROOT=/lfs/h3/emc/lam/noscrub/ecflow/stmp/emc.lam/rrfs/ecflow_rrfs
DATAROOT=/lfs/f2/t2o/ptmp/emc/ptmp/emc.lam/ecflow/stmp/emc.lam/rrfs/ecflow_rrfs

export USER=emc.lam;export ECF_PORT=32035;export ECF_HOST=cdecflow01

first_completed_cycle=""
last_completed_cycle=""
for idx_cyc in $(seq 0 23); do
  idx_cyc2d=$( printf "%02d" "${idx_cyc}" )
  if [ ! $(ecflow_client --query state /nco_rrfs_dev_${idx_cyc2d}/primary/${idx_cyc2d}/rrfs) == complete ]; then
    [[ -z $first_completed_cycle ]]&& first_completed_cycle=$((idx_cyc-1))
    break
  fi
done

for idx_cyc in $(seq 23 -1 0); do
  idx_cyc2d=$( printf "%02d" "${idx_cyc}" )
  if [ ! $(ecflow_client --query state /nco_rrfs_dev_${idx_cyc2d}/primary/${idx_cyc2d}/rrfs) == complete ]; then
    last_completed_cycle=$((idx_cyc+1))
    break
  fi
done
if [ ! -z $first_completed_cycle ] && [ ! -z $last_completed_cycle ]; then
  cd $DATAROOT
  [ -f emergency_cleanup_run.sh ]&& mv emergency_cleanup_run.sh emergency_cleanup_run.sh-$$
  echo "set -x" &>> emergency_cleanup_run.sh
  if [ $first_completed_cycle -ge 2 ]; then
    for idx_cyc in $(seq 0 $first_completed_cycle); do
      idx_cyc2d=$( printf "%02d" "${idx_cyc}" )
      ls -lart|grep -v "\_${idx_cyc2d}\_"|grep "_${idx_cyc2d}"|awk '{print "rm -rf",$9}' >> emergency_cleanup_run.sh
      ls -lart|grep "\_${idx_cyc2d}\_v1.0"|awk '{print "rm -rf",$9}' >> emergency_cleanup_run.sh    
    done
  fi
  if [ $last_completed_cycle -lt 22 ]; then
    for idx_cyc in $(seq $last_completed_cycle 23); do
      idx_cyc2d=$( printf "%02d" "${idx_cyc}" )
      ls -lart|grep -v "\_${idx_cyc2d}\_"|grep "_${idx_cyc2d}"|awk '{print "rm -rf",$9}' >> emergency_cleanup_run.sh
      ls -lart|grep "\_${idx_cyc2d}\_v1.0"|awk '{print "rm -rf",$9}' >> emergency_cleanup_run.sh
    done
  fi
  
fi
exit 0

