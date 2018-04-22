% wyznaczanie transmitancji zlinearyzowanego dynamicznego modelu
% dyskretnego w punkcie pracy U

clear;
syms K T1 T2 a1 a2 a3 a4 Tp U z

A = [ 1-(T1+T2)*Tp/(T1*T2) Tp ; -Tp/(T1*T2) 1 ];
B = [ 0 ; K*Tp/(T1*T2)*(a1+2*a2*U+3*a3*U^2+4*a4*U^3) ];
C = [ 1 0 ];
D = [ 0 ];

% Wyznaczenie transmitancji w zale¿noœci od wszystkich parametrów
I = [ 1 0 ; 0 1 ];
G_z = C*inv(z*I - A)*B + D;
% wynik kopiujê do kolejnej czêœci

% wyznaczenie transmitancji G(z) w zale¿noœci od punktu U
clear
load('dane_poczatkowe.mat');
%z=1;
%U=2;
syms z U

G_z = (K*Tp^2*(4*a4*U^3 + 3*a3*U^2 + 2*a2*U + a1))/(T1*T2 - T1*Tp - T2*Tp + Tp^2 - 2*T1*T2*z + T1*Tp*z + T2*Tp*z + T1*T2*z^2)
