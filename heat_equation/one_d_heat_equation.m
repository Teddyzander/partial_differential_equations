%define our heat equation

alpha = 10;
heat_equation = @(T_1, T_2, T_3) (alpha/2) * ((T_3 - T_2) - (T_2 - T_1));

%temp of rod with ambient temp at each end
hot_rod(1:250) = 30 + sin([1:250]*0.1);
cold_rod(1:250) = -10 - cos([1:250]*0.1);
cold_rod(length(cold_rod)) = 20;
hot_rod(1) = 20;
rod = [hot_rod, cold_rod];

%spatial parts and time parts
x = [1:length(rod)];
steps = [1:10000];
factor = 1/10;
mesh_temp_time = zeros(length(steps), length(x));
mesh_temp_time(1,:) = rod;
mesh_temp_time(:,1) = 20;
mesh_temp_time(:,length(rod)) = 20;

for i=2:length(steps)
    for j=2:length(x)-1
        mesh_temp_time(i, j) = mesh_temp_time(i-1, j) + ...
            heat_equation(mesh_temp_time(i-1, j-1), ...
            mesh_temp_time(i-1, j), ...
            mesh_temp_time(i-1, j+1)) * factor;
    end
end

figure(1)
[X, Y] = meshgrid(x, steps);
h = surf(X, Y, mesh_temp_time);
set(h,'LineStyle','none')
c = colorbar
c.Label.String = "Temperature"
xlabel('spatial x')
ylabel('time (steps)')
zlabel('temperature')
title('evolution of heat change in 1D rod over time')

figure(2)
title('temperature at specific steps')
steps_section = length(steps)/3
subplot(2,2,1)
plot(x, mesh_temp_time(1,:));
title('time step ' + string(1));
ylim([0, 40]);
xlabel('spatial x');
ylabel('temperature');

subplot(2,2,2)
plot(x, mesh_temp_time(round(steps_section),:));
title('time step ' + string(round(steps_section)));
ylim([0, 40]);
xlabel('spatial x');
ylabel('temperature');

subplot(2,2,3)
plot(x, mesh_temp_time(round(steps_section*2),:));
title('time step ' + string(round(steps_section*2)));
ylim([0, 40]);
xlabel('spatial x');
ylabel('temperature');


subplot(2,2,4)
plot(x, mesh_temp_time(round(steps_section*3),:));
title('time step ' + string(round(steps_section*3)));
ylim([0, 40]);
xlabel('spatial x');
ylabel('temperature');




