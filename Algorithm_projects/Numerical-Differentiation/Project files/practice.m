%work done by: Ronney Aovida
%Homework 2. Question 3, part2: Gauss quadrature

f=@(x) exp(-x^2);

xi= sqrt((3-2*sqrt(6/5))/7);
xii= sqrt((3+2*sqrt(6/5))/7);
negxi= -(sqrt((3-2*sqrt(6/5))/7));
negxii= -(sqrt((3+2*sqrt(6/5))/7));


wi= (18+sqrt(30))/36;
wii= (18-sqrt(30))/36;

I= (1)* (wi*f(((negxi*2)/2)+(1)))+  (wi*f(((xi*2)/2)+1)) + (wii*f(((negxii*2)/2)+1)) + (wii*f(((xii*2)/2)+1))

abserror= abs(I-0.8821)


