name = 'Charakterystyka statyczna modelu ci¹g³ego nieliniowego'
load('dane_poczatkowe.mat');
hold off;
start = -1;
stop = 1;
step = 0.05;

u = start:step:stop;

y_u = fun_y_u( u );
plot(u,y_u);
xlabel('u');
ylabel('y(u)');
title(name);

grid on;
box on;
hold on;