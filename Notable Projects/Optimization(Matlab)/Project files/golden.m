% Ronney Aovida, LAB4, ISC4220, March 3rd, Question 1 part 2
function xopt = golden ( xL , xu , tol)

%This will perform the golden section search method

R = (sqrt(5)-1)/2;

d = R*(xu-xL);

x1 = xL+d ;
f1 = yeast(x1);

x2 = xu-d ;
f2 = yeast(x2);

while ( xu-xL > tol )

d = R*d;

if ( f1 > f2 )

xL = x2;

x2 = x1;

x1 = xL + d;

f2 = f1; 

f1 = yeast(x1); 

else
xu = x1;
x1 = x2;
x2 = xu-d;
f1 = f2;
f2 = yeast(x2);
end
end
xopt = (xu+xL)/2;

end