% This script uses the MATLAB function bisect we wrote for two functions
% f(x) = x^3 - 30 x^2 + 2552, starting from the interval [0,20] with tolerance
% 1.e-8 gives x^* \approx 11.86150151 in 30 iterations
% f(x) = 2.5 sinh(x/4) - 1, starting from the interval [-10,10] with tolerance
% 1.e-10 gives x^* \approx 1.5601412791 in 37 iterations

format long g
[x,n] = bisect('fex2',0,20,fex2(0),fex2(20),1.e-8)
function f = fex2(x)
f = x^3 - 30 * x^2 + 2552;

format long g
[x,n] = bisect('fex3',-10,10,fex3(-10),fex3(10),1.e-10)
function f = fex3(x)
f = 2.5 * sinh(x/4) - 1;
