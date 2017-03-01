function [y, k] = newton(f, fp, x0)
% 
% newton Newton's method for solving a nonlinear equation 
%        in one variable
% Calling sequence [y, k]  = newton(f, fp, x0) 
% where 
% f is the function whose root is to be computed
% fp is the derivative of f 
% x0 is the initial guess 
% k is the number of iterations at termination
% Max number of iterations is set to 20
% 
k = 0; xold = x0; 
converged = 0; maxiter = 20;
while (converged == 0 && k < maxiter)
    xnew = xold - ( f(xold) / fp(xold) );
    k= k + 1;
    if (abs(f(xnew)) <= 10^-12)  converged = 1; end
    xold = xnew;
    fprintf('\n %i %20.16f \n', k, xnew);
    end
y = xnew;
