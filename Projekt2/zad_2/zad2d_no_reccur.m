clear
daneDynUcz = dlmread('../danedynucz43.txt');
daneDynWer = dlmread('../danedynwer43.txt');
daneDynUczU = daneDynUcz(:,1);
daneDynUczY = daneDynUcz(:,2);
daneDynWerU = daneDynWer(:,1);
daneDynWerY = daneDynWer(:,2);
dataLength = length(daneDynUczU);
clear daneDynUcz daneDynWer

maxRzad=4;
maxStopien=4;

minErrVerify = 100000.0;
minErrVerifyN = 1000;
minErrDelta = 0.2;
errArray = zeros(maxRzad*maxStopien,4);

for stopien=1:1:maxStopien
    for rzad=1:1:maxRzad
        
    errArray((rzad-1)*maxStopien+stopien, 1) = stopien;
    errArray((rzad-1)*maxStopien+stopien, 2) = rzad;
    
    Mlearn = ones(dataLength-rzad, 2*(rzad*stopien));
    for nr=1:1:rzad
        for ns=1:1:stopien
            Mlearn(:,(nr-1)*stopien+ns) = power(daneDynUczU( (rzad-nr+1):(end-nr) ),ns);            
        end
    end
    
    for nr=1:1:rzad
        for ns=1:1:stopien
            Mlearn(:,stopien*rzad+(nr-1)*stopien+ns) = power(daneDynUczY( (rzad-nr+1):(end-nr) ),ns);      
        end
    end    
    
    Wlearn = Mlearn\daneDynUczY(rzad+1:end);
    YlearnCalc = Mlearn*Wlearn;
    errLearn = (sum(power( daneDynUczY(rzad+1:end)-YlearnCalc, 2 )));
    errArray((rzad-1)*maxStopien+stopien, 3) = errLearn;    
    
    Mverif = ones(dataLength-rzad, 2*(rzad*stopien));
    for nr=1:1:rzad
        for ns=1:1:stopien
            Mverif(:,(nr-1)*stopien+ns) = power(daneDynWerU( (rzad-nr+1):(end-nr) ),ns);            
        end
    end
    
    for nr=1:1:rzad
        for ns=1:1:stopien
            Mverif(:,stopien*rzad+(nr-1)*stopien+ns) = power(daneDynWerY( (rzad-nr+1):(end-nr) ),ns);      
        end
    end  
    
    YverifCalc = Mverif*Wlearn;
    errVerif = (sum(power( daneDynWerY(rzad+1:end)-YverifCalc, 2 )));    
    errArray((rzad-1)*maxStopien+stopien, 4) = errVerif;
    
%     if errVerif<(minErrVerify-minErrDelta)
%         minErrVerify = errVerif;
%         minErrVerifyN = Na;
%     end
    
    figure(1)
    
    subplot(2,1,1)
    hold on; grid on; box on;
    plot( daneDynUczY, '.');
    plot( YlearnCalc);
    title(strcat('Model na tle zbioru danych ucz¹cych, rzad=',num2str(rzad),', stopien=',num2str(stopien) ,' err=',num2str(errLearn)));
    %xlabel('Próbki');
    ylabel('Sygna³ wyjœciowy y');
    legend('Dane ucz¹ce','Wyjœcie modelu','location','southeast')
    %print(strcat('img/de/noRecur/learn/learn_r_',num2str(rzad),'_s_',num2str(stopien)), '-dpng');
    %close 1;
    
    %figure(2)
    subplot(2,1,2);
    hold on; grid on; box on;
    plot( daneDynWerY, '.');
    plot( YverifCalc);
    title(strcat('Model na tle zbioru danych weryfikuj¹cych, rzad=',num2str(rzad),', stopien=',num2str(stopien) ,' err=',num2str(errVerif)));
    xlabel('Próbki');
    ylabel('Sygna³ wyjœciowy y');
    legend('Dane weryfikuj¹ce','Wyjœcie modelu','location','southeast')
    print(strcat('img/de/noRecur/r_',num2str(rzad),'_s_',num2str(stopien)), '-dpng');
    close 1;
    end
end

% errArray
% display( strcat( 'Wybrany model: N= ', num2str(minErrVerifyN), '; errVerif= ', num2str(minErrVerify) ) );
