%% Create two random variables
x = 5.*randn(1000,1) + 10;  % Mean = 50, std = 5
y = 5.*randn(1000,1) + 10.5; % Mean = 100, std = 5
% Plot x&y
boxplot([x,y],'Notch','off','Labels',{'x','y'})

%% Student's t-test
% Test the alternative hypothesis that the population mean of x is greater than the population mean of y.
[hx,px,cix,statsx] = ttest2(x,y,'tail', 'right'); 
% Test the alternative hypothesis that the population mean of x is less than the population mean of y.
[hy,py,ciy,statsy] = ttest2(x,y,'tail', 'left'); 
% fprintf('')