
%% Date: October 13, 2015            LAB #2
% Ronney Aovida

% In this assignment i am to create a function g_puff that measures the transport of a non-reactive contaminant with advection and
%dispersion in a homogeneous aquifer with average pore velocity and a mass of
%contaminant that is assumed to be injected instantaneously into an extensive aquifer of certain
%thickness.

% things i want you to know: I know this assignment is not complete and
% requires a few more lines of code to find the Discretization in time, to
% use Dt in a correct way than the way it is used, and to properly create
% the movie using getframe. Ill like to review what i could not do, i feel like i am
% really behind for not being able to accomplish this asignment.



function [conc,M]=G_puff(m,Dx,Dy,v,b)
%G_puff: Gaussian puff for solving advection-dispersion equations 
%Synopsis: [c,M]=G_puff(m,Dx,Dy,v,b) 
% 
%Input: m  = mass [kg] 
%       Dx = dispersion coeffient in X direction [m^2/day] 
%       Dy = dispersion coeffient in Y direction [m^2/day] 
%       v  = flow velocity [m/day] 
%       b  = aquifier thickness [m] 
% 
%Output: c = concentration of the containimant [kg/m^3] 
%        M = movie of concentration contours 

% Default input values
m=1.0;
Dx=0.5;
Dy=0.1;
v=0.5;
b=1.0;

% these are the values to be used to find the concentration and set the
% dimensions for the loop.
xmax=100;
xmin=0 ;
dx=2.5;
ymax=50;
ymin=-50 ;
dy=2.5;
tmax=100/v;
tmin=tmax/50;
dt=tmax/50;


% these statements will make sure the user inputs either the correct amount
% of inputs  or makes sure to input only positive numbers.
if (nargin ==0)
    disp('please type an input');
    %return
end
if ((m<0) ||(Dx<0)|| (Dy<0) || (v<0) || (b<0))
    disp('please insert a positive number');
    return
end
if (nargin >5)
    disp('too many inputs please insert 5 or less inputs');
    return
end


    
    


% Discretization of the domain. 
[X,Y]=meshgrid(xmin:dx:xmax,ymin:dy:ymax);

% initializes the concentration matrix
conc=zeros(41);

%the loop of time. this will run the inputs through the given equation in
%order to create a visual movie depicting the movement of the substance 
%through many frames in the contour.
for t=(tmin:tmax)

    conc(:,:,dt)=(((m/b)/(4*pi*t)*(sqrt( Dx*Dy))*exp((-((X-v*t).^2)/(4*Dx*t)-((Y.^2)/(4*Dy*t))))));
    contourf(X,Y,conc(:,:,dt));
    xlabel('x(m)');
    ylabel('y(m)');
    title('simulation time');
    
    

    

end

end