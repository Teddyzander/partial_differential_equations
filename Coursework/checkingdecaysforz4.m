%%
L = 1;

%%%% x is a vector, starting at 0, going to L
x = (-2:0.01:2)*L;

%%% Calculate a Fourier series
u = 0*x;
N = 10;
for n = 0:N
    a_n = -4*(-4*pi^2*n^2-4*pi^2*n-pi^2+8)/(pi^3*(8*n^3+12*n^2+6*n+1))
    fourier = a_n*sin((pi/2 + n*pi)*x/L);
    u = u + fourier;
end

figure(1)
%subplot(1, 2, 1)
hold on
plot(x,u)
xlabel('$x$', 'Interpreter' ,'Latex');
ylabel('$\sum_{n=0}^\infty A_n u_n(x, t)$', 'Interpreter' ,'Latex')

%%

L = 1;
syms x
f(x) = (1-x)^2;
pw(x) = piecewise(x<-1, -f(x+2), -1<x<0, -f(-x), 0<x<1, f(x), x>1, f(-x+2));

%%%% x is a vector, starting at 0, going to L
x = (-2:0.01:2)*L;
syms x
error = @(x) abs(pw(x) - u);

%%% Calculate a Fourier series
P = 25;
diff = zeros(P, 1);
for N = 1:P
    u = 0*x;
    for n = 0:N
        a_n = -4*(-4*pi^2*n^2-4*pi^2*n-pi^2+8)/(pi^3*(8*n^3+12*n^2+6*n+1));
        fourier = a_n*sin((pi/2 + n*pi)*x/L);
        u = u + fourier;
    end
    diff(N) = int((u-pw(x))^2,x, -2, 2);
    disp(N)
end

%%
figure(1)
subplot(1, 2, 2)
loglog(1:P, diff)
hold on
loglog(1:P, (ones(1,P)./(1:P)))
xlabel('$N$', 'Interpreter' ,'Latex');
ylabel('$\epsilon_N$', 'Interpreter' ,'Latex')
legend('Error', '$\frac{1}{N^3}$', 'Interpreter' ,'Latex')