%% Ronney Aovida December 3, 2015  Final Project
 
function [] = walkorrun(speed, distance,raindrop,height,width,theta)
%walkorrun Measurment of raindrops hitting a square object moving
%               against rain at different velocities and angles.

%Synopsis: []= walkorrun(velocity, distance,raindrop,height,width) 
% 
%Input: speed  =  velocity of the object [ft/s] 
%       distance = the parameter of how many units it will travel [ft] 
%       raindrop = The velocity of the rainfall [ft/s]
%       height  = the Y axis length of the object [ft] 
%       width  = the X axis length of the object [ft] 
%       theta = angle of rainfall due to the wind [theta]
%Output:  amount of rainfall hitting the object.
        
% ASSUMPTIONS: 

% The object is square shaped. 

% As the object moves it will hit more raindrops infront of it and avoid 
% some from above depending on the speed. 

% The objects absorbancy is 0%, we are counting how much droplets will hit
% the object where a decimal such a .3 is equal to 3/10 of a droplet.

% It is 2 dimensional, therefore not taking into account rain hitting the
% side of the object.  Rain will only hit the front and top of the object.

% Rainfall is falling uniformly, not at random.


% Default input values
if nargin == 0
speed = 40;
distance= 100;
raindrop= 29;
height= 6;
width= 2; 
theta= 10;
end

if nargin == 1
distance= 50;
raindrop= 29;
height= 6;
width= 2;
theta= 20;
end

if nargin == 2
raindrop= 29;
height= 6;
width= 2;
theta= 20;
end

if nargin == 3
height= 6;
width= 2;
theta= 20;
end

if nargin == 4
width= 2;
theta= 20;
end

if nargin == 5
theta= 20;
end

 % error statements
if height < 1
    error('please input a value above 0')
    
end

if width < 1
    error('please input a value above 0')
end

if raindrop < 1
    error('please input a value above 0')
end

if speed < 1
    error('please input a value above 0')
end

if distance < 1
    error('please input a value above 0')
end

if theta < 0
    error('please input a value that is positive')
end


      

time = distance/speed;          %calculates the time it takes to reach the 
                                %distance[seconds]
                                
% Initializing variable counters                         
raindropsV = 0;
raindropsH = 0;
          




angle= atan(raindrop/speed);  %This formula will determine the angle of 
                                 %the object to the rain horizontally 
   
angle1= asin(speed/raindrop);    %This formula will determine the angle of                      
                                %the object to the rain vertically

for i= 0:time           % this for loop will run the object through the 
                            % rain for every second as a iteration. 
                            
                            
   
  
 % This will count the amount of droplets the object hits vertically.  
 % where a 90 degree angle means the object will collide with 100% of the 
 % droplets above it.
    if angle > 0
       raindropsV = raindropsV + (angle*.9)*width;
    end 
     

   
  % This will count the amount of droplets the object hits horizontally, 
  % where a 90 degree angle means the object will collide with 100% of the 
  % droplets infront of it.
   if angle1 > 0
       raindropsH = raindropsH + (angle1*.9)*height*width;
   end
   
     
     % this will calculate how much rain will be hitting the object due to
     % wind direction pushing the rain at an angle theta.
   if theta > 0
       raindropsH = raindropsH + height*(theta*.01*.9)*width;
   end
   
 
horizontal = raindropsH;
vertical = raindropsV;


end

  

% The final output
fprintf('\nYou have hit %12.3f drops during %12.3f seconds where %12.3f are from above and %12.3f were collided with\n',raindropsH+raindropsV,time,vertical,horizontal);


end
