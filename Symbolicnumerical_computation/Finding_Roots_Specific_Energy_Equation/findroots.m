close all;
clc;
%% Plot of the specific energy function
dx=0.1;
h=-1.5:dx:1.5;
c=0.05; E=1;
f=h.^3-E.*h.^2+c;
plot(h,f,'-');
axis([-1.5 1.5 -1.5 1.5]);
xlabel('h (m)')
ylabel('f(h) (m^3)')
grid

%% Finding the roots using MATLAB roots and fzero functions
h_roots=roots([ 1 -E 0 c]);
y0=zeros(3,1);
hold on;
fprintf(1,'roots = %12.8f, %12.8f, %12.8f\n\n',h_roots)
plot(h_roots,y0,'or')
h_fzero(1)=fzero('sef',1.0);
h_fzero(2)=fzero('sef',0.5);
h_fzero(3)=fzero('sef',-0.5);
fprintf(1,'roots = %12.8f, %12.8f, %12.8f\n\n',h_fzero)
plot(h_fzero,y0,'+g')
saveas(gcf,'Figure1','pdf');
%% Finding the roots using secant method
tol=logspace(log10(1e-1),log10(1e-16),16); % tol increases from E-16 to E-1
%tol=eps;
for i=1:length(tol)
    fprintf(1,'Tolerance=%12.4e\n',tol(i))
    x1=0.5;     % x0 value
    f1=sef(x1);
    x2=1.3;     % x1 value
    f2=sef(x2);
    iter=0;
    fprintf(1,'      x1            x2            f1            f2      \n')    
    fprintf(1,'%12.8f, %12.8f, %12.4e, %12.4e\n',x1,x2,f1,f2)
    while abs(x2-x1)>tol(i),
        x0=x1;
        f0=f1;
        x1=x2;
        f1=f2;
        iter=iter+1;
        x2=x1-f1.*(x1-x0)./(f1-f0); % implement the secant method
        f2=sef(x2);
        fprintf(1,'%12.8f, %12.8f, %12.4e, %12.4e\n',x1,x2,f1,f2)
    end
    fprintf(1,'root = %12.8f,f2=%12.8f\n',x2,f2)
    fprintf(1,'# of iterations =%5i\n\n',iter)
end

%%  Examining the convergence rate
% h_fzero(1)=fzero('sef',1.0);  %  for x=0.94387725
% h_fzero(2)=fzero('sef',0.5);  %  for x=0.25992433
% h_fzero(3)=fzero('sef',-0.5); %  for x=-0.20380158
fprintf('\nVerification of the golden ratio\n');
tol=1.0e-6; % The selected optimum tolerance 
x_true=fzero('sef',1.0); % A solution given by the solution of problem (b)
x1=0.5;     % x0 value
f1=sef(x1);
x2=1.3;     % x1 value
f2=sef(x2);
iter=0;
fprintf(1,'      x1            x2            f1            f2            e1            e2            r\n')  
fprintf(1,'%12.8f, %12.8f, %12.4e, %12.4e\n',x1,x2,f1,f2)
while abs(x2-x1)>tol
    x0=x1;
    f0=f1;
    e0=abs(x0-x_true);
    x1=x2;
    f1=f2;
    e1=abs(x1-x_true);
    iter=iter+1;
    x2=x1-f1.*(x1-x0)./(f1-f0); %  the secant method
    f2=sef(x2);
    e2=abs(x2-x_true);
    if(iter==1)
       fprintf(1,'%12.8f, %12.8f, %12.4e, %12.4e, %12.4e, %12.4e\n',x1,x2,f1,f2,e1,e2)
    else
       r=log(e2/e1)/log(e1/e0);
       fprintf(1,'%12.8f, %12.8f, %12.4e, %12.4e, %12.4e, %12.4e, %12.8f, %12.8f\n',x1,x2,f1,f2,e1,e2,r,e2/e1^1.618)
    end
end
 
