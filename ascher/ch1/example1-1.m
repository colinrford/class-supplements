% The Stirling Approximation is used to approximate factorials
% .* elementwise multiplication

e=exp(1);
n=1:10;                       % array
Sn=sqrt(2*pi*n).*((n/e).^n);  % the Stirling approximation
fact_n=factorial(n);
abs_err=abs(Sn-fact_n);       % absolute error
rel_err=abs_err./fact_n;      % relative error
format short g
  [n; fact_n; Sn; abs_err; rel_err]'  % print out values
