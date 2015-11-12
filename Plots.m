%%%%%%%%%%%%%%%%%%%% OPPGAVE 5.1 B %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% w_0 = 0.005   %%%%%%%%%%%%%%%%%%

%plot(w0_005.time, w0_005.signals.values);
%fig = gcf;
%fig.PaperPosition = [0 0 11 7];
%fig.PaperPositionMode = 'manual';
%print -depsc 5_1b_Omega_0_005;
%grid on;

%%%%%%%%%%%%%%%%%%%% w_0 = 0.05    %%%%%%%%%%%%%%%%%%
%figure;
%plot(w0_05.time, w0_05.signals.values);
%ylim([2.8 4.55])
%figure.PaperPosition = [0 0 11 7];
%figure.PaperPositionMode = 'manual';
%print -depsc 5_1b_Omega_0_05;
%grid on;


%%%%%%%%%%%%%%%%%%%% OPPGAVE 5.1 C %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% w_0 = 0.005   %%%%%%%%%%%%%%%%%%

%figure1;
%plot(w0c_005.time, w0c_005.signals.values);
%figure1.PaperPosition = [0 0 11 7];
%figure1.PaperPositionMode = 'manual';
%print -depsc 5_1c_Omega_0_005;
%grid on;

%%%%%%%%%%%%%%%%%%%% w_0 = 0.05    %%%%%%%%%%%%%%%%%%
%figure2;
%plot(w0c_05.time, w0c_05.signals.values);
%ylim([2.8 4.55])
%figure2.PaperPosition = [0 0 11 7];
%figure2.PaperPositionMode = 'manual';
%print -depsc 5_1c_Omega_0_05;
%grid on;

%%%%%%%%%%%%%%%%%%%% OPPGAVE 5.1 D %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% 700t %%%%%%%%%%%%%%%%%%%%%%%%%%%
%figure3;
%plot(comparison700t.time, comparison700t.signals.values);
%figure3.PaperPosition = [0 0 11 7];
%figure3.PaperPositionMode = 'manual';
%print -depsc 5_1d_comparison_700t;
%grid on;


%%%%%%%%%%%%%%%%%%%% 5000t %%%%%%%%%%%%%%%%%%%%%%%%%%%
%figure4;
%plot(comparison5000t.time, comparison5000t.signals.values);
%figure4.PaperPosition = [0 0 11 7];
%figure4.PaperPositionMode = 'manual';
%print -depsc 5_1d_comparison_5000t;
%grid on;


%%%%%%%%%%%%%%%%%%%% K = 1.85 %%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
plot(comparison_K_1_85.time, comparison_K_1_85.signals.values);
fig = gcf;
fig.PaperPosition = [0 0 11 7];
fig.PaperPositionMode = 'manual';
print -depsc 5_1d_comparison_K_1_85;
grid on;





