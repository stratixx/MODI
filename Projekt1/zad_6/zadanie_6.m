name = strcat('Charakterystyka statyczna zlinearyzowana w punkcie U=',num2str(U)   );
hold off;
start = -1;
stop = 1;
step = 0.1;

u = start:step:stop;

y_u = fun_y_u( u );
plot(u,y_u);

xlabel('u');
ylabel('y(u)');
title( name );

grid on;
box on;
hold on;

y_u_U = fun_y_u_U( u, U );
plot(u,y_u_U);
