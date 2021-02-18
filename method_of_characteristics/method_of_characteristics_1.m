%testing solutions to method of characteristics
%{
    phi_x + 3 phi_y - 5 phi = 2x^2
    with boundary conditions that phi(x, 0) = 25x^2 + 10x + 2
%}

phi = @(x, y) (-2/125) * (2+5*x*(2+5*x)) + ...
    (127/125)*(25*(x - y/3)^2 + 10*(x - y/3) + 2) * exp(5*y/3);

x = [-4:0.2:4];
y = [0:0.2:4];

u = zeros(length(x), length(y));

for i=1:length(x)
    for j=1:length(y)
        u(i ,j) = phi(x(i), y(j));
    end
end

surf(x, y, u');
zlim([0,60000])
caxis([0, 60000]);
colormap(spring);
xlabel('x');
ylabel('y');
zlabel('phi');