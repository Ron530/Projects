import os
import shutil


 
rootDir = '/Users/ronneyaovida/desktop/test folder'
final=[]
for dirName, subdirList, fileList in os.walk(rootDir):
    print('Found directory: %s' % dirName)
    for fname in fileList:
        print('\t\t%s' % fname)
        path= ('{0}/{1}' .format(rootDir,fname))
        size= os.path.getsize(path)
        time= os.path.getmtime(path)
        accessed=os.path.getatime(path)
        print ('size is: %s' % size)
        print ('modified %s days ago' % int(time/864400))
        print ('accessed %s days ago' % int(accessed/864400))
        if size > (1000000.0):
            if (time/864400) > 100:
                mb=fname
                mbsize= float(size)
                access= int(accessed)
                temp= ((mb,mbsize/1000000,access/864400))
                final.append(temp)
                shutil.move(path,"/Users/ronneyaovida/desktop/trashh")
    print (final)
    
    
