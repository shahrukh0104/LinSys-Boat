figure;
plot(compass5_3d.time, compass5_3d.signals.values);
fig = gcf;
fig.PaperPosition = [0 0 11 7];
fig.PaperPositionMode = 'manual';
print -depsc 5_3d_PD_Simulation_comapass_wave;
grid on;


figure;
plot(rudder5_3d.time, rudder5_3d.signals.values);
fig = gcf;
fig.PaperPosition = [0 0 11 7];
fig.PaperPositionMode = 'manual';
print -depsc 5_3d_PD_Simulation_rudder_wave;
grid on;


