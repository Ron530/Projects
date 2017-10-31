%% HOMEWORK 5 
% By Ronney Aovida

%% PART A
% The nodes range from [0,2]. It is hard coded into the geo function.
nodes=9;
[ ele,unkwn, xcoord,local,weight,quadpoint ] = geo(nodes)

%% PART B

x=[.25,.375,.5,.675,.75];
for i= 1:length(x)
[phi(i),phi_deriv(i)]=linear_basis(x(i),3,xcoord)
end

%incomplete assignment
