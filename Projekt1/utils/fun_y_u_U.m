function [ y ] = fun_y_u_U( u, U )
% wartoœæ charakterystyki statyczna zlin w punkcie U
load('../dane_poczatkowe.mat');
y = fun_y_u(U) + K*(a1+2*a2*U+3*a3*U.^2+4*a4*U.^3).*(u-U);
end

