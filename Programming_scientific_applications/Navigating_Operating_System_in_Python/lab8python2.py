import os

filelist = [ f for f in os.listdir("/Users/ronneyaovida/desktop/") if f.endswith(".tmp") ]
for f in filelist:
    os.remove(f)




