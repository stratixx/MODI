clear
daneDynUcz = dlmread('../danedynucz43.txt');
daneDynWer = dlmread('../danedynwer43.txt');
daneDynUczU = daneDynUcz(:,1);
daneDynUczY = daneDynUcz(:,2);
daneDynWerU = daneDynWer(:,1);
daneDynWerY = daneDynWer(:,2);
clear daneDynUcz daneDynWer

figure(1)
name = 'Dane dynamiczne ucz�ce - sygna� wej�ciowy';
hold on; box on; grid on;
title(name);
xlabel('Pr�bki'); ylabel('Warto��'); 
stairs(daneDynUczU);
legend('u_u_c_z', 'location', 'southeast');
print(strcat('img/',strrep(name,' ','_')), '-dpng');
%close 1;

figure(2)
name = 'Dane dynamiczne ucz�ce - sygna� wyj�ciowy';
hold on; box on; grid on;
title(name);
xlabel('Pr�bki'); ylabel('Warto��'); 
stairs(daneDynUczY);
legend('y_u_c_z', 'location', 'southeast');
print(strcat('img/',strrep(name,' ','_')), '-dpng');
%close 2;

figure(3)
name = 'Dane dynamiczne weryfikuj�ce - sygna� wej�ciowy';
hold on; box on; grid on;
title(name);
xlabel('Pr�bki'); ylabel('Warto��'); 
stairs(daneDynWerU);
legend('u_w_e_r', 'location', 'southeast');
print(strcat('img/',strrep(name,' ','_')), '-dpng');
%close 3;

figure(4)
name = 'Dane dynamiczne weryfikuj�ce - sygna� wyj�ciowy';
hold on; box on; grid on;
title(name);
xlabel('Pr�bki'); ylabel('Warto��'); 
stairs(daneDynWerY);
legend('y_w_e_r', 'location', 'southeast');
print(strcat('img/',strrep(name,' ','_')), '-dpng');
%close 4;
