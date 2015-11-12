load wave;

figure;
fs = 10;
window = 4096;
psi = psi_w(2,:)*pi/180;
[pxx,f] = pwelch(psi,window, [],[], 10);
plot(f*(2*pi),pxx/(2*pi));
xlim([0 1.8])
fig = gcf;
fig.PaperPosition = [0 0 11 7];
fig.PaperPositionMode = 'manual';
print -depsc 5_2a_psd_estimate;
grid on;
