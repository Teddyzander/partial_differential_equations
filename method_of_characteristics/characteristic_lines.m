%{
5 phi_x + 2 phi_y = 0
conditions: phi(0, y) = sin(y)
phi should be constant along lines of dy/dx = 2/5
%}



x = [-10:0.25:10];
y = [-12:0.25:12];

phi = @(x, y) sin(y - 2/5 * x);
phi_x = @(x, y) (-2*cos(2*x/5 - y))/5;
phi_y = @(x, y) cos(y - 2*x/5);

u = zeros(length(x), length(y));
u_x = zeros(length(x), length(y));
u_y = zeros(length(x), length(y));

for i=1:length(x)
    for j=1:length(y)
        u(i, j) = phi(x(i), y(j));
        u_x(i, j) = phi_x(x(i), y(j));
        u_y(i, j) = phi_y(x(i), y(j));
    end
end

surf(x, y, u')
shading interp
colormap(spring);
hold on

% plot const lines
const = @(x, c) 2/5 * x + c;

c = [-20:0.2:20];
lines = zeros(length(x), length(c));
height = zeros(length(x) ,length(x));

for i=1:length(x)
    for j=1:length(c)
        lines(i, j) = const(x(i), c(j));
        height(i, j) = phi(x(i), lines(i, j));
    end
end

xlabel('x')
ylabel('y')
zlabel('phi')

for i=1:length(c)
    plot3(x, lines(:,i), height(:,i), '-k')
end

legend('surface of ph(x, y)', 'lines of constant phi (characteristic)');
c = colorbar;
c.Label.String = 'value of phi';
xlim([-10,10])
ylim([-12, 12])





