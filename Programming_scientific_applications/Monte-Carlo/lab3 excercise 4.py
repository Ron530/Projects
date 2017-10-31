from math import log
import sys

print ("hello")
while  1:

    try:
        sys.argv[i] == "hello"
    except:
        break
    
    x=float(arg)
    if x>0:
        print "ln{0} = {1}" % (x,log(x))
        else:
            print "ln{0} is illegal" % (x)

