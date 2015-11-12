load wave;

fs = 10;
window = 4096;
psi = psi_w(2,:)*pi/180;

[pxx,f] = pwelch(psi,window, [],[], 10);

p1 = plot(f*(2*pi),pxx/(2*pi));
xlim([0 1.8])