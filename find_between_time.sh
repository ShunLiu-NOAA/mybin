
mydate=20250516
stime=1805
etime=1815
cd /lfs/h2/emc/ptmp/emc.lam/rrfs/v0.9.1/logs/rrfs.$mydate
# Step 1: Create reference timestamp files
touch -t ${mydate}${stime} start.ref
touch -t ${mydate}${etime} end.ref

echo ========================================
# Step 2: Use find to locate files modified between those times
find . -type f -newer start.ref ! -newer end.ref -exec stat --format='%y %n' {} \;
echo ========================================

cd /lfs/h2/emc/ptmp/emc.lam/rrfs/v0.9.1/logs/enkfrrfs.$mydate
# Step 1: Create reference timestamp files
touch -t ${mydate}${stime} start.ref
touch -t ${mydate}${etime} end.ref

echo ========================================
# Step 2: Use find to locate files modified between those times
find . -type f -newer start.ref ! -newer end.ref -exec stat --format='%y %n' {} \;

cd /lfs/h2/emc/ptmp/emc.lam/rrfs/v0.9.1/logs/refs.$mydate
# Step 1: Create reference timestamp files
touch -t ${mydate}${stime} start.ref
touch -t ${mydate}${etime} end.ref

echo ========================================
# Step 2: Use find to locate files modified between those times
find . -type f -newer start.ref ! -newer end.ref -exec stat --format='%y %n' {} \;

