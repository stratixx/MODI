load('../dane_poczatkowe.mat');

tkonc = 70;
x0 = [ 0 0 ];
Tp_vector = [ 0.1 0.2 0.5 1.0 2.0 5.0 ];


%zaladowanie dynamicznego modelu dyskretnego
model_dnd_name = 'dyn_nielin_mod_dyskretny';
load_system(strcat('../zad_2/', model_dnd_name));
config_dnd = getActiveConfigSet(model_dnd_name);
model_dnd = config_dnd.copy;
set_param(model_dnd,'Solver','ode45',...
                'StartTime','0', 'StopTime', num2str(tkonc), ...
                'SaveState','on', 'SaveOutput','off');
            
%zaladowanie dyanmicznego modelu ciaglego
model_dnc_name = 'dyn_nielin_mod_ciagly';
load_system(strcat('../zad_1/', model_dnc_name));
config_dnc = getActiveConfigSet(model_dnc_name);
model_dnc = config_dnc.copy;
set_param(model_dnc,'Solver','ode45',...
                'StartTime','0', 'StopTime', num2str(tkonc), ...
                'SaveState','on', 'SaveOutput','on');

for k=1:1:length(Tp_vector)
   Tp = Tp_vector(k+2);
   dnc_data = sim(model_dnc_name, config_dnc);
   dnd_data = sim(model_dnd_name, config_dnd);
   
   dnc_t = dnc_data.get('tout');
   dnc_u = dnc_data.get('yout')*[0;1];
   dnc_y = dnc_data.get('yout')*[1;0];
   
   dnd_t = dnd_data.get('tout');
   dnd_u = dnd_data.get('yout')*[0;1];
   dnd_y = dnd_data.get('yout')*[1;0];
   
   figure(k);
   xlabel('Czas');
   ylabel('Wartoœæ');
   hold on; box on; grid on;
   title('OdpowiedŸ skokowa modeli');
   plot(dnc_t, dnc_y);
   stairs(dnd_t, dnd_y);
   legend('Model ci¹g³y', 'Model dyskretny');
   
   
   
   break;
end