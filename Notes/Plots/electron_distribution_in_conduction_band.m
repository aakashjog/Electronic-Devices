k = 1.38064852 * 10^(-1.8);

E = 0:0.0001:1000;
E_C = 200;
E_F = 100;

T = 9000;

N = sqrt(E - E_C);
f = 1./(1 + exp((E - E_F)/(k * T)));

fig = figure;
hold on;
plot(E,f .* N);

ax = gca;
ax.TickLabelInterpreter = 'latex';
ax.XTick = [E_C];
ax.YTick = [];
ax.XTickLabel = {'$E_C$'};

xlabel('$E$','Interpreter','latex','FontSize',14);

set(fig,'Units','Inches');
pos = get(fig,'Position');
set(fig,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);

%matlab2tikz('graphical_solution_for_allowed_energy_levels_for_even_wave_functions_in_finite_potential_well.tikz')

print(fig,'electron_distribution_in_conduction_band','-dpdf','-r0')

close all; clear; clc;
