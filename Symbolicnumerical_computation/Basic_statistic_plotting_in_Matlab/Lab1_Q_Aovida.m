%% Ronney Aovida September 10, 2015  LAB 1
%In this lab i am to calculate the total annual ppt for each year,
%calculate the mean monthly ppt, compare the standard deviations to the
%mean ppt, compare the mean and median ppt and plot all data values
%consecutively.

%% question 1

% this line will load the txt file of data into MATLAB
D=load('data.txt')

%% question 2


x= linspace(1960,1989,30)
% annualppt will calculate the sum total of ppt during every year from the
% data.txt file.
annualppt= sum(D',1)
% this will plot the sum of ppt and years on a line graph with blue solid
% lines with squares.
plot(x,annualppt,'bs-')
xlabel('year')
ylabel('total ppt')
title('Annual ppt')
legend('ppt during year')

%% question 3

% meanppt finds the mean value of each month from data.txt 
meanppt= mean(D,1)
% this will create a bar graph showing the results of meanppt
bar(meanppt)
xlabel('months')
ylabel('mean ppt')
title('monthly mean ppt')
legend('mean ppt monthly')

%this will find the standard derivation of data.txt and assign the value to
%variable E
E=std(D)
%errorbar will create a line graph depicting the error between the mean and
%standard derivation of the monthly ppt
errorbar(meanppt,E)
xlabel('months')
ylabel('ppt deviation')
title('standard deviation error of mean ppt')
legend('deviation error')
% shows the median of the monthly ppt and is used to compare to the mean in
% this assignment.i have found that the difference between the two values
% to be very minor.
medianppt= median(D,1)

%% question 4

% monthsum will calculate the total ppt for every month
shape= reshape(D',[12,30])
% this will plot the values of all the monthly ppt from january to december
% with 1 being january and 12 being december for every year from 1960-1989.
% the plots are marked with an x and the line black and solid.
plot(shape,'kx-')
xlabel('months')
ylabel('ppt for that month')
title('monthly ppt values for all years')
legend('ppt during that month')

% from the plotted data i could not find any seasonal pattern due to the
% data being too scattered and not consistant throughout the years
% 1960-1989.
