k = 1.38064852 * 10^(-2);

E = 0:0.001:200;
E_C = 150;
E_F = 125;
E_i = 100;
E_V = 50;

T = 1000;

f = 1./(1 + exp((E - E_F)/(k * T)));

fig = figure;
hold on;
plot(f,E);
plot(1 - f,E);

ax = gca;
ax.TickLabelInterpreter = 'latex';
ax.XTick = [0,1/2,1];
ax.YTick = [0,E_V,E_i,E_F,E_C];
ax.XTickLabel = {'$0$','$\frac{1}{2}$','$1$'};
ax.YTickLabel = {'$0$','$E_V$','$E_i$','$E_F$','$E_C$'};
grid on;

xlabel('$E$','Interpreter','latex','FontSize',14);

leg = legend('$f(E)$','$1 - f(E)$');
leg.Interpreter = 'latex';

set(fig,'Units','Inches');
pos = get(fig,'Position');
set(fig,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);

%matlab2tikz('graphical_solution_for_allowed_energy_levels_for_even_wave_functions_in_finite_potential_well.tikz')

print(fig,'fermi_function_for_N_type','-dpdf','-r0')

close all; clear; clc;
