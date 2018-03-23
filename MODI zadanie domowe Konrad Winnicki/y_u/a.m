% Rysowanie wykresu funkcji nieliniowej jednej zmiennej
step = 0.5
hold on;
u = -5:step:5;
y = cos(0.25*u).^2 - 0.01*(u.^3) - 0.02;

xlabel('u');
ylabel('y');
title('Charakterystyka funkcji nieliniowej y(u)');
grid on
box on
plot(u,y);