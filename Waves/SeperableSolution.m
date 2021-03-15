% Spinning off from calculating the seperable solution to the wave eq.
%satisfies BCs of u(0, t) = u(l, t) = 0

%% define variables for string
l = 10; %upper bound
c0 = 10; % wave speed
x = [0:0.01:l]; % points to evaluate on x
n = 1; %pick out eigen value
D = 1; %constant in wave equation
G = 0.9; %constant in wave equation
H = 0.2; %constant in wave equation

%% calculate lambda and define the function
lambda = ((n*pi)/l)^2;
wave = @(x, t) D*sin((n*pi*x)/l)*(G*cos((n*pi*c0*t)/l) + H*sin((n*pi*c0*t)/l));

for i=1:1000
    plot(x, wave(x, i/100));
    ylim([-2, 2]);
    pause(0.05);
end