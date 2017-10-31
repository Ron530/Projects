import sys
def BMI(a,b):
    bmi= a/(2*b)*703.0
    return bmi

inp= float(sys.argv[1])
print(BMI(inp))
