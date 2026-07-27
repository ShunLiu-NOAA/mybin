#!/bin/bash

set -x


DAYS="2026032323"
#qsub -v SPIN="det",DAYSIN=${DAYS} -N rrfs_cpdet cpdet.sh
#qsub -v SPIN="spinup",DAYSIN=${DAYS} -N rrfs_cpdetspin cpdet.sh
#exit

for imem in $(seq -f "%02g" 1 30); do
qsub -v  MEM=${imem},DAYSIN=${DAYS} cpenkf.sh
done
