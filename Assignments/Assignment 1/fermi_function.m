k = 8.617332478 * 10^(-5);

E = 0:0.001:1.6;
E_F = 1;

T = 300;

f = 1./(1 + exp((E - E_F)/(k * T)));

fig = figure;
hold on;
plot(E,f);

ax = gca;
ax.TickLabelInterpreter = 'latex';
ax.XTick = [0,E_F,1.6];
ax.YTick = [0,1/2,1];
ax.XTickLabel = {'$0$','$E_F = 1$','$1.6$'};
ax.YTickLabel = {'$0$','$\frac{1}{2}$','$1$'};

xlabel('$E (\mathrm{eV})$','Interpreter','latex','FontSize',14);
ylabel('$f(E)$','Interpreter','latex','FontSize',14);

set(fig,'Units','Inches');
pos = get(fig,'Position');
set(fig,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);

%matlab2tikz('graphical_solution_for_allowed_energy_levels_for_even_wave_functions_in_finite_potential_well.tikz')

print(fig,'fermi_function','-dpdf','-r0')

E = 0:0.2:1.6;
f = 1./(1 + exp((E - E_F)/(k * T)));
T = table(transpose(E),transpose(f))
writetable(T);

close all; clear; clc;
