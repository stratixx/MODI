function [ y ] = fun_y_u( u )
% wartoœæ wielomianu od u
load('../dane_poczatkowe.mat');
y = a1 * u + a2 * u.^2 + a3 * u.^3 + a4 * u.^4;
y = K * y;
end

