
export PATH="${PATH}:/lfs/h2/emc/lam/noscrub/emc.lam/Shun.Liu/bin:./"
export winhome="/home/people/emc/www/htdocs/mmb/wx22hl/winhome"

LS_COLORS=$LS_COLORS:'di=1;34:ex=1;35:ln=1;31'  
#LS_COLORS=$LS_COLORS:'di=1;34:ex=1;35'  
export LS_COLORS

alias h='history'
alias ls='ls --color -p'
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

alias ptmp='cd /lfs/h2/emc/ptmp/emc.lam/Shun.Liu'
export dptmp=/lfs/h2/emc/ptmp/emc.lam/Shun.Liu
alias stmp='cd /lfs/h2/emc/emc.lam/stmp/Shun.Liu'
alias nbns='cd /lfs/h2/emc/lam/noscrub/emc.lam/Shun.Liu'
alias save='cd /lfs/h2/emc/lam/save/emc.lam/Shun.Liu'
alias nwprod='cd /lfs/h1/ops/prod'
export dnwprod=/lfs/h1/ops/prod
alias llq='qstat'
alias qq='qstat -u $USER'
alias h='history 100'
  
alias vicron='crontab -e'
#alias vibash='vi ~/.bashrc'
#alias lpath='cat ~/bin/filepath'
#alias vipath='vi ~/bin/filepath'
#alias vilink='vi ~/bin/mylink'
#alias sorlink='source ~/bin/mylink'
#alias lampara='sudo -u emc.lam -i'


source /lfs/h2/emc/lam/noscrub/emc.lam/Shun.Liu/bin/mylink
