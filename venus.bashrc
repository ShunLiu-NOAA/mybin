# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export GIT_SSH=$HOME/ssh-gerrit
export PATH="${PATH}:/u/Shun.Liu/bin:./"
export winhome="/home/people/emc/www/htdocs/mmb/wx22hl/winhome"
export GIT_SSH=$HOME/ssh-gerrit

alias wgrib2=/gpfs/dell1/nco/ops/nwprod/lib/wgrib2/v2.0.8/ips/18.0.1/bin/wgrib2
alias h='history'

alias save='cd /gpfs/dell2/emc/modeling/save/Shun.Liu'
alias nbns='cd /gpfs/dell2/emc/modeling/noscrub/Shun.Liu'
alias nbns6='cd /gpfs/dell6/emc/modeling/noscrub/Shun.Liu'
alias ptmp='cd /gpfs/dell1/ptmp/$USER'
alias ptmp5='cd /gpfs/dell5/ptmp/$USER'
alias stmp='cd /gpfs/dell1/stmp/$USER'
alias stmp5='cd /gpfs/dell5/stmp/$USER'
alias ptmp2='cd /gpfs/dell2/ptmp/$USER'
alias stmp2='cd /gpfs/dell2/stmp/$USER'
alias ptmp3='cd /gpfs/dell3/ptmp/$USER'
alias stmp3='cd /gpfs/dell3/stmp/$USER'
alias nwprod='cd /gpfs/dell1/nco/ops/nwprod'
alias nwpara='cd /gpfs/dell1/nco/ops/nwpara'
alias nwtest='cd /gpfs/dell1/nco/ops/nwtest'
alias com='cd /gpfs/dell1/nco/ops/com'
alias dcom='cd /gpfs/dell1/nco/ops/dcom'
alias nwges='cd /gpfs/dell1/nco/ops/nwges'
alias cdc='cd /gpfs/dell2/emc/modeling/save/Shun.Liu/code'

alias ls='ls --color'
alias cp='cp -p'
alias lsm='ls --color -l --block-size=M'
alias clean='rm *~'
alias llq='bjobs -u all'
alias qq='bjobs -u Shun.Liu'
alias qn='bjobs -X -o "jobid:11 user:10 stat:4 queue:6 exec_host:10 job_name:25 submit_time:12"'
alias qs='bjobs -l'
alias llcancel='bkill'
alias qdel='bkill'
alias h='history'
alias a2ps='a2ps -Pemc-p-cmp7c -M Letter -S2'
alias pd='pushd'
alias bd='popd'
alias d='display'
alias loadjedi='source ~/bin/load.sh'
alias loadp='source ~/bin/loadp.sh'
alias sor='source ~/.bashrc'
alias xtermg='xterm -bg LavenderBlush1 &'
alias xtermt='xterm -bg SlateGray1 &'
alias xterms='xterm -bg Gray &'
alias xtermj='xterm -bg khaki2 &'
alias binv='/u/Yangrong.Ling/utilities/binv/binv'

#alias cdt='cd /gpfs/dell2/emc/modeling/noscrub/Shun.Liu/test'
alias cdt='cd /gpfs/dell6/emc/modeling/noscrub/Shun.Liu/rrfs/test/rrfs_NA_3km'
alias cdc='cd /gpfs/dell2/emc/modeling/save/Shun.Liu/code/CBL'
alias cdf='cd /gpfs/dell6/emc/modeling/noscrub/Shun.Liu/fv3lamda/regional_workflow/'
alias cdrrfs='cd /gpfs/dell6/emc/modeling/noscrub/Shun.Liu/rrfs/'
alias cdstmp='cd /gpfs/dell1/ptmp/Shun.Liu/stmp/tmpnwprd/rrfs_NA_3km'
alias cdgsi='cd /gpfs/dell6/emc/modeling/noscrub/Shun.Liu/testgsi/regional_gsianl_tm00_00'
alias vicron='vi ~/cron/mycrontab'
alias vibash='vi ~/.bashrc'
alias lpath='cat ~/bin/filepath'
alias vipath='vi ~/bin/filepath'
alias campara='sudo -u emc.campara -i'

#echo "cdf regional_workflow"
#echo "cdgsi gsi test dir"

#. /usrx/local/prod/lmod/lmod/init/profit
#. /usrx/local/prod/modulefiles/.defaultmodules

#if [ ! -z $MODULESHOME ]; then
#    . $MODULESHOME/init/bash
#else
#    . /opt/modules/default/init/bash
#fi
######################################
module load lsf/10.1
module load HPSS/5.0.2.5

#module load compiler_mpi/ips/19.0.5/impi/19.0.5
#module load ips/18.0.1.163
#module load ips/18.0.5.274
#module load ips/19.0.5.281 impi/19.0.5 
#module load ips/19.0.5.281 smpi/10.1.1.0 metplus/2.1
#module load NetCDF/4.5.0
#module load prod_util/1.1.5
#module load bufr_util/1.0.1
######################################

#module load impi/18.0.1
#module load NetCDF/4.5.0
#module load bacio/2.0.2
#module load sfcio/1.0.0
##module load nemsio/2.2.3
#module load w3emc/2.3.0
#module load sp/2.0.2
#module load w3nco/2.0.6
#module load impi/18.0.1
#module load bufr/11.3.0
#module load sigio/2.0.1
#module load crtm/2.2.5

#module load EnvVars/1.0.3
#module load pm5/1.0
#module load subversion/1.7.16
#module load mktgs/1.0
#module load rsync/3.1.2
#module load ip/3.0.1
#module load grib_util/1.1.0



#module load ips/18.0.1.163
#module use /gpfs/dell1/nco/ops/nwprod/modulefiles/
#module load gempak/7.3.1

#module use /gpfs/dell3/usrx/local/dev/emc_rocoto/modulefiles/
#module load ruby/2.5.1 rocoto/1.2.4

#module use -a /usrx/local/dev/modulefiles
#module load git/2.14.3
#module load cmake/3.10.0
#module load GrADS/2.2.0
#
#module load prod_envir/1.0.3
#module load g2/3.1.0
#module load jasper/1.900.1
#module load libpng/1.2.44
#module load zlib/1.2.11
#module load NCARG/6.4.0
#module load NCL/6.4.0

#module use -a /u/Benjamin.Blake/modulefiles
#module load anaconda2/latest
#export GRIB_DEFINITION_PATH=/gpfs/dell2/emc/modeling/noscrub/Benjamin.Blake/EXT/grib_api.1.14.4/share/grib_api/definitions
#export PYTHONPATH="${PYTHONPATH}:/gpfs/dell2/emc/modeling/noscrub/Jacob.Carley/python/lib/python3.6/site-packages"
