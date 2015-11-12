figure;
plot(compass5_3c.time, compass5_3c.signals.values);
fig = gcf;
fig.PaperPosition = [0 0 11 7];
fig.PaperPositionMode = 'manual';
print -depsc 5_3c_PD_Simulation_comapass_current;
grid on;


figure;
plot(rudder5_3c.time, rudder5_3c.signals.values);
fig = gcf;
fig.PaperPosition = [0 0 11 7];
fig.PaperPositionMode = 'manual';
print -depsc 5_3c_PD_Simulation_rudder_current;
grid on;


