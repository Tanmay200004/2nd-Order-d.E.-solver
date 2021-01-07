function p = Euler_implicit(f,g,x0,y0,tf,h)
iter_max = 100; 
error_tol = 0.001; 
N = ceil(tf/h);
t = zeros(N+1,1);
x = zeros(N+1,length(x0));
y = zeros(N+1,length(x0));
x(1,:) = x0';
y(1,:) = y0';
for i = 1:N
 t(i+1) = t(i) + h;
 y_current = y(i,:);
 x_current = x(i,:)';
 y_guess = y_current+h*g(t(i),x_current,y_current);
 x_guess = x_current+h*f(t(i),x_current,y_guess);
 disp(['For t = ' num2str(t(i+1))]);
 for ii = 1:iter_max
 N1 = length(y_guess);
 g1 = y_current + h*g(t(i+1),x_guess,y_guess) - y_guess;
 J = h*jacobiany(g,t(i+1),x_guess,y_guess) - eye(N1);
 dy = GE(J,-g1);
 y_new = y_guess +dy;
 er = norm(y_current + h*g(t(i+1),x_guess,y_new)-y_new);
 if er < error_tol
 disp(['Convergence achieved in ' num2str(ii) ' iterations']);
 break; 
 else
 if ii == iter_max
 disp('Maximum iterations reached without satisfying convergence criteria');
 else
 y_guess = y_new;
 end
 end
 end
 
 y(i+1,:) = y_new';

 x_guess = x_current+h*f(t(i),x_current,y_new);
 
 for jj = 1:iter_max
 N2 = length(x_guess);
 f1 = x_current + h*f(t(i+1),x_guess,y_new) - x_guess;
 J = h*jacobianx(f,t(i+1),x_guess,y_new) - eye(N2);
 dx = GE(J,-f1);
 x_new = x_guess +dx;
 er = norm(x_current + h*f(t(i+1),x_new,y_new)-x_new);
 if er < error_tol
 disp(['Convergence achieved in ' num2str(jj) ' iterations']);
 break; 
 else
 if jj == iter_max
 disp('Maximum iterations reached without satisfying convergence criteria');
 else
 x_guess = x_new;
 end
 end
 end
 x(i+1,:) = x_new';
end
p = [x y t];
end
