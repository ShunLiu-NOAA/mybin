# @(#).bashrc  2019.04.14
################################################################################

##  Source global definitions: The next line must be the first non-commented line.
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

#if [ -z "$PS1" ]; then return; fi

export HISTSIZE=100000
export HISTFILESIZE=100000

# User specific aliases and functions
# Set path shell variable
PATH=$PATH:./:$HOME/bin:/usr/sbin:/sbin:/u/Shun.Liu/bin:/opt/pbs/bin
export PATH

TERM=xterm

#hostname > host
#pro=`cut -c 1-8 host`
#PS1="Dogwood ${pro} > "
#PS1="\u@\e[31m\W>\e[m"
PS1="\e[31m\W>\e[m"
#
# wcoss2 aliases
#
export GIT_SSH=$HOME/ssh-gerrit

alias ls='ls --color'
alias cp='cp -p'
alias lsm='ls --color -l --block-size=M'
alias clean='rm *~'
alias h='history'
alias a2ps='a2ps -Pemc-p-cmp7c -M Letter -S2'
alias pd='pushd'
alias bd='popd'
alias d='display'
alias loadjedi='source ~/bin/load.sh'
alias loadp='source ~/bin/loadp.sh'
alias xtermt='xterm -bg SlateGray1 &'
alias xterms='xterm -bg Gray &'
alias xtermj='xterm -bg khaki2 &'
alias qq='qstat -u $USER'
alias llq='qstat -u $USER'
alias llqa='qstat'

alias sor='source ~/.bashrc'
alias xtermg='xterm -bg LavenderBlush1 -fa 'Monospace' -fs 14 &'
alias vicron='crontab -e'
alias vibash='vi ~/.bashrc'
alias lpath='cat ~/bin/filepath'
alias vipath='vi ~/bin/filepath'
alias vilink='vi ~/bin/mylink'
alias sorlink='source ~/bin/mylink'
alias campara='sudo -u emc.campara -i'

source ~/bin/mylink

export dptmp=/lfs/h2/emc/ptmp/Shun.Liu
alias ptmp='cd /lfs/h2/emc/ptmp/Shun.Liu'
alias stmp='cd /lfs/h2/emc/stmp/Shun.Liu'
alias nbns='cd /lfs/h2/emc/da/noscrub/Shun.Liu'
alias save='cd /lfs/h2/emc/da/save/Shun.Liu'
export dnwprod=/lfs/h1/ops/prod
alias nwprod='cd /lfs/h1/ops/prod'

#alias output='cd /lfs/h1/ops/canned/output/dell1/gpfs/dell1/nco/ops/com/output/prod/20210824'

#module load envvar/1.0
#module load PrgEnv-intel/8.1.0
#module load intel/19.1.3.304
#module load craype
#module load cray-mpich
#module load grib_util/1.2.2
#module load prod_util/2.0.5
#module load prod_envir/2.0.4
#module load libjpeg/9c
#module load wgrib2/2.0.8_wmo
#module load cray-python
#module load git/2.29.0
