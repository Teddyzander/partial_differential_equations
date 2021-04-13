% Spinning off from calculating the seperable solution to the wave eq.
% satisfies BCs of u(0, t) = u(l, t) = 0

%% define variables for string
l = 10; %upper bound
c0 = 100; % wave speed
x = [0:0.01:l]; % points to evaluate on x
n = 1; %pick out eigen value
D = 1; %constant in wave equation
G = 0.9; %constant in wave equation
H = 0.2; %constant in wave equation

%% calculate lambda and define the function
lambda = ((n*pi)/l)^2;
wave = @(x, t) D*sin((n*pi*x)/l)*(G*cos((n*pi*c0*t)/l) + H*sin((n*pi*c0*t)/l));
for i=1:1000
    plot(x, wave(x, i/100)*-4*(cos((i/10)*pi)));
    title('Negative displacement for P=4, L=10')
    xlabel('spatial x in micrometers')
    ylabel('displacement in micrometers')
    ylim([-4, 4]);
    if i == 1
        pause
    end
    pause(0.05);
end