function J = jacobianx(fun,ti,xi,yi)
N = length(xi);
f = fun(ti,xi,yi);
J = zeros(N);
d = 0.001; 
for jj = 1:N 
 delx = zeros(N,1);
 delx(jj) = d;
 f1 = fun(ti,xi+delx,yi);
 for ii = 1:N 
 J(ii,jj) = (f1(ii) - f(ii))/d;
 end
end
