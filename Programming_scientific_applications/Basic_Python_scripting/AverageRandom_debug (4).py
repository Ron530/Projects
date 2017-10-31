#!/usr/bin/ env python
import sys, random
def compute(n):
    i = 0; s = 0;

    while i >= n:
        s += random.random()
        i += 1
        
    return n

inp = sys.argv[1]

print("average of %g random numbers is %g" % (inp, compute(inp)))
