name = strcat('Charakterystyka statyczna zlinearyzowana w punkcie U=',num2str(U)   );
hold off;
start = -5;
stop = 12.5;
step = 0.5;

u = start:step:stop;

y_u = a1 * u + a2 * u.^2 + a3 * u.^3 + a4 * u.^4;
y_u = K * y_u;
plot(u,y_u);

xlabel('u');
ylabel('y(u)');
title( name );


grid on;
box on;
hold on;

y_U = a1*U + a2*U.^2 + a3*U.^3 + a4*U.^4;

y_u_U = K*y_U + K*(a1+2*a2*U+3*a3*U^2+4*a4*U^3)*(u-U);

plot(u,y_u_U);
