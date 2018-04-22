load('../dane_poczatkowe.mat');

tkonc = 250;
Tp=1;
U_vector = [ -0.9 -0.5 -0.2 0.6 ];

step_matrix = [ 70 -1 -0.9; 70 -1 -0.5; 70 -1 -0.2; 70 -1 0.6 ]; %[stepTime stepInitial stepFinal; ...]


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
       
       cut = 52;
       
       dzd_t = dzd_t(cut:end,:) - dzd_t(cut,:);
       dzd_u = dzd_u(cut:end,:);
       dzd_y = dzd_y(cut:end,:);
       dnd_t = dnd_t(cut:end,:) - dnd_t(cut,:);
       dnd_u = dnd_u(cut:end,:);
       dnd_y = dnd_y(cut:end,:);

       figure(k);
       xlabel('Czas');
       ylabel('Wartoœæ');
       hold on; box on; grid on;
       title(strcat('OdpowiedŸ na skok od -1 do ', num2str(step(3)), ', U = ', num2str(U)));
       stairs(dzd_t, dzd_y);
       stairs(dnd_t, dnd_y);
       stairs(dnd_t, dnd_u);
       legend('Model zlinearyzowany', 'Model nieliniowy', 'Sygna³ steruj¹cy');
       print(strcat('img/', num2str((k-1)*(1+length(U_vector))+(kStep)), 'step_', num2str(kStep), '_U_',strrep(num2str(U),'.','_') ),'-dpng');
       hold off;
       close all
       %break;
    end
    %break;
end