function [ Kstat ] = Kstatic( U)
load('../dane_poczatkowe.mat');
Kstatt = K*(4*a4*U.^3 + 3*a3*U.^2 + 2*a2*U + a1);
end

