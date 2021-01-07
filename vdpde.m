function [ dxdt ] = vdpde(t,x )
m=5;
dxdt(1)=x(2) ;
dxdt(2)=m*(1-x(1).^2)*x(2)-3*x(1) ;
dxdt=dxdt' ;
end
