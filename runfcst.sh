#!/bin/sh
#BSUB -P RRFS-T2O
#BSUB -eo test.err
#BSUB -oo test.out
#BSUB -J fv3.c768
#BSUB -W 00:10
#BSUB -q "dev2"
#BSUB -n 896
#BSUB -R span[ptile=20]
#BSUB -R affinity[core(2):distribute=balance]
#
set -x

#. /usrx/local/prod/lmod/lmod/init/sh


export HOMEfv3=/gpfs/dell6/emc/modeling/noscrub/Shun.Liu/fv3lamda/regional_workflow
export PARMfv3=$HOMEfv3/parm
export EXECfv3=$HOMEfv3/exec
export USHfv3=$HOMEfv3/ush
export UTILfv3=$HOMEfv3/util/ush
export LD_LIBRARY_PATH="/gpfs/dell6/emc/modeling/noscrub/Eric.Rogers/fv3lam_for_dellp3.5/sorc/regional_forecast.fd/ccpp/lib/${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

#set -x -u -e
set -x
#export HOMEfv3='/gpfs/dell6/emc/modeling/noscrub/Shun.Liu/fv3lamda/regional_workflow'
#export job='regional_forecast_tm06'
#export machine='wcoss_dell_p3.5'

date

. ${HOMEfv3}/rocoto/machine-setup.sh
export machine=wcoss_dell_p3.5

if [ "$machine" = "wcoss_dell_p3" ] ; then
  . /usrx/local/prod/lmod/lmod/init/sh
elif [ "$machine" = "wcoss_dell_p3.5" ] ; then
  . /usrx/local/prod/lmod/lmod/init/sh
elif [ "$machine" = "wcoss_cray" ] ; then
  . /opt/modules/default/init/sh
elif [ "$machine" = "hera" ] ; then
  . /apps/lmod/lmod/init/sh
elif [ "$machine" = "jet" ] ; then
  . /apps/lmod/lmod/init/sh
fi

jobpre=regional_forecast_tm06
module use ${HOMEfv3}/modulefiles/wcoss_dell_p3.5
jobpre=$(echo ${job} | cut -c1-17)
if [ "${jobpre}" = "regional_forecast" ]; then
  module load fv3
elif [ "${jobpre}" = "regional_bufrpost" ]; then
  module load bufr
elif [ "${jobpre}" = "regional_post_con" ]; then
  module load post
elif [ "${jobpre}" = "regional_firstgue" ]; then
  module load chgres_cube
elif [ "${jobpre}" = "regional_make_bc_" ]; then
  module load chgres_cube
elif [ "${jobpre}" = "regional_postgoes" ]; then
  module load post
else
  module load regional
fi

set -x

echo Shun test
module list
export OMP_THREADS='2'
export TOTAL_TASKS='896'
export TASK_X='28'
export TASK_Y='28'
export WG='2'
export WTPG='56'
export NCTSK='20'

export KMP_STACKSIZE=1024m
export KMP_AFFINITY=disabled

export KMP_AFFINITY=scatter   
export OMP_STACKSIZE=2048m  

ulimit -s unlimited
ulimit -a


#module load impi/18.0.1
#module load lsf/10.1
module list
module use /gpfs/dell2/emc/modeling/noscrub/emc.nemspara/soft/modulefiles
module list
module load esmf/8.1.0bs21

export OMP_NUM_THREADS=4

#exec "$@"

#cd /gpfs/dell5/ptmp/Shun.Liu/fv3lamda/tmpnwprd/regional_forecast_tm06_2021081112
#EXEC=/gpfs/dell6/emc/modeling/noscrub/Shun.Liu/fv3lamda/regional_workflow/exec/regional_forecast.x
#mpirun $EXEC > outtest 2> errtest

#----------------------------------------- 
# Run the forecast
#-----------------------------------------

EXECfv3=/gpfs/dell6/emc/modeling/noscrub/Shun.Liu/fv3lamda/regional_workflow/exec
export pgm=regional_forecast.x
#. prep_step
#startmsg
mpirun $EXECfv3/regional_forecast.x >pgmout 2>err
