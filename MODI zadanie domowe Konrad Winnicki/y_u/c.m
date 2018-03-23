% rysowanie wykresu funkcji zlinearyzowanej na tle funkcji nieliniowej

hold on
a % rysowanie wykresu funkcji nieliniowej

U = 2;

u = -5:0.01:5;
y = cos(0.25*U)^2 - 0.01*U^3 - 0.02;
y = y - (0.25*sin(0.5*U)+0.03*U^2)*(u-U);

title( strcat('Charakterystyka funkcji y(u) zlinearyzowanej w punkcie U = ',num2str(U)));
grid on
box on
plot(u,y);