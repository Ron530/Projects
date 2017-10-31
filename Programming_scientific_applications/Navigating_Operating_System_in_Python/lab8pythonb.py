import os.path
import shutil
import time
import datetime


month = datetime.datetime.now().strftime("%m")
year = datetime.datetime.now().strftime("%y")
day = datetime.datetime.now().strftime("%d")


#86400 is the amount of seconds in a day
rootDir = '/Users/ronneyaovida/desktop/test folder'
final=[]
for dirName, subdirList, fileList in os.walk(rootDir):
    print('Found directory: %s' % dirName)
    for fname in fileList:
        print('\t\t%s' % fname)
        path= ('{0}/{1}' .format(rootDir,fname))
        time= os.path.getmtime(path)
        print ('modified %s days ago' % int(time/86400))
        if (time/864400) <= 3:
            modifieddate= day-(time/86400)
            date= "%s%s_%s" % (month,modifieddate,year)
            subdir= "copy-%s" % (date)
            newdir= ('{0}/{1}'.format(rootDir,subdir))
            newnewdir=os.mkdir(newdir)
            rename= "%s_%s" % (path,date)
            os.rename(path,rename)
            shutil.copy(path,newnewdir)
    
    
