name = 'Wzmocnienie statyczne modelu dynamicznego dyskretnego zlinearyzowanego'
load('../dane_poczatkowe.mat');

% wyznaczenie transmitancji G(z) w zale¿noœci od punktu U
z=1;
U=-1:0.1:1;

Kstat = (K*Tp^2*(4*a4*U.^3 + 3*a3*U.^2 + 2*a2.*U + a1))/(T1*T2 - T1*Tp - T2*Tp + Tp^2 - 2*T1*T2*z + T1*Tp*z + T2*Tp*z + T1*T2*z^2)

figure(1);
grid on; box on; hold on;
plot(U,Kstat);
xlabel('U');
ylabel('Kstat(U)');
title(name);
print('charakterystykaStatyczna','-dpng');
hold off;
close all;