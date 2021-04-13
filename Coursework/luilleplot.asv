%plot the function for values of k
f = @(k) k.*cos(k) + sin(k);

x = [0:0.01:30];
figure(3)
plot(x, f(x))
grid on
xlabel('$k$', 'Interpreter' ,'Latex');
ylabel('$k\cos(k)+\sin(k)$', 'Interpreter' ,'Latex')
title('Eigenvalues')

%% find first 10 roots, excluding negatives and k=0
lambda = zeros(1,12);

lambda(1) = fzero(f, [2 2.2]);
lambda(2) = fzero(f, [4.5 5]);
lambda(3) = fzero(f, [7.9 8]);
lambda(4) = fzero(f, [11 11.2]);
lambda(5) = fzero(f, [14 14.4]);
lambda(6) = fzero(f, [17.2 17.4]);
lambda(7) = fzero(f, [20.4 20.5]);
lambda(8) = fzero(f, [23.4 23.8]);
lambda(9) = fzero(f, [26.6 26.8]);
lambda(10) = fzero(f, [29.8 30]);
lambda(11) = fzero(f, [33 33.1]);
lambda(12) = fzero(f, [36.1 36.2]);

%% plot first 4 eigenfunctions for 0 < x < 1
x=[0:0.01:1]
figure(1)
for n=1:4
    X = @(x) sin(lambda(n)*x);
    plot(x, X(x))
    hold on
end
grid on
xlabel('$x$', 'Interpreter' ,'Latex');
ylabel('$X_n(x)$', 'Interpreter' ,'Latex')
legend('$X_0(x)$', '$X_1(x)$', '$X_2(x)$', '$X_3(x)$', ...
    'Interpreter' ,'Latex', 'Location', 'Southeast')
title('Eigenfunctions')

%% plot  sine(4x) and the estimate with 10 eigenfunctions
x=[0:0.001:1];

B = @(k) ((2)/(1-(1/(2*k))*sin(2*k)))^0.5;
c = @(k) (B(k)/2)*((-1/(4+k))*sin(k+4)+(1/(4-k))*sin(-k+4));
phi = @(k, x) B(k)*sin(k*x);

u=0;

for n=1:10
    phi(lambda(n), x);
    u = u + c(lambda(n))*phi(lambda(n), x);
end

figure(2)
plot(x, u, '-b')
hold on
plot(x, sin(4*x), '--r')
title('10 term series estimation of $\sin(4x)$', 'Interpreter', 'Latex')
xlabel('$x$', 'Interpreter', 'Latex')
ylabel('$f(x)$', 'Interpreter', 'Latex')
legend('$\sum_{n=1}^{10}c_n\phi_n(x)$', '$sin(4x)$',...
    'Location', 'Southwest', 'Interpreter', 'Latex')
ylim([-1.1, 1.1])


