#!/usr/bin/env python
import sys, math

try:
    outfilename = sys.argv[1]
except:
    print "Usage:",sys.argv[0], "outfile,x,y... "
    sys.exit(1)
    

ofile = open(outfilename, 'w')  # open file for writing

line= []
for i in range(2,8):
    ifile= sys.argv[i]
    line.append(ifile)
    

print line


def myfunc(y):
    if y >= 0.0:
        return y**5*math.exp(-y)
    else:
        return 0.0



# read ifile line by line and write out transformed values:
for line in ifile:
    pair = line.split()
    x = float(pair[0]); y = float(pair[1])
    fy = myfunc(y)  # transform y value
    ofile.write('%5.1g  %12.5e\n' % (x,fy))

