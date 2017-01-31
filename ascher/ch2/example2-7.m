% This script just simply demonstrates that proper rounding yields 
% fl(1 + \alpha) = 1 for any number \alpha that satisfies |\alpha| \leq \eta

eta = .5*2^(-52);   % eta will output 1.1102e-16
beta = (1+eta)-1;   % beta will output 0
