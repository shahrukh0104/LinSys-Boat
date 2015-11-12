figure;
plot(compass5_3b.time, compass5_3b.signals.values);
fig = gcf;
fig.PaperPosition = [0 0 11 7];
fig.PaperPositionMode = 'manual';
print -depsc 5_3b_PD_Simulation_comapass;
grid on;


figure;
plot(rudder5_3b.time, rudder5_3b.signals.values);
fig = gcf;
fig.PaperPosition = [0 0 11 7];
fig.PaperPositionMode = 'manual';
print -depsc 5_3b_PD_Simulation_rudder;
grid on;


