% Skrypt s³u¿¹cy do analizy b³êdów linearyzacji modelu w danych punktach
% pracy
clear
load('dane_poczatkowe.mat');
U = (-6:1:14)';
amplitude = 1.5; 
% zakres zmian u wzgledem U
u=[U-amplitude U U+amplitude];
y_u = a1 * u + a2 * u.^2 + a3 * u.^3 + a4 * u.^4;
y_u = K * y_u; 
% wartoœæ funkcji nieliniowej
y_U = a1*(U*[1 1 1]) + a2*(U*[1 1 1]).^2 + a3*(U*[1 1 1]).^3 + a4*(U*[1 1 1]).^4;
y_u_U = K*y_U + K*(a1+2*a2*(U*[1 1 1])+3*a3*(U*[1 1 1]).^2+4*a4*(U*[1 1 1]).^3).*(u-U*[1 1 1]);
% wartoœæ funkcji zlinearyzowanej w punkcie
err = y_u-y_u_U; 
% bezwzglêdny b³¹d linearyzacji
errabs = sum( abs(err)' )'; 
% suma b³êdów
mean = meanabs(err); 
% srednia b³êdów
znak_wyniku = (y_u .* y_u_U) ./ abs(y_u .* y_u_U) 
% sprawdzenie czy wyniki maj¹ ten sam znak