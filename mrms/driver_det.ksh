#!/bin/bash

set -x


for fhr in $(seq -f "%02g" 01 31)
do
DAYS=202410$fhr
qsub -v DAYSIN=${DAYS} archive_mrms_fv3_grid.sh
done

exit 0
