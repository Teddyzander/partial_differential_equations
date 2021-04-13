%%
L = 1;

%%%% x is a vector, starting at 0, going to L
x = (0:0.01:1)*L;

%%% Plot one Fourier term
n = 2;
u = sin((pi/2 + n*pi)*x/L);

plot(x,u)
%%
%%% Calculate a Fourier series
u = 0*x;
N = 1000;
for n = 0:N
    a_n = 2/(pi*n+(pi/2));
    fourier = a_n*sin((pi/2 + n*pi)*x/L);
    u = u + fourier;
end

plot(x,u)
%%
%%% What if we want a solution to a PDE, depending on t and x?

%%% Calculate the solution at t = 0.1
u = 0*x;
N = 100;
t = 0.01;
for n = 0:N
    a_n = 2/(pi*n+(pi/2));
    %%%% Adding on an appropriate multiple of the separable solution
    u = u + a_n*sin((pi/2 + n*pi)*x/L)*exp((-1/2)* t * (2*(pi/2 + n*pi)^2+t));
end
plot(x,u)
hold on
%%
clf;
hold on;
for t = [0, 0.1, 0.5]
    u = 0*x;
    N = 10000;
    for n = 0:N
        a_n = 2/(pi*n+(pi/2));
        %%%% Adding on an appropriate multiple of the separable solution
        u = u + a_n*sin((pi/2 + n*pi)*x/L)*exp((-1/2)* t * (2*(pi/2 + n*pi)^2+t));
    end
    plot(x,u)    
end
xlabel('$x$', 'Interpreter' ,'Latex');
ylabel('$u$', 'Interpreter' ,'Latex')
legend('$t=0.0$', '$t=0.1$', '$t=0.5$', 'Interpreter' ,'Latex')
