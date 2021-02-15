mu = 0.1; % friction in system
g = -9.8; % acceleration due to gravity
L = 2; % length of the pendulum

% equation for acceration of pendulum
theta_dd = @(theta, theta_d) -1 * mu * theta_d - (g/L) * sin(theta);

% set up matrices
theta_test = [-3*pi:0.25:3*pi];
theta_d_test = [-5:0.25:5];

accel_u = zeros(length(theta_test), length(theta_d_test));
accel_v = zeros(length(theta_test),  length(theta_d_test));
magnitude = zeros(length(theta_test),  length(theta_d_test));

% calculate vector field at each point in mesh
for i=1:length(theta_test)
    for j=1:length(theta_d_test)
        accel_u(i ,j) = theta_d_test(j);
        accel_v(i, j) = theta_dd(theta_test(i), theta_d_test(j));
        magnitude(i, j) = sqrt(accel_u(i ,j)^2 + accel_v(i ,j)^2);
    end
end

true_u = accel_u';
true_v = accel_v';

%plot vector field
figure(1)
contourf(theta_test, theta_d_test, magnitude', '--');
colormap(flipud(hot))
hold on
quiver(theta_test, theta_d_test, accel_u', accel_v');
title('vector field to show behavour of swinging pendulum')
xlabel('angle of pendulum')
ylabel('change in angle')
grid on
c = colorbar;
c.Label.String = 'accelration in m/s' 

% do 5000 steps of swing
figure(2);
step = [1:1:5000];
t = 100 % t is factor to shrink time step
angle = zeros(length(step), 1);
angle_change = zeros(length(step), 1);
angle(1) = 1/2*pi;
angle_change(1) = 5;

for i=2:length(step)
    change = theta_dd(angle(i - 1), angle_change(i - 1));
    angle_change(i) = angle_change(i-1) + change/t;
    angle(i) = angle(i - 1) + angle_change(i - 1)/t;
end

plot(angle, angle_change, '-r')
hold on

% do 5000 steps of another swing
figure(2);
step = [1:1:5000];
t = 100 % t is factor to shrink time step
angle = zeros(length(step), 1);
angle_change = zeros(length(step), 1);
angle(1) = 1/3*pi;
angle_change(1) = 4.5;
% see how mu effects behaviour
mu = 0.15;
theta_dd = @(theta, theta_d) -1 * mu * theta_d - (g/L) * sin(theta);

for i=2:length(step)
    change = theta_dd(angle(i - 1), angle_change(i - 1));
    angle_change(i) = angle_change(i-1) + change/t;
    angle(i) = angle(i - 1) + angle_change(i - 1)/t;
end

plot(angle, angle_change, '-b')

title('examples of a swinging pendululm')
xlabel('angle')
ylabel('velocity as a function of the change in angle')
legend('angle=0.5*pi, v=5, mu= 0.1', 'angle=0.33*pi, v=4.5, mu= 0.15', ...
    'location' ,'southwest')


