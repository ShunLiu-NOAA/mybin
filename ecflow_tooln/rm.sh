
#rrfsdir=/lfs/f2/t2o/ptmp/emc/Shun.Liu/stmp/rrfs
#find $rrfsdir -type d -path '${rrfsdir}/rrfs_*' -mmin +180 -print >zzz

#exit

cdate=20250822

for cyc in $(seq -w 00 1 05); do
rm -fr rrfs_det_prdgen_f???_??_??_${cyc}.*.*
rm -fr rrfs_det_post_f???_??_??_${cyc}.*.*
rm -fr rrfs_det_process_smoke_${cyc}.*.*
rm -fr rrfs_det_prep_cyc_${cyc}.*.*
rm -fr rrfs_det_prdgen_f???_00_00_long_${cyc}.*.*
rm -fr rrfs_ics_*${cyc}_v1.0
rm -fr rrfs_init_*${cyc}_v1.0
rm -fr rrfs_fsm_${cyc}_*
rm -fr rrfs_forecast_*${cyc}_v1.0
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
rm -fr rrfs_calc_ensmean_*${cyc}.*.*

rm -fr rrfs_calc_ensmean_${cyc}_v1.0
rm -fr rrfs_analysis_gsi_*${cyc}_v1.0
rm -fr rrfs_post_${cyc}_v1.0
rm -fr rrfs_init_spinup_*_${cyc}_v1.0
rm -fr rrfs_init_spinup_${cyc}_v1.0
rm -fr rrfs_fsm_${cyc}.*

rm -fr rrfs_det_*_${cyc}.*.*
rm -fr rrfs_enkf_*_${cyc}.*.*
rm -fr rrfs_ensf_*_${cyc}.*.*
rm -fr rrfs_firewx_*_${cyc}.*.*

rm -fr rrfs_ensf_*

rm -fr /lfs/f2/t2o/ptmp/emc/Shun.Liu/com/rrfs/v1.0/rrfs.${cdate}/${cyc}
rm -fr /lfs/f2/t2o/ptmp/emc/Shun.Liu/com/rrfs/v1.0/rrfs.${cdate}/${cyc}_spinup

rm -fr /lfs/f2/t2o/ptmp/emc/Shun.Liu/com/rrfs/v1.0/enkfrrfs.${cdate}/${cyc}
rm -fr /lfs/f2/t2o/ptmp/emc/Shun.Liu/com/rrfs/v1.0/enkfrrfs.${cdate}/${cyc}_spinup

done
