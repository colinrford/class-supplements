% This script generates three plots of three different functions on various
% intervals. The viewing windows are ideally large enough observe any zeros
% of the selected functions. They are: 
% (i) f(x) = sin(x) on [0, 4 \pi]
% (ii) f(x) = x^3 - 30 x^2 + 2552 on [0, 20]
% (iii) 10 \cosh(x / 4) - x on [-10, 10]

% (i)
t = 0:.1:4*pi;
tt = sin(t);
ax = zeros(1, length(t));
xrt = 0:pi:4*pi;
yrt = zeros(1,5);
subplot(3, 1, 1)
plot(t, tt, 'b', t, ax, 'k', xrt, yrt, 'rx');
xlabel('x')
ylabel('f(x)')

% (ii)
t = 0:.1:20;
tt = t.^3 - 30*t.^2 + 2552;
ax = zeros(1, length(t));
subplot(3, 1, 2)
plot(t, tt, 'b', t, ax, 'k', 11.8615, 0, 'rx');
xlabel('x')
ylabel('f(x)')

% (iii) 
t = -10:.1:10;
tt = 10 * cosh(t ./4) - t;
ax = zeros(1, length(t));
subplot(3,1,3)
plot(t, tt, 'b', t, ax, 'k');
xlabel('x')
ylabel('f(x)')
