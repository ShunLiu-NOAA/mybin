module load bufr/11.7.0

ifort  -o a.out read_prepbufr.f90 -L /apps/ops/prod/libs/intel/19.1.3.304/bufr/11.7.0/lib64/ -lbufr_d
