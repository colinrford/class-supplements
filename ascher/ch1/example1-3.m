% Here we desire to calculate the derivative of cosine at a point x_0
% by using the formula for the difference quotient (DQ).
% this script generates a log-log plot of the error versus h

x0 = 1.2;
f0 = sin(x0);
fp = cos(x0);
i = -20:0.5:0;                          % values for i range from -20 to 0
h = 10.^i;                              % ranging values of h
err = abs(fp - (sin(x0 + h) - f0)./h);  % absolute value of fp - DQ 
d_err = f0/2*h;
loglog (h, err,'-*');
hold on
loglog (h, d_err, 'r-.');
xlabel('h')
ylabel('Absolute error')
