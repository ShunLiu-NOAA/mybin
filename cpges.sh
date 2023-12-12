
ver1=v0.7.6
ver2=v0.7.9

path1=/lfs/f2/t2o/ptmp/emc/ptmp/emc.lam/rrfs/${ver1}/nwges
path2=/lfs/f2/t2o/ptmp/emc/ptmp/emc.lam/rrfs/${ver2}/nwges

mkdir -p $path2
mkdir -p $path2/satbias
mkdir -p $path2/surface

ln -sf ${path1}/2023121215 ${path2}/2023121215
ln -sf ${path1}/satbias/*2023121214* ${path2}/satbias
ln -sf ${path1}/satbias/*2023121215* ${path2}/satbias
ln -sf ${path1}/surface/20231212* ${path2}/surface
