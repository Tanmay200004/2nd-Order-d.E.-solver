function p = RK2(f,g,y0,z0,xf,h)
N = ceil(xf/h);
z = zeros(N+1,length(y0));
y = zeros(N+1,length(y0));
x = zeros(N+1,1);
y(1,:) = y0';
z(1,:) = z0';
for i = 1:N
 x(i+1) = x(i) + h;
 l1 = h*g(x(i),y(i,:),z(i,:));
 k1 = h*f(x(i),y(i,:),z(i,:));
 l2 = h*g(x(i)+h/2,y(i,:)+k1'*h/2,z(i,:)+l1'*h/2);
 k2 = h*f(x(i)+h/2,y(i,:)+k1'*h/2,z(i,:)+l1'*h/2);
 z(i+1,:) = z(i,:) + l2;
 y(i+1,:) = y(i,:) + k2;
end
p = [y z x];
