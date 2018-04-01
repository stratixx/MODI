name = 'Charakterystyka statyczna modelu ci¹g³ego nieliniowego'
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
title(name);

grid on;
box on;
hold on;