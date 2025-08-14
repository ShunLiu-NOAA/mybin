#PBS -A RRFS-DEV
#PBS -q dev_transfer
#PBS -l select=1:mpiprocs=1:ncpus=1
#PBS -l walltime=04:15:00
#PBS -N rrfs_a_run_archive2
#PBS -j oe -o /lfs/h2/emc/ptmp/emc.lam/Shun.Liu/logs/archive_lbc.log
set -x

cd /lfs/h2/emc/ptmp/emc.lam/Shun.Liu

htar xf /5year/NCEPDEV/emc-meso/emc.lam/5year/rh2025/202508/20250810/lfs_h3_emc_lam_noscrub_ecflow_ptmp_emc.lam_ecflow_rrfs_para_com_rrfs_v1.0_rrfs.2025081000.init.lbcs.tar
