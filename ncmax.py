##!/usr/bin/env python
import os
import sys
import re
import numpy as np
##from __future__ import print_function
from netCDF4 import Dataset

nc1 = Dataset(sys.argv[1])
for varname in nc1.variables.keys():
    data1 = nc1[varname][:]
    print('%s min %s, max %s '%(varname, data1.min(), data1.max()) )
