import sys

def HN(n):

    count = 0.
    HN=0
    while n>count:

        count = count + 1
        HN= HN + 1/count

        
    return HN

inp= float(sys.argv[1])
print(HN(inp))
