function X = fgsiedel(A,B,P)
% X = fgsiedel(A,B,P)
% A is an nxn diagonally dominant matrix, input.
% B is a nx1 vector, input.
% P is an nX1 starting vector, input.
d = diag(A);
D = diag(d);
OFFD = A - D;
n = length(d);
X=P;
for j=1:n
    X(j,1) = (B(j) - OFFD(j,:)*X)/d(j);
end