k = 1.38064852 * 10^(-2);

E = 0:0.001:200;
E_F = 100;

T1 = 1000;
T2 = 500;
T3 = 250;

f1 = 1./(1 + exp((E - E_F)/(k * T1)));
f2 = 1./(1 + exp((E - E_F)/(k * T2)));
f3 = 1./(1 + exp((E - E_F)/(k * T3)));

fig = figure;
hold on;
plot(E,f1);
plot(E,f2);
plot(E,f3);

ax = gca;
ax.TickLabelInterpreter = 'latex';
ax.XTick = [0,E_F];
ax.YTick = [0,1/2,1];
ax.XTickLabel = {'$0$','$E_F$'};
ax.YTickLabel = {'$0$','$\frac{1}{2}$','$1$'};

xlabel('$E$','Interpreter','latex','FontSize',14);
ylabel('$f(E)$','Interpreter','latex','FontSize',14);

leg = legend('$T_1$','$T_2$','$T_3$');
leg.Interpreter = 'latex';

set(fig,'Units','Inches');
pos = get(fig,'Position');
set(fig,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);

%matlab2tikz('graphical_solution_for_allowed_energy_levels_for_even_wave_functions_in_finite_potential_well.tikz')

print(fig,'fermi_function','-dpdf','-r0')

close all; clear; clc;
