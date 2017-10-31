#This is Draft submission.
#By: Ronney Aovida
#FINAL PROJECT
# data set used from section 3 of midterm
#FINAL PROJECT
# data set used from section 3 of midterm
import numpy as np
from collections import defaultdict
import numpy as np
from matplotlib import pyplot as plt

vertices=['A','B', 'C', 'D', 'E', 'F','G','H','I','J','K','L','M']
coord= [[0,12],[2,8],[6,8],[2,4],[6,4],[0,0],[10,8],[14,10],[18,10],[14,4],[18,4],[14,0],[18,0]]
realx,realy=[],[]
for t in coord:
    realx.append(t[0])
    realy.append(t[1])
parent = dict()
rank = dict()



def edgelist2(listt,coords):
    graph = defaultdict(list)
    edges=np.zeros((len(coords),len(coords)-1))
    graph['edges']=set()
    for i in range(len(listt)):
        for ii in range(len(listt)-1):
            edges[i,ii]=((((coords[ii+1][0]-coords[i][0])**2)+((coords[ii+1][1]-coords[i][1])**2))**.5)
    for x in listt:
        graph['vertices'].append((x))
    for m in range(len(edges)):
        for mm in range(len(edges)-1):
            graph['edges'].add((edges[m,mm],listt[m],listt[mm+1]))
    return graph


graph= edgelist2(vertices,coord)


def cycle(vertice):
    if parent[vertice] != vertice:
        parent[vertice] = cycle(parent[vertice])
        #print (parent[vertice])
    return parent[vertice]

def cycle2(vertice1, vertice2):
    
    root1 = cycle(vertice1)
    root2 = cycle(vertice2)
    if root1 != root2:
        if rank[root1] > rank[root2]:
            parent[root2] = root1
        else:
            parent[root1] = root2
            if rank[root1] == rank[root2]: 
                rank[root2] += 1

def kruskal(graph):
    minimumspanningtree = set()
    edges = list(graph['edges'])
    edges.sort()
    for vertice in graph['vertices']:
        parent[vertice] = vertice
        rank[vertice] = 0
    for edge in edges:
        weight, vertice1, vertice2 = edge
        if cycle(vertice1) != cycle(vertice2):
            cycle2(vertice1, vertice2)
            minimumspanningtree.add(edge)
    return minimumspanningtree
print (kruskal(graph))

letters=''
result=kruskal(graph)
xaxis,yaxis,thecoords,were,inletters=[],[],[],[],[]
for q in result:
    letters=letters+q[1]+q[2]
for i in range(len(result)*2):
    inletters.append(letters[i])
    were.append(vertices.index(inletters[i]))
    thecoords.append(coord[were[i]])
    xaxis.append(thecoords[i][0])
    yaxis.append(thecoords[i][1])

    
#unfortunetly I cannot accurately connect the coordinates of a scatter plot since plt.plot refuses to connect points the way i want it too
plt.scatter(realx,realy)
plt.axis([-5,30,-5,30])
plt.show()
for point in range(len(xaxis)-1):
    plt.plot([xaxis[point],xaxis[point+1]],[yaxis[point],yaxis[point+1]],color='b')
plt.scatter(xaxis,yaxis)
plt.axis([-5,30,-5,30])
plt.show()



def organize(graph):
    graph=list(graph['edges'])
    temp=[]
    alphabet=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
    for num in range(len(graph)):
        for num2 in range(len(graph)):
            if alphabet[num]== graph[num2][1] and alphabet[num+1]== graph[num2][2]:
                temp.append(graph[num2])
    graph=temp
    return graph


def nearest(graph):
    graph2=[]
    graph=organize(graph)
    for i in graph:
        graph2.append([i[0]])
    graph=graph2
    a = [0]
    b = list(range(1,len(graph)))
    while b:
        # last node placed in a
        last = a[-1]
        neighbors = graph[last]
        for n in neighbors:
            print (n)
            if n not in a:
                break
            else:
                print ("dead end")
        b.remove (n)
        a.append (n)
        
    return a

