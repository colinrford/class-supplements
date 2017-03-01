function newtonfrac(coeff,numsteps,range)
%
%newtonfrac    Newton's method fractal drawer
%
% Calling sequence     newtonfrac(coeff)
%               or     newtonfrac(coeff,numsteps,range)
%
% where
%
%      coeff is the vector of coefficients of a polynomial, entered
%            from highest degree to lowest (so x^3+2x^2-x+3 is entered
%            as [ 1 2 -1 3 ])
%
%            if this argument is not given it defaults to [ 1 0 0 -1 ]
%            (the polynomial x^3-1)
%
%      numsteps is an integer specifying the grid size
%
%            if this argument is not given it defaults to 200
%            (low resolution, but relatively quick to execute)
%
%      range specifies the region in the plane of interest; enter in the
%            form [ xmin xmax ymin ymax ]
%
%            if this argument is not given, the region is chosen to 
%            include all the roots of the polynomial.
%
% A numsteps by numsteps grid of points is chosen in the region specified
% by range, and each point in the grid is coloured according to which root
% of the given polynomial Newton's method converges to, using the grid point
% as the initial guess.
%
% The polynomial should be degree three or more in order to be interesting,
% and degree six or less due to the way the colours are handled.

tolerance = 10^(-3);
maxiterations = 1000;

if nargin < 1
   coeff = [ 1 0 0 -1];
end

if nargin < 2
   numsteps = 200;
end

%determine the roots
theroots = roots(coeff);
deg = length(coeff)-1;
if deg>6
error(sprintf('I only know the names of six colours.\nPlease use a polynomial of lower degree'))
end

if (nargin < 3)
   margin = 0.5;
   xlow =  min(real(theroots));
   xhigh = max(real(theroots));
   ylow =  min(imag(theroots));
   yhigh = max(imag(theroots));

   xmin = xlow-margin*(max(xhigh-xlow,1));
   xmax = xhigh+margin*(max(xhigh-xlow,1));
   ymin = ylow-margin*(max(yhigh-ylow,1));
   ymax = yhigh+margin*(max(yhigh-ylow,1));
 else
   xmin = range(1);
	xmax = range(2);
	ymin = range(3);
        ymax = range(4);
end


%initialise
x = linspace(xmin,xmax,numsteps);
y = linspace(ymin,ymax,numsteps);

colours = 'rgbcmy';
colourcount = zeros(1,deg);
colourrecord = zeros(deg,numsteps^2);

%calculate derivative of polynomial
polydash = [deg:-1:1].*coeff(1:deg);

for u=x
for v=y

z = u+v*i;
z0 = z;

%%%% carry out Newton's method %%%%

%initialize
err = inf;
iterate = 0;

%begin loop
while ((err > tolerance) & (iterate<maxiterations))

%  f = polyval(coeff,z);
%  fdash = polyval(polydash,z);

  znew = z-polyval(coeff,z)/polyval(polydash,z);

  err = abs(z-znew);
  iterate = iterate+1;

  z = znew;

end

if err <= tolerance
  root = z;
 else
   root = NaN;
end

%%%% end Newton's method  %%%%%%

[dist,whichroot]=min(abs(root-theroots));

colourcount(whichroot)=colourcount(whichroot)+1;
colourrecord(whichroot,colourcount(whichroot))=z0;

end
end

figure(1)
clf()
hold on
for k = 1:deg

plotarg = strcat(colours(k),'.');
thiscolour = colourrecord(k,1:colourcount(k));
plot(thiscolour,plotarg,'MarkerSize',1)

end
plot(theroots,'k*','MarkerSize',3)
axis('equal')
axis([xmin xmax ymin ymax])

hold off
