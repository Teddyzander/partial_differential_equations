%%
L = 1;
syms x
f(x) = x;
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
        a_n = (-1)^n*(2)/(pi * n + (pi/2))^2;
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
loglog(1:P, (ones(1,P)./(1:P).^3))
xlabel('$N$', 'Interpreter' ,'Latex');
ylabel('$\epsilon_N$', 'Interpreter' ,'Latex')
legend('Error', '$\frac{1}{N^3}$', 'Interpreter' ,'Latex')
title('$\int_{-2}^2|f_{pe}-S_N|^2$', 'Interpreter' ,'Latex')