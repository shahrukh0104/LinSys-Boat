load wave;
figure;

fs = 10;
window = 4096;
psi = psi_w(2,:)*pi/180;

[pxx,f] = pwelch(psi,window, [],[], 10);

p1 = plot(f*(2*pi),pxx/(2*pi));
hold;

%%%%%%%%%%%%%%%%%%%%%%%%% Resonant frequency %%%%%%%%%%%%%%%%%%%%%%%%% 
[maxValue, i] = max(pxx);
w0 = 2 * pi .* f(i); 

%%%%%%%%%%%%%%%%%%%%%%%%% Sigma %%%%%%%%%%%%%%%%%%%%%%%%%
sigma = sqrt(maxValue/(2*pi));

%%%%%%%%%%%%%%%%%%%%%%%%% PSD %%%%%%%%%%%%%%%%%%%%%%%%%
Pw = @(l, w) (2*l*w0*w*sigma).^2./(4*(l*w0*w).^2 + (w0^2 - w.^2).^2);
lambda = lsqcurvefit(Pw, .1, f*(2*pi), pxx/(2*pi));
Kw = 2*lambda*w0*sigma;

p2 = plot(f*2*pi, Pw(lambda, f*2*pi));
legend('Welch', 'Analytical');
xlabel('Freq (rad/s)')
ylabel('Power (s/rad)')
xlim([0 1.8])

fig = gcf;
fig.PaperPosition = [0 0 11 7];
fig.PaperPositionMode = 'manual';
print -depsc 5_2d_psd_comparison;
grid on;
