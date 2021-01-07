function J = jacobiany(fun,ti,xi,yi)
N = length(yi);
g = fun(ti,xi,yi);
J = zeros(N);
d = 0.001; 
for jj = 1:N 
 dely = zeros(N,1);
 dely(jj) = d;
 g1 = fun(ti,xi,yi+dely);
 for ii = 1:N 
 J(ii,jj) = (g1(ii) - g(ii))/d;
 end
end
