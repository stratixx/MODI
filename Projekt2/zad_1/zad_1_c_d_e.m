clear
load('dataStaticDivided.mat');
Ylearn = dataLearn(:,2);
Ulearn = dataLearn(:,1);
Yverif = dataVerif(:,2);
Uverif = dataVerif(:,1);

Nmax = 3;
minErrVerify = 100000.0;
minErrVerifyN = 1000;
minErrDelta = 1;
errArray = zeros(Nmax+1,3);

for N=3:1:Nmax
    errArray(N+1, 1) = N;
    
    Mlearn = ones(dataLength/2, N+1);
    for n=1:1:N
        Mlearn(:,n+1) = power(Ulearn,n);
    end
    Wlearn = Mlearn\Ylearn;
    YlearnCalc = Mlearn*Wlearn;
    errLearn = (sum(power( Ylearn-YlearnCalc, 2 )));
    errArray(N+1, 2) = errLearn;

    Mverif = ones(dataLength/2, N+1);
    for n=1:1:N
        Mverif(:,n+1) = power(Uverif,n);
    end
    YverifCalc = Mverif*Wlearn;
    errVerif = (sum(power( Yverif-YverifCalc, 2 )));
    errArray(N+1, 3) = errVerif;
    
    if errVerif<(minErrVerify-minErrDelta)
        minErrVerify = errVerif;
        minErrVerifyN = N;
    end
        
    figure(1)
    
    subplot(2,1,1);
    hold on; grid on; box on;
    plot( Ulearn, Ylearn, '.');
    plot( Ulearn, YlearnCalc);
    %xlabel('Sygna³ wejœciowy u');
    ylabel('Sygna³ wyjœciowy y');
    title(strcat('Model na tle danych uczacych N=',num2str(N),', err=',num2str(errLearn)));
    legend('y_L_E_A_R_N','y_M_O_D_E_L');

    subplot(2,1,2);
    hold on; grid on; box on;
    plot( Uverif, Yverif, '.');
    plot( Uverif, YverifCalc);
    xlabel('Sygna³ wejœciowy u');
    ylabel('Sygna³ wyjœciowy y');
    legend('y_V_E_R_I_F','y_M_O_D_E_L');
    
    title(strcat('Model na tle danych weryfikuj¹cych N=',num2str(N),', err=',num2str(errLearn)));
    %print(strcat('img/N_',num2str(N)), '-dpng');
    close 1;

end

errArray
display( strcat( 'Wybrany model: N= ', num2str(minErrVerifyN), '; errVerif= ', num2str(minErrVerify) ) );
