%%
L = 1;
syms f(x);
%Define the function
f(x) = sinh(sin(pi*x/2));
%Define the piecewise function
pw(x) = piecewise(x<-1, -f(x+2), -1<x<0, -f(-x), ...
    0<x<1, f(x), x>1, f(-x+2));

%plot over the interval
figure(2);
subplot(1, 2, 1);
hold on
plot([-2:0.001:2], pw([-2:0.001:2]));
xlabel('$x$', 'Interpreter' ,'Latex');
ylabel('$f(x)$', 'Interpreter' ,'Latex');
title('$f(x)=\sinh\big(\sin(\frac{\pi x}{2})\big)$', 'Interpreter' ,'Latex');

%repeat for differential
fdash(x) = (pi*cos(pi*x/2)*cosh(sin(pi*x/2)))/2;
pwdash(x) = piecewise(x<-1, -fdash(x+2), -1<x<0, -fdash(-x), ...
    0<x<1, fdash(x), x>1, fdash(-x+2));
subplot(1, 2, 2);
hold on
plot([-2:0.001:2], pwdash([-2:0.001:2]));
xlabel('$x$', 'Interpreter' ,'Latex');
ylabel('$f(x)$', 'Interpreter' ,'Latex');
title("$f'(x)=\frac{1}{2} \pi \cos(\frac{\pi x}{2})\cosh(\sin(\frac{\pi x}{2}))$", 'Interpreter' ,'Latex');
