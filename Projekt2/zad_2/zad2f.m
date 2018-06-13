%wybrany rzad 2,  stopien 4 nieliniowego
%wspó³czynniki dostêpne w zad_2f_wsp_r_rozn.m
run('zad_2f_wsp_r_rozn.m');
wsp_u = Wlearn(1:length(Wlearn)/2);
wsp_y = Wlearn(length(Wlearn)/2+1:end);

% %model dynamiczny nieliniowy
% y(k) = wsp_u(1) *u(k-1) + wsp_u(2)*u(k-1)^2 + wsp_u(3)*u(k-1)^3 + wsp_u(4)*u(k-1)^4 ...
%       + wsp_u(5)*u(k-2) + wsp_u(6)*u(k-2)^2 + wsp_u(7)*u(k-2)^3 + wsp_u(8)*u(k-2)^4 ...
%       + wsp_y(1)*y(k-1) + wsp_y(2)*y(k-1)^2 + wsp_y(3)*y(k-1)^3 + wsp_y(4)*y(k-1)^4 ...
%       + wsp_y(5)*y(k-2) + wsp_y(6)*y(k-2)^2 + wsp_y(7)*y(k-2)^3 + wsp_y(8)*y(k-2)^4 ; 
%   
% % ogólne wstêpne rownanie modelu statycznego nieliniowego
% y = wsp_u(1)*u + wsp_u(2)*u^2 + wsp_u(3)*u^3 + wsp_u(4)*u^4 ...
%   + wsp_u(5)*u + wsp_u(6)*u^2 + wsp_u(7)*u^3 + wsp_u(8)*u^4 ...
%   + wsp_y(1)*y + wsp_y(2)*y^2 + wsp_y(3)*y^3 + wsp_y(4)*y^4 ...
%   + wsp_y(5)*y + wsp_y(6)*y^2 + wsp_y(7)*y^3 + wsp_y(8)*y^4 ; 

% wstêpne równanie modelu statycznego nieliniowego na wartoœciach
% wspó³czynników
dataReaded = sortrows(dlmread('../danestat43.txt'));
uVect=dataReaded(:,1);
y_mod = zeros(size(uVect));

for ku=1:1:length(uVect)
    u=uVect(ku);
    y_fun = @(y) -y...
      + wsp_u(1)*u + wsp_u(2)*u^2 + wsp_u(3)*u^3 + wsp_u(4)*u^4 ...
      + wsp_u(5)*u + wsp_u(6)*u^2 + wsp_u(7)*u^3 + wsp_u(8)*u^4 ...
      + wsp_y(1)*y + wsp_y(2)*y^2 + wsp_y(3)*y^3 + wsp_y(4)*y^4 ...
      + wsp_y(5)*y + wsp_y(6)*y^2 + wsp_y(7)*y^3 + wsp_y(8)*y^4 ; 

    y_mod(ku) = fsolve(y_fun,0);
end

err = sum(power(dataReaded(:,2)-y_mod,2));
figure(1)
hold on; box on; grid on;
plot( dataReaded(:,1), dataReaded(:,2), '.');
plot( dataReaded(:,1), y_mod);
xlabel('Sygna³ steruj¹cy u');
ylabel('Sygna³ wyjœciowy y');
title(strcat('Nieliniowy model statyczny na tle danych statycznych, err=',num2str(err)));
legend('y(u)','y_m_o_d(u)');