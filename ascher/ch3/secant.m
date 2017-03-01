function [y, k] = secant(f, x0, x1)
%
% secant Secant method for solving a nonlinear equation
%        in one variable
% Calling sequence [y, k]  = secant(f, fp, x0)
% where
% f is the function whose root is to be computed
% x0 is the first initial guess
% x1 is the second initial guess
% k is the number of iterations at termination
% Max number of iterations is set to 20
%
k = 0; xkmo = x0; xk = x1;                                  % xkmo 'x_{k - 1}', xk = 'x_k'
converged = 0; maxiter = 20;
while (converged == 0 && k < maxiter)
xkpo = (xkmo*f(xk) - xk*f(xkmo)) / (f(xk) - f(xkmo));   % rearranged secant method
k = k + 1;
if (abs(f(xkpo)) <= 10^-12)
converged = 1;
end
xkmo = xk;
xk = xkpo;
fprintf('\n %i %20.16f \n',k, xkpo);
end
y = xkpo;
