%%
L = 1;

%%%% x is a vector, starting at 0, going to L
x = (-2:0.01:2)*L;

%%% Calculate a Fourier series
u = 0*x;
N = 25;
for n = 0:N
    a_n = 2/(pi*n+(pi/2));
    fourier = a_n*sin((pi/2 + n*pi)*x/L);
    u = u + fourier;
end

figure(2)
subplot(1, 2, 1)
hold on
plot(x,u)
xlabel('$x$', 'Interpreter' ,'Latex');
ylabel('$\sum_{n=0}^\infty A_n u_n(x, t)$', 'Interpreter' ,'Latex')

%%
syms x
f(x) = 1;
pw(x) = piecewise(x<-1, -f(x+2), -1<x<0, -f(-x), 0<x<1, f(x), x>1, f(-x+2));

figure(2)
plot([-2:0.01:2], pw([-2:0.01:2]))
%%
subplot(1, 2, 1)
legend('$N=1$', '$N=10$', '$N=25$', '$f(x)=1$', ...
    'Interpreter' ,'Latex', 'Location', 'Southeast')
title('Convergence of Fourier Series')



