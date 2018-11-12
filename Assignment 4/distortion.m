function [x]=distortion(a,x)
%   A = -1<A<1.
k = 2*a/(1-a);
x = (1+k)*(x)./(1+k*abs(x));