% Dynamiczny dyskretny model zlinearyzowany w punkcie U
% nieliniowoœæ wprowadza³a funkcja wielomianowa y_u
% zosta³a zamiemiona na postaæ zlinearyzowan¹ z pominiêciem sk³adowej
% sta³ej

A = [ 1-(T1+T2)*Tp/(T1*T2) Tp ; -Tp/(T1*T2) 1 ];
B = [ 0 ; K*Tp/(T1*T2)*(a1+2*a2*U.^1+3*a3*U.^2+4*a4*U.^3) ];
C = [ 1 0 ];
D = [ 0 ];