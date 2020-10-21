function y = gamma_norm(x,gamma)
% Gamma norm

x = abs(x) ;
y = gamma./(x+gamma).^2 ;

