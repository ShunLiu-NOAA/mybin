#!/bin/bash

set -x
type qstat

# If it's an alias or function, try disabling it for this one command
# If it's an alias:
# \qstat -f -u shun.liu | cat -A

# If it's a function or you want to use the direct binary:
# Find the actual path to qstat
which qstat
# Then use the full path:
# /path/to/qstat -f -u shun.liu | cat -A
exit



qstat -f -u $(whoami) | cat -A

exit
qstat -f -u $(whoami) | awk '
/^Job Id:/ {
    job_id = $3
}
/^Job_Name =/ {
    # Reconstruct the job name by joining fields from the 3rd to the end
    job_name = $3
    for (i = 4; i <= NF; i++) {
        job_name = job_name " " $i
    }
    print job_id, job_name
}'

exit

qstat -w -u $(whoami)| awk 'NR > 2 {print $1,$2,$3,$4,$5}'
exit

qstat -w -u $(whoami) | awk '
/^Job Id:/ {
    job_id = $3
}
/Job_Name =/ {
    job_name = $3
    # Reconstruct job name in case it has spaces
    for (i = 4; i <= NF; i++) {
        job_name = job_name " " $i
    }
    print job_id, job_name
}'
