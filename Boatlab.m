
%%%%%%%%%%%%%%%%%%%%%%%%% Constants K and T %%%%%%%%%%%%%%%%%%%%%%%%% 
K = 0.174;
T = 86.5;
K_x = 0.185;
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

%%%%%%%%%%%%%%%%%%%%%%%%% PD controller %%%%%%%%%%%%%%%%%%%%%%%%%
Kpd = 0.7502;
Td = T;
Tf = 8.391;
phi_reference = 30;

%%%%%%%%%%%%%%%%%%%%%%%%% Discretization %%%%%%%%%%%%%%%%%%%%%%%%%

A = [0 1 0 0 0; -w0^2 -2*lambda*w0 0 0 0; 0 0 0 1 0; 0 0 0 -1/T -K/T; 0 0 0 0 0];
B = [0; 0; 0; K/T; 0];
E = [0 0; Kw 0; 0 0; 0 0; 0 1];
C = [0 1 1 0 0];

Fs= 10;
Ts = 1/Fs;

[Ad,Bd] = c2d(A,B,Ts);
[Ad,Ed] = c2d(A,E,Ts);

%%%%%%%%%%%%%%%%%%%%%% Variance of noise measurment %%%%%%%%%%%%%%%%

R = var(compass.data*pi/180);

%%%%%%%%%%%%%%%%%%%%%% Q - Covariance %%%%%%%%%%%%%%%%%%%%%%%%

Q = [30 0; 0 10^(-6)];

%%%%%%%%%%%%%%%%%%%%%% Initializing data %%%%%%%%%%%%%%%%%%%%%%%%
x0 = [0 0 0 0 0];
P0 = [1 0 0 0 0; 0 0.013 0 0 0; 0 0 pi^2 0 0; 0 0 0 1 0; 0 0 0 0 2.5*10e-6];

data = struct('A',Ad,'B',Bd,'E',Ed,'C',C,'R',R,'Q',Q,'x0',x0,'P0',P0);