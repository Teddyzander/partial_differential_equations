% You got this

%%
L = 1;
syms f(x);
%Define the function
f(x) = x;
%Define the piecewise function
pw(x) = piecewise(x<-1, -f(x+2), -1<x<0, -f(-x), ...
    0<x<1, f(x), x>1, f(-x+2));

%plot over the interval
figure(2);
hold on
plot([-2:0.001:2], pw([-2:0.001:2]));