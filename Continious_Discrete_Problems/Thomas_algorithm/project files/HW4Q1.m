%%part A)

%The Thomas algorithm does overwrite the c and d variables every iteration because it is a 
%simplified version of gaussian elimination that uses backwards substitution to find 
%the c d variables after every iteration/run





%%
%part B)
n=10;
c=ones(n,1);
a=ones(n,1);
b=ones(n,1)*-2;
d=zeros(n,1);
d(1)=-1;
d(n)=-1;
x=thomasalg(a,b,c,d,n)


%%
%part C)

%The algorithmic complexity of the thomas algorithm is cubic with respect
%to the dimension N of the system. It is one of the most efficient/fast
%running algoriuthms in terms to computation time. 

%The plot of the cpu time vs. N shows that as N increases the algorithm is
%able to compute at a linear level, which means that as N increases the CPU
%time increases in respect. However at lower values of notably 10^3 and
%10^4 the algorithm is not computing as efficient as the higher values.This
%does make sense.

t=zeros(10,1);
temp=zeros(10,1);
for i=10:20
    n=2^i;
c=ones(n,1);
a=ones(n,1);
b=ones(n,1)*-2;
d=zeros(n,1);
d(1)=-1;
d(n)=-1;
    tic;
    thomasalg(a,b,c,d,n);
    t(i-9)=toc;
    temp(i-9)=n;
end

loglog(t,temp)
