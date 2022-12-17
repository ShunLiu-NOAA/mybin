#!/usr/bin/env python3

from datetime import datetime
import csv
import getpass
import subprocess
import json
import yaml
import sys

# ---------------------------------------------------------------------------------------- 
# ---------------------------------------------------------------------------------------- 
try:
    user = sys.argv[1]
except(IndexError):
    user = getpass.getuser()

# ---------------------------------------------------------------------------------------- 
# ---------------------------------------------------------------------------------------- 
cmd = "qstat -u "+user+" | grep '^[0-9]'"
proc = subprocess.Popen(cmd,stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,shell=True)
jobs = []
for line in proc.stdout:
    jobs.append(line.decode('utf-8').strip().split(' ')[0])

# ---------------------------------------------------------------------------------------- 
# ---------------------------------------------------------------------------------------- 
if len(jobs) > 0:

    fmt = "%-15.15s %-12.12s %-5.5s %-15.15s %-15.15s %-15.15s %-40.40s %-23.23s %-23.23s %-10.10s".replace(' ','|')
    fmt1 = "%-15.15s %-12.12s %-5.5s %-15.15s %-15.15s %-15.15s".replace(' ','|')

    cmd = "qstat -f -F json "+" ".join(job for job in jobs)
    proc = subprocess.Popen(cmd,stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,shell=True)
    jobdata = ""
    for line in proc.stdout:
        jobdata += line.decode('utf-8')

    ydata = yaml.load(jobdata,Loader=yaml.CLoader) # yaml.CLoader is faster!

    jobs = ydata['Jobs']
    ts = ydata['timestamp']

    print("AS OF: %s" % (datetime.fromtimestamp(ts).strftime("%c")),flush=True)

    print(fmt % ("JOBID","USER","STAT","QUEUE","FROM_HOST","EXEC_HOST","JOB NAME","START_TIME","SUBMIT_TIME","RUN_TIME"),flush=True)
    #print(fmt % (jobid,jobuser,jobstat,jobqueue,jobfromhost,jobname),flush=True)

    for job,info in jobs.items():
        #print(info.keys())
        #print(job,info['Resource_List'])

        #
        jobid = job
        jobuser = info['Job_Owner'].split('@')[0]
        jobfromhost = info['Job_Owner'].split('@')[1].split('.')[0]
        jobname = info['Job_Name']
        jobstat = info['job_state']
        jobqueue = info['queue']
        if jobstat == 'H': 
           print(fmt1 % (jobid,jobuser,jobstat,jobqueue,jobfromhost,jobname),flush=True)
           if jobqueue == "devhigh":
              cmd1="qdel "+jobid
              print(cmd1)
              retcode=subprocess.call(cmd1,shell=True)
              #exit(0)

        #
#       print(fmt % (jobid,jobuser,jobstat,jobqueue,jobfromhost,jobexechost,jobname,jobstime,jobqtime,jobruntime),flush=True)
else:
    print("%s"%("No unfinished jobs found."),flush=True)
