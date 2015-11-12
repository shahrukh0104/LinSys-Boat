
%%%%%%%%%%%%%%%%%%%%%%%%% Constants K and T %%%%%%%%%%%%%%%%%%%%%%%%% 
K = 0.174;
T = 86.5;

%%%%%%%%%%%%%%%%%%%%%%%%% PSD Estimate %%%%%%%%%%%%%%%%%%%%%%%%% 
load wave;

fs = 10;
window = 4096;
psi = psi_w(2,:)*pi/180;

[pxx,f] = pwelch(psi,window, [],[], 10);

p1 = plot(f*(2*pi),pxx/(2*pi));
hold;

%%%%%%%%%%%%%%%%%%%%%%%%% Resonant frequency %%%%%%%%%%%%%%%%%%%%%%%%% 

[maxValue, i] = max(pxx);
w0 = 2 * pi * f(i); 


%%%%%%%%%%%%%%%%%%%%%%%%% Sigma %%%%%%%%%%%%%%%%%%%%%%%%%

sigma = sqrt(maxValue/(2*pi));


%%%%%%%%%%%%%%%%%%%%%%%%% PSD %%%%%%%%%%%%%%%%%%%%%%%%%

Pw = @(lambda, w) (2*lambda*w0*w*sigma).^2./(4*(lambda*w0*w).^2 + (w0^2 - w.^2).^2);
l = lsqcurvefit(Pw, .1, f*(2*pi), pxx/(2*pi));

p2 = plot(f*2*pi, Pw(l, f*2*pi));
legend('Welch', 'Analytical');
xlabel('Freq (rad/s)')
ylabel('Power (s/rad)')
xlim([0 1.8])