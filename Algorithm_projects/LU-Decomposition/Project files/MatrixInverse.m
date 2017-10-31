function inverse=MatrixInverse(A)

%This will preform the LU decomposition of A and incorporate the forward
%and backward substitution steps numerous times until it is a mxm matrix of
% m * nx1 vectors that equal a matrix that is in fact the inverse of matrix A 

[L,U,P] = lu(A);
I=eye(size(A));
Size=size(A,1);
inverse=zeros(size(A));
for i=1:Size
B=I(:,i);
inverse(:,i)=Backward(U,Forward(L,P*B));
end
inverse
proof= abs(inverse * A);
proof
end
