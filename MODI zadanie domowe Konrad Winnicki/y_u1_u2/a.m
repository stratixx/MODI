% Rysowanie wykresu funkcji nieliniowej dwóch zmiennych
step = 0.1
[u1,u2] = meshgrid(-1:step:1, -1:step:1);
y = -10*u1 + 5*(u2.^3);

surf(u1,u2,y);
grid on
box on
xlabel('u1');
ylabel('u2');
zlabel('y');
title('Charakterystyka nieliniowa y(u1,u2)');