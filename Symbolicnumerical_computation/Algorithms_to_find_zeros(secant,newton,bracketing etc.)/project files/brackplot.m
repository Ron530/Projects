function xb = brackplot(fu,xmin,xmax,nx)
% brackplot    find subintervals on x that containa  sign changes of f(x)
%
% Synopsis:  fu= brackplot(fu,xmin,xmax)
%            fu= brackplot(fu,xmin,xmax,nx)
%           
%
% Input:  fun    = (strong) name of function that evaluates f(x)
%     xmin,xmax  = end points of intervals to subdivide into  brackets
%        nx      = number fo samples along the x axisused to test for
%        brackets.
%         
%
%  Output:  xb = two column matrix of bracket limits. 

if nargin<4, nx=20; end

xp=linspace(xmin,xmax); yp= feval(fu,xp);

plot(xp,yp,[floor(xmin) ceil(xmax)],[0 0]);

grid on; xlabel('x'); ylabel(['f(x) defined in ',fu,'.m']);

ytop= max(yp); ybot= min(yp);
ybox= 0.05*[ybot ytop ytop ybot ybot];
c= [0.7 0.7 0.7];


x= linspace(xmin,xmax,nx);
f= feval(fu,x);
nb= 0; xb= [];
for k=1:length(f)-1     
   proof=  sin((f(k))^2)+(f(k)^2)-(2*f(k))-0.09;
    if  sign(f(k))~=sign(f(k+1))|| proof < .3 && proof > 0
        nb= nb+1;
        xb(nb,1)= x(k);
        xb(nb,2)= x(k+1);
        hold on; fill([x(k) x(k) x(k+1) x(k+1) x(k)],ybox,c);
        
    end
end
hold off
if isempty(xb)
    warning('no brackets found. check [xmin,xmax] or increase nx');

end

