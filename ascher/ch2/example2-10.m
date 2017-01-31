% This script gives a more accurate way to compute the roots of a (monic)
% quadratic polynomial by employing the identity x_1 x_2 = c, where 
% x^2 - 2 b x + c = 0. By using the above mentioned identity we are able to 
% avoid the cancellation error when b^2 >> c.

if b > 0
  x1 = b + sqrt(b^2 - c);
  x2 = c / x1;
else
  x2 = b - sqrt(b^2 - c);
  x1 = c / x2;
end
