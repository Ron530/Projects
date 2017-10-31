% Ronney Aovida, question 2 Lab 5

x= [1 2 3 4 5];
fx=[1 2 5 45 12];
cspline= interp1(x,fx,linspace(1,5,1000),'spline');
scatter(x,fx)
hold on
plot(linspace(1,5,1000),cspline,'k')
pchip= interp1(x,fx,linspace(1,5,1000),'pchip');
plot(linspace(1,5,1000),pchip,'b')

%Compared to the cubic spline, do you observe overshoot?

% Using figure 1 as a reference, yes, i do observe overshoot. following the
% black line (the spline line) you will see that the graph is not touching
% the points at points of maxima or minimum, rather it is just along its
% path. using the pchip function, the blue line, you can see that it
% touches the points on the scatter plot at points where no overshoot is
% seen since it is at the relative maxima and the relative minima areas of
% the curve. pchip (blue line) is known to avoid overshoot by using a more
% direct straight line kind of graphing to show the intermediate points in
% a more accurate manner, however using a smooth curved line can still show
% the same results by observing where the points are relative to the entire
% curve itself.
% why does this happen: because at the intermediate points the slope
% changes sign on the two sides of the points and then pchip is able to set
% the sloped to zero at these points.
