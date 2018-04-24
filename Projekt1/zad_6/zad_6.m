name = strcat('Charakterystyka statyczna zlinearyzowana w punkcie U='  );

start = -1;
stop = 1;
step = 0.1;

Uvector = -1:0.1:1;
u = start:step:stop;

for k=1:1:length(Uvector)
    U = Uvector(k);

    y_u = fun_y_u( u );
    y_u_U = fun_y_u_U( u, U );    
    wsp = mean(100*abs((y_u-y_u_U)/y_u)); % wspó³czynnik b³êdu linearyzacji

    figure(1);
    grid on; box on; hold on;
    plot(u,y_u);
    plot(u,y_u_U);
    xlabel('u');
    ylabel('Wartoœæ');
    title( strcat(name, num2str(U)) );
    print(strcat('img/U_',strrep(num2str(U),'.','_'), '_wsp_',strrep(num2str(wsp),'.','_') ),'-dpng');
    hold off;
    close all;
end


