L = 1; %boundary for PDE

% x is a vector, starting at 0, going to L
x = (-4:0.01:4)*L;

%% include t
hold on;
% plot the behaviour of the pde at different values of t
for t = [0, 0.1, 0.5]
    u = 0*x;
    % set how many values of the sum to use
    N = 100;
    for n = 0:N
        % calculate coeffecient
        a_n = 2/(pi*n+(pi/2));
        % Add on an appropriate multiple of the separable solution
        u = u + a_n*sin((pi/2 + n*pi)*x/L)*exp((-1/2)* ... 
            t * (2*(pi/2 + n*pi)^2+t));
    end
    % plot the result
    plot(x,u)    
end
%% beautify the plot
title('Initial Condition: $f(x)=1$', 'Interpreter' ,'Latex');
xlabel('$x$', 'Interpreter' ,'Latex');
ylabel('$u$', 'Interpreter' ,'Latex')
legend('$t=0.0$', '$t=0.1$', '$t=0.5$', 'Interpreter' ,'Latex')
xlim([-4, 4])
ylim([-1.5, 1.5])