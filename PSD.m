function P = PSD(lambda, w)
global w0 sigma
Kw = 2*lambda*w0*w*sigma;
P = Kw.^2/(4*(lambda*w0*w).^2 + (w0^2 - w^2).^2);
end

