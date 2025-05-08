
cd /lfs/h2/emc/ptmp/emc.lam/rrfs/v0.9.1/logs/rrfs.20250508
# Step 1: Create reference timestamp files
touch -t 202505081800 start.ref
touch -t 202505081815 end.ref

# Step 2: Use find to locate files modified between those times
find . -type f -newer start.ref ! -newer end.ref -exec stat --format='%y %n' {} \;

