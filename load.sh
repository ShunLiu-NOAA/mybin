#set -x
module purge
module switch
module load compiler_mpi/ips/19.0.5/impi/19.0.5
module load ips/18.0.1.163
module load ips/18.0.5.274
module load ips/19.0.5.281
module load ips/19.0.5.281 smpi/10.1.1.0
#module load ips/19.0.5.281 smpi/10.1.1.0 metplus/2.1
module load NetCDF/4.5.0
module load prod_util/1.1.5
module load bufr_util/1.0.1
module load HPSS/5.0.2.5
module load lsf/10.1
module load grib_util/1.1.1

#exit

#module load EnvVars/1.0.3
#module load pm5/1.0
#module load subversion/1.7.16
#module load HPSS/5.0.2.5
#module load mktgs/1.0
#module load rsync/3.1.2
#module load ip/3.0.1
#module load prod_envir/1.0.2
#module load grib_util/1.0.6

#module use /gpfs/dell3/usrx/local/dev/emc_rocoto/modulefiles/
#module load ruby/2.5.1 rocoto/1.2.4

#module use -a /usrx/local/dev/modulefiles
#module load git/2.14.3
#module load cmake/3.10.0
#module load GrADS/2.2.0
#module load emc-utils/1.0.0
#
#module load compiler_mpi/ips/19.0.5/impi/19.0.5
#module load ips/18.0.1.163
#module load ips/18.0.5.274
#module load ips/19.0.5.281  impi/19.0.5
#module load ips/19.0.5.281  smpi/10.1.1.0
#
#module load NCARG/6.4.0
#module load NCL/6.4.0
