%% LAB 2 for ISC 4220 ALGORITHMS 1
  

% RONNEY AOVIDA
  
%Question 1: If the direct input into Lake Michigan increases from 710 to 1000, due to the increasing
%population of Chicago, how would it affect the other lakes?

% It will affect the other lakes by a small amount except for 2 lakes of
% which correspond to the vector at columns 2 and 4 since the water flow
% does not directly influence its level while being distrubuted to other
% lakes by being withrawn and deponsited at different amounts.



function [ x ] = gaussian2(A,n)

%Synopsis: [x]= gaussian(A,n) 
% 
%Input: A  =  Matrix A
%       n = number of columns in A
%       
%Output:  x = solves for the "x" in Ax=B
if nargin <1
n=5;
  A= [0   0    36  0     0; 
      67  0    0   0     0; 
      67 -161  36  0     0;
      0   161  0  -182   0; 
      0   0    0   182 -212];
  
  B= [1000; 180; -740; 3850; 4720];
  
end

 for i = 1:(n-1)
 % searching for the max number in this column
    templargest= A(i,i); 
    tempindex= i;
     
    for k = (i+1):n
     
     if  A(k,i)>= templargest
         templargest= A(k,i);
         tempindex=k;
        
     end
        
    end
    % swaps maximum row with current row
    for k= i:n
        
        temp= A(tempindex,k);
        A(tempindex,k)= A(i,k);
        A(i,k)=temp;
        
        
         temp= B(tempindex);
        B(tempindex)= B(i);
        B(i)=temp;
        
        
    end
    % makes all rows below this one zero in current column
    
    M= eye(n);
    
    for k= (i+1):n
        
    M(k,i)= -A(k,i)/A(i,i) ;  
  
    
                
    end
    A= M*A;
    B =M*B;
 end
    A

 
 
 

i=n;
while i>=1
    
    
    
    
    k=n;
    while k>i
        
        B(i,1)= B(i,1)-(A(i,k)*x(k));
        k=k-1;
        
    end
    
    x(i)= B(i,1)/A(i,i);
    i=i-1;
end
end