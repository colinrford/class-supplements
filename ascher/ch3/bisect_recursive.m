function  [p] = bisect_recursive(func,a,b,fa,fb,atol)
% bisect_recursive(func,a,b,fa,fb,atol) 
% Recursive implementation of the bisection method
% This function returns in p a value such that
%     | p - root | < atol
p = (a + b) / 2;
if b - a < atol
  return
else
  fp = feval(func,p);
  if fa * fp < 0
    b = p;
    fb = fp;
  else
    a = p;
    fa = fp;
  end
  p = bisect_recursive(func,a,b,fa,fb,atol);
end
