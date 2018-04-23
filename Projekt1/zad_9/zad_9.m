run('../utils/init.m');
load('../dane_poczatkowe.mat');

tkonc = 99;
Tp=1;
U_vector = [ -0.9 -0.5 -0.2 0.6 ];

shift = 100;
tkonc = tkonc+shift;
stepTime = 10+shift;

step_matrix = [ stepTime -1 -0.9;...
                stepTime -1 -0.5; ...
                stepTime -1 -0.2; ...
                stepTime -1 0.6; ...
                stepTime U_vector(1)-0.1 U_vector(1)+0.1;...
                stepTime U_vector(2)-0.1 U_vector(2)+0.1;...
                stepTime U_vector(3)-0.1 U_vector(3)+0.1;...
                stepTime U_vector(4)-0.1 U_vector(4)+0.1;
                ];
                

%zaladowanie dynamicznego modelu dyskretnego
model_dnd_name = 'dyn_nielin_mod_dyskretny';
load_system(strcat('../zad_2/', model_dnd_name));
config_dnd = getActiveConfigSet(model_dnd_name);
model_dnd = config_dnd.copy;
set_param(model_dnd,'Solver','ode45',...
                'StartTime','0', 'StopTime', num2str(tkonc), ...
                'SaveState','on', 'SaveOutput','off');
            
%zaladowanie dynamicznego modelu ciaglego
model_dzd_name = 'dyn_zlin_mod_dyskretny';
load_system(strcat('../zad_8/', model_dzd_name));
config_dzd = getActiveConfigSet(model_dzd_name);
model_dzd = config_dzd.copy;
set_param(model_dzd,'Solver','ode45',...
                'StartTime','0', 'StopTime', num2str(tkonc), ...
                'SaveState','on', 'SaveOutput','on');
for k=1:1:length(U_vector)
    U = U_vector(k);
    for kStep=1:1:(size(step_matrix)*[1;0])
    step = step_matrix(kStep,:);
    x0 = [ fun_y_u(step(2)) (T1+T2)/(T1*T2)*fun_y_u(step(2)) ];
       dzd_data = sim(model_dzd_name, config_dzd);
       dnd_data = sim(model_dnd_name, config_dnd);

       dzd_t = dzd_data.get('tout');
       dzd_u = dzd_data.get('yout')*[0;1];
       dzd_y = dzd_data.get('yout')*[1;0];

       dnd_t = dnd_data.get('tout');
       dnd_u = dnd_data.get('yout')*[0;1];
       dnd_y = dnd_data.get('yout')*[1;0];
              
       dzd_t = dzd_t(shift:end,:) - dzd_t(shift,1);
       dzd_u = dzd_u(shift:end,:);
       dzd_y = dzd_y(shift:end,:);
       dnd_t = dnd_t(shift:end,:) - dnd_t(shift,1);
       dnd_u = dnd_u(shift:end,:);
       dnd_y = dnd_y(shift:end,:);

       figure(k);
       xlabel('Czas');
       ylabel('Wartoœæ');
       hold on; box on; grid on;
       title(strcat('OdpowiedŸ na skok od ', num2str(step(2)), ' do ', num2str(step(3)), ', U = ', num2str(U)));
       stairs(dzd_t, dzd_y);
       stairs(dnd_t, dnd_y);
       stairs(dnd_t, dnd_u);
       legend('Model zlinearyzowany', 'Model nieliniowy', 'Sygna³ steruj¹cy');
       num = num2str((k-1)*((size(step_matrix)*[1;0]))+(kStep));
       print(strcat('img/', num, 'step_', num2str(kStep), '_U_',strrep(num2str(U),'.','_') ),'-dpng');
       hold off;
       close all
       %break;
    end
    %break;
end