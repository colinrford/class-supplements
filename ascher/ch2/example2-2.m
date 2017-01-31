% This script demonstrates the almost random nature of roundoff errors.
% It compares single and double precision rounding units of the function
% g(t) = e^{-t}(\sin(2 \pi t) + 2) -- this essentially gives the rounding error
% in the less accurate single precision evaluations
% The output indicates that the relative error is at about the rounding unit
% level

t = 0:.002:1;
tt = exp(-t) .* (sin(2*pi*t)+2);
rt = single(tt);
round_err = (tt - rt) ./tt;
plot (t, round_err, 'b-');
title ('Error in sampling exp(-t)(sin(2\pi t)+2) single precision')
xlabel('t')
ylabel('roundoff error')

% relative error should be about eta = eps(single)/2
rel_round_err = max(abs(round_err)) / (eps('single')/2)
