import sys

infilename = sys.argv[1]
outfilename = sys.argv[2]
outfilename2 = sys.argv[3]
outfilename3 = sys.argv[4]

ifile= infilename
ofile= outfilename
ofile2= outfilename2
ofile3= outfilename3

f1= open(ifile, 'r')
f2 = open(ofile, 'w')
f3 = open(ofile2, 'w')
f4 = open(ofile3, 'w')

lines= f1.readlines()

line1= lines[0]
line2= lines[1]
line3= lines[2]
line4= lines[3]
line5= lines[4]
line6= lines[5]

print line1
print line2
print line3
print line4
print line5
print line6

xval=[]
yval=[]
zval=[]

xval= line4.split()
yval= line5.split()
zval= line6.split()


xval= str(xval)
yval= str(yval)
zval= str(zval)


n= float(line2)

timestep=0
temp= []
n= n-3

while len(xval) > timestep:
 
    timestep = timestep + 1
    n= n + 1.5
    temp.append(str(n))
    

temp= str(temp)



xval1= xval[2:5]
xval2= xval[9:12]
xval3=xval[16:19]

yval1=yval[2:5]
yval2=yval[9:12]
yval3=yval[16:21]

zval1=zval[2:5]
zval2=zval[9:12]
zval3=zval[16:20]

first= temp[2:5]
second= temp[9:12]
third= temp[16:19]




f2.write(first)
f2.write('  ')
f2.write(xval1)
f2.write('\n')

f2.write(second)
f2.write('  ')
f2.write(yval1)
f2.write('\n')

f2.write(third)
f2.write('  ')
f2.write(zval1)
f2.write('\n')


f3.write(first)
f3.write('  ')
f3.write(xval2)
f3.write('\n')


f3.write(second)
f3.write('  ')
f3.write(yval2)
f3.write('\n')

f3.write(third)
f3.write('  ')
f3.write(zval2)
f3.write('\n')

f4.write(first)
f4.write('  ')
f4.write(xval3)
f4.write('\n')

f4.write(second)
f4.write('  ')
f4.write(yval3)
f4.write('\n')


f4.write(third)
f4.write('  ')
f4.write(zval3)
f4.write('\n')

ifile.close();  ofile.close()

    
    







