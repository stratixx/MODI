function [ Kstat ] = Kstatic( U)
load('../dane_poczatkowe.mat');
z=1;
Tp = 1; % Tp nie ma znaczenia
Kstat = (K*Tp^2*(4*a4*U.^3 + 3*a3*U.^2 + 2*a2.*U + a1))/(T1*T2 - T1*Tp - T2*Tp + Tp^2 - 2*T1*T2*z + T1*Tp*z + T2*Tp*z + T1*T2*z^2);


end

