name = 'Wzmocnienie statyczne modelu dynamicznego dyskretnego zlinearyzowanego'
load('../dane_poczatkowe.mat');

% wyznaczenie transmitancji G(z) w zale¿noœci od punktu U
U=-1:0.1:1;

Kstat = Kstatic(U);
figure(1);
grid on; box on; hold on;
plot(U,Kstat);
xlabel('U');
ylabel('Kstat(U)');
title(name);
print('charakterystykaStatyczna','-dpng');
hold off;
close all;