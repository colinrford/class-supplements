% This is part of an implementation of Horner's rule, which uses the  nested 
% form of a polynomial of degree n which requires only O(n) operations to 
% evaluate at a fixed point x.
%
% Assume the polynomial coefficients are already stored
% in array c such that for any real x, 
% p(x) = c(1) + c(2)x + c(3)x^2 + ... + c(n + 1)x^n
p = c(n + 1);
for j = n:-1:1
  p = p*x + c(j);
end
