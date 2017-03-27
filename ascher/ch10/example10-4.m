% script, minus some plotting instructions, used to generate Figure 10.5

x = .2:.01:5.2;   % evaluation mesh
% quadratic interpolant
xi = [1, 2, 4];
yi = [1, 3, 3];
[coef2, table] = divdif(xi, yi);
% evaluate quadratic at x
y2 = evalnewt(x, xi, coef2);
% add data point
xi = [xi, 5]; 
yi = [yi, 4];
% cubic interpolant
[coef3, table] = divdifadd(xi,yi,table);
% evaluate cubic at x
y3 = evalnewt(x, xi, coef3);
plot (x, y2, 'b', x, y3, 'g')
