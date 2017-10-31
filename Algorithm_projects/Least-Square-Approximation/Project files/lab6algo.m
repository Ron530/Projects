%Ronney Aovida, lab 8 first part of part 2

xt= [0 .25 .50 .75 1;exp(0) exp(.50) exp(1) exp(1.5) exp(2)];
x=xt';
m= [2.10;3.70;6.26;10.03;16.31];

xx= xt * x;
xm= xt * m;

a=xx\xm

    
