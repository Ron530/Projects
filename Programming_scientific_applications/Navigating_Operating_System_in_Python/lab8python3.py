import os


 
rootDir = '/Users/ronneyaovida/desktop/test folder'
final=[]
for dirName, subdirList, fileList in os.walk(rootDir):
    print('Found directory: %s' % dirName)
    for fname in fileList:
        print('\t%s' % fname)
        test= ('{0}/{1}' .format(rootDir,fname))
        size= os.path.getsize(test)
        print (size)
        if size > (1000000.0):
            mb=fname
            mbsize= float(size)
            temp= (float(mbsize/1000000.0),mb)
            final.append(temp)
    print (final)

            


