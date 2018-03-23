% rysowanie wykresu funkcji zlinearyzowanej na tle funkcji nieliniowej

a
hold on;

U1 = -0.8;
U2 = 0.7;

[u1,u2] = meshgrid(-1:step*4:1, -1:step*4:1);
y = -10*U1 + 5*(U2^3);
y = y -10*(u1-U1) + 15*U2^2*(u2-U2);

title( strcat('Zlinearyzowana w punkcie (',num2str(U1), ', ', num2str(U2), ') charakterystyka y(u1,u2) '   ));
grid on
box on
surf(u1,u2,y);