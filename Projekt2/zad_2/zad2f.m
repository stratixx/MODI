
%wybrany rzad 1,  stopien 3 nieliniowego

% %model dynamiczny nieliniowy
% y(k) = 0.0420*u(k-1) + 0.1324*u(k-1)^2 - 0.5510*u(k-1)^3 ...
%       +0.9414*y(k-1) - 0.0004*y(k-1)^2 + 0.0001*y(k-1)^3; 
%   
% % wstepne rownanie modelu statycznego nieliniowego
% y = 0.0420*u + 0.1324*u^2 - 0.5510*u^3 ...
%       +0.9414*y - 0.0004*y^2 + 0.0001*y^3; 
  
% próba rozwiazania równania nieliniowego
clear
syms y
eq = ['y = 0.0420*u + 0.1324*u^2 - 0.5510*u^3 + 0.9414*y - 0.0004*y^2 + 0.0001*y^3'];

sol = solve(eq,y);
y_u = matlabFunction(sol(1))

dataReaded = sortrows(dlmread('../danestat43.txt'));
y_mod = real(y_u(dataReaded(:,1)));
err = sum(power(dataReaded(:,2)-y_mod,2));
figure(1)
hold on; box on; grid on;
plot( dataReaded(:,1), dataReaded(:,2), '--');
plot( dataReaded(:,1), y_mod);
xlabel('Sygna³ steruj¹cy u');
ylabel('Sygna³ wyjœciowy y');
title(strcat('Nieliniowy model statyczny na tle danych statycznych, err=',num2str(err)));
legend('y(u)','y_m_o_d(u)');