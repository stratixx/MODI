run('../utils/init.m');
load('../dane_poczatkowe.mat');
hold off;
start = -1;
stop = 1;
step = 0.05;

u = start:step:stop;

y_u = fun_y_u( u );
figure(1);
xlabel('Zmienna u');
ylabel('Wartoœæ');
hold on; box on; grid on;
title('Charakterystyka statyczna');
plot(u, y_u);
print(strcat('img/char_stat'),'-dpng');
hold off;
close all;