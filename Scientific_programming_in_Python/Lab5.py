#Lab 5: K-Means Clustering for Image Processing
#If we have a grayscale image then each pixel is represented by an integer between 0 and 255; if we have a color image we know that each pixel is represented by three RGB values creating a myriad of colors. Our strategy now is to choose just a few colors to represent the image. An obvious application of this data compression is when you print an image using a color printer with many fewer colors than are available on your computer. After we choose these colors, then the image chart for the picture must be modified so that each color is replaced by the new color that it is closest in color space
#We can use K-Means to accomplish this image compression. For example, suppose we have a grayscale image and decide that we want to represent it with 32 shades of gray. Our job is to find which 32 colors (out of 256) best represent the image. We then initiate our probabilistic Lloyds algorithm with 32 generators which are numbers between 0 and 255; we can simply choose the generators randomly. In Lloyds algorithm we need to sample the space so in our application this means to sample the image. If the image is not too large, then we can simply sample every pixel in the image. If the image is large then resort to sample a few pixel (for example a 1000 randomly from the picture and use those to find the the best shades/colors and then map all pixels into the new colors). We then proceed with the algorithm until convergence is attained. After convergence is achieved we know the best 32 colors to represent our image so our final step is to replace each color in our original matrix representation of the image with the converged centroid of the cluster it is in. For this application we will just use a constant density function and the standard Euclidean distance for our metric.

#Task 1: Greyscale Image
#Use the grayscale image frog_small.tiff and modify your algorithm to obtain approximations to the image using 4, 8, 16, and 32 shades of gray. Display your results along with the original image. As generators choose, e.g., 8 random points between 0 and 255 and because there are a reasonable number of pixels in your image you can sample the image by simply choosing each pixel to determine which of the 8 shades of gray it is closest to. Use a reasonable tolerance as your stopping criteria. After your algorithm has converged don’t forget to replace each entry in the image matrix with the center of your cluster and convert to unsigned integer format (uint8)

from scipy.misc import imread
%matplotlib inline
import matplotlib
import numpy as np
import random
import matplotlib.pyplot as plt
from PIL import Image
frog = imread("frog_small.tiff")
#plt.imshow(frog)


def graykmeans(Image,Clusters):
    
    img=Image
    nx=len(img)
    ny=len(img[0])
    distmap=np.zeros((nx,ny,Clusters), dtype=np.uint8)
    generator=np.linspace(0,255,Clusters)
    #hold=-1
    while int(generator[0]) !=  int(generator[1]): #(hold+1 or hold-1):
        
        genrange=np.mean([generator[0],generator[1]])
        print (generator)
        #print (hold)
        

        for n in range(0,Clusters):
            #hold=generator[0]
            xcoord,ycoord,xcoord0,ycoord0=0,0,0,0
            for x in img:
                for xx in x:
                    if n==0:
                        if xx < (generator[0]+genrange):
                            distmap[xcoord0,ycoord0,n]=xx
                            xcoord0=xcoord0+1
                            if xcoord0 == nx:
                                ycoord0=ycoord0+1
                                xcoord0=0
                    if n>0:
                        if xx in range(int(generator[n]-genrange),int(generator[n]+genrange)):
                            distmap[xcoord,ycoord,n]=xx
                            xcoord=xcoord+1
                            if xcoord == nx:
                                ycoord=ycoord+1
                                xcoord=0
            temp=distmap[:,:,n]
            condition=distmap[:,:,n]!=0
            generator[n]=np.mean((temp[condition]))
        if int(generator[0]) ==  int(generator[1]):
            for k in range(Clusters):
                distmap[:,:,k]=generator[k]
            #plt.imshow(distmap)
            #plt.show()
            
        
    return (generator,distmap[:,:,:])

graykmeans(frog,6)


# Second Cell.

from scipy.misc import imread
%matplotlib inline
import matplotlib
import numpy as np
import random
import matplotlib.pyplot as plt
frog = imread("frog_small.tiff")
plt.imshow(frog)



def graykmeans(Image,Clusters):
    generator=random.sample(range(255),4)
    print (generator)
    nx=len(Image)
    ny=len(Image[0])
    ngen=Clusters
    distmap=np.zeros((nx,ny,ngen))
    #print (generator)
    gendiff = 10
    count=0
    #while generator[0] != (generator[1]+1):
    #while (gendiff >5):
    genold=generator
    for n in range(Clusters):
        for i in range(0,nx):
            for j in range(0,ny):
                distmap[i,j,n]=abs(frog[i,j]-generator[n])#np.linalg.norm
        print (distmap[:,:,n])
        """  
        for j in range (0,nx):
            for jj in range (0,ny):
                minval=np.min(distmap[j,jj,:])
                #print(frog[j,jj], j,jj, [distmap[j,jj,:]])
                minind=(distmap[j,jj,:]) <= minval
                distmap[j,jj,minind]=1
                distmap[j,jj,~minind]=0
                #print(j,jj, [distmap[j,jj,:]])
                        
        for n in range(Clusters):
            #print (distmap[:,:,n])
            cind=distmap[:,:,n]==1 
            generator[n]=np.mean(frog[cind])
            print (generator[n])
        
        #gendiff=abs(generator[0]-genold)
            
            #count = count + 1 
        """
    return (generator)

graykmeans(frog,4)


#Task 2: RGB Image
#Use your favorite color image (or mandrill.tiff) and modify your algorithm to obtain approximations to the image using 4, 8, 16, 32, and 64 colors. Display your results along with the original image. As generators you will choose, e.g., 8 random points in the RGB color space and as long as there are a reasonable number of pixels in your image (such as 5122) you can sample the image by simply choosing each pixel to determine which of the 8 colors it is closest to; you can use the standard Euclidean length treating each point as a three-dimensional vector. Use a reasonable tolerance as your stopping criteria


mandrill = imread("mandrill.tiff", mode="L")
#maze = zoom(maze, 0.25)
#t = plt.pcolormesh(np.flipud(maze))
plt.imshow(mandrill)

x=[1,2,3]
v=int(np.mean([x[0],x[2]]))
v=range(v)
print (v[1])
print (random.sample(range(255),4))
