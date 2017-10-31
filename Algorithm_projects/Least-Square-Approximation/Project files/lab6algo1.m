%Ronney Aovida, LAB 8  part 1

X=[1 -1 0 0;-1 0 1 0;1 0 0 -1;0 0 1 -1;0 1 0 -1;1 1 1 1];
Xt= X';
f= [4;9;6;3;7;20];
fx= Xt* f;
xx= Xt*X;
a=xx\fx

