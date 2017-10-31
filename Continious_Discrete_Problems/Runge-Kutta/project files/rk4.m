% please use conthw3.m to run this code in relation to the homework 3
% assignment.    Work done by Ronney Aovida

function [Y,T,yexact] = rk4(f, y0, t0, tf, dt,s,ytrue)


yexact=[];
    function [A,B,C]=bt1
        A=0;
        C=0;
        B=1;
        return
    end
function [A,B,C]=bt2
        A=[0,0;2/3,0];
        C=[0;2/3];
        B=[1/4;3/4];
        return
end
function [A,B,C]=bt3
        A=[0,0,0;1/2,0,0;-1,2,0];
        C=[0;1/2;1];
        B=[1/6;2/3;1/6];
        return
end
    function [A,B,C]=bt4
        A=[0,0,0,0;1/2,0,0,0;0,1/2,0,0;0,0,1,0];
        C=[0;1/2;1/2;1];
        B=[1/6;1/3;1/3;1/6];
        return
    end

if s==1
    [A,B,C]=bt1;
end

if s==2
     [A,B,C]=bt2;
end

if s==3
     [A,B,C]=bt3;
end
        
if s==4
     [A,B,C]=bt4;
end
            

% discretize in time
T = t0 : dt : tf;
% initialize Y
Y = zeros(size(T));
Y(1) = y0;
% loop over time steps

k=zeros(s,1);
 for i = 1 : length(T)-1
% calculate k values

k(1) = f(Y(i), T(i));
for j=2:s
    k(j)=f(Y(i)+dt*A(j,:)*k, T(i)+C(j)*dt);
  
% k(2) = f(Y(i) + dt*A(2,1)*k(1), T(i) + C(2)*dt);
% k(3) = f(Y(i)+ dt*(A(3,1)*k(1)+ A(3,2)*k(2)),T(i)+C(3)*dt);
% k(4) = f(Y(i)+dt*(A(4,1)*k(1)+A(4,2)*k(2)+A(4,3)*k(3)),T(i)+C(4)*dt);
    
end

Y(i+1) = Y(i)+dt* (k'*B);
yexact(i)=ytrue(T(i));
 end
yexact(length(T))=ytrue(T(end));


end

