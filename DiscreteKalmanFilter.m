function DKF = DiscreteKalmanFilter(Ad, Bd, Ed, Cd, R, Q, P0, x0, T)
    P = P0;
    x = x0;
    for i = 1:length(T)
        x(i) = Ad*x(i-1) + Bd*
end