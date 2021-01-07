# 2nd-Order-d.E.-solver
to check ouput of RK2, Euler Implicit and Crank Nicholson use fun_ODE as input 'f',
and fun_ODE 2 as input 'g'.
In Euler Implicit and Crank Nicholson x0 is the initial value of x i.e. (x(t=0))
and y0 is the initial value of dx/dt i.e. (y=dx/dt|t=0). Input 'tf' is the final time t at which the value of x is to be computed.
h is stepsize.
For RK2 y0 is the initial value of y i.e. (y(x=0)) and z0 is the initial value of dy/dx i.e. (z=dy/dx|x=0). Input 'xf' is the final value of x at which value of y is to be computed
h is stepsize
for ode23s use vdpde as the input function.
 
