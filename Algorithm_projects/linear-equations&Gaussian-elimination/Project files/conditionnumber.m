%% LAB 2 for ISC 4220 ALGORITHMS 1

% RONNEY AOVIDA

%Question 1: What is the condition number of the resulting matrix? You may use Matlab’s intrinsic
%function for this part

A= [0   0    36  0     0; 
      67  0    0   0     0; 
      67 -161  36  0     0;
      0   161  0  -182   0; 
      0   0    0   182 -212];
  
  disp (cond(A));