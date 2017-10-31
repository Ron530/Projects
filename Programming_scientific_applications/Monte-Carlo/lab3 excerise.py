from math import log
import sys

print ("hello")
for r in sys.argv[1:]:
    x=float(arg)
    if x>0:
        print "ln{0} = {1}" % (x,log(x))
        else:
            print "ln{0} is illegal" % (x)





            
