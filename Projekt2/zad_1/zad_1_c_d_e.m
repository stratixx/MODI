clear
load('dataStaticDivided.mat');
Ylearn = dataLearn(:,2);
Ulearn = dataLearn(:,1);
Yverif = dataVerif(:,2);
Uverif = dataVerif(:,1);

Nmax = 10;
minErrVerify = 100000.0;
minErrVerifyN = 1000;
minErrDelta = 0.01;
errArray = zeros(Nmax+1,3);

for N=0:1:Nmax
    errArray(N+1, 1) = N;
    
    Mlearn = ones(dataLength/2, N+1);
    for n=1:1:N
        Mlearn(:,n+1) = power(Ulearn,n);
    end
    Wlearn = Mlearn\Ylearn;
    YlearnCalc = Mlearn*Wlearn;
    errLearn = sqrt(sum(power( Ylearn-YlearnCalc, 2 )));
    errArray(N+1, 2) = errLearn;

    Mverif = ones(dataLength/2, N+1);
    for n=1:1:N
        Mverif(:,n+1) = power(Uverif,n);
    end
    YverifCalc = Mverif*Wlearn;
    errVerif = sqrt(sum(power( Yverif-YverifCalc, 2 )));
    errArray(N+1, 3) = errVerif;
    
    if errVerif<(minErrVerify-minErrDelta)
        minErrVerify = errVerif;
        minErrVerifyN = N;
    end
        
    figure(1)
    hold on; grid on; box on;
    plot( Ulearn, Ylearn, '.');
    plot( Ulearn, YlearnCalc);
    title(strcat('Model na tle zbioru danych ucz¹cych, N=',num2str(N),', err=',num2str(errLearn)));
    xlabel('Sygna³ wejœciowy u');
    ylabel('Sygna³ wyjœciowy y');
    %print(strcat('img/learn/learn_N_',num2str(N)), '-dpng');
    close 1;

    figure(2)
    hold on; grid on; box on;
    plot( Uverif, Yverif, '.');
    plot( Uverif, YverifCalc);
    title(strcat('Model na tle zbioru danych weryfikuj¹cych, N=',num2str(N),', err=',num2str(errVerif)));
    xlabel('Sygna³ wejœciowy u');
    ylabel('Sygna³ wyjœciowy y');
    %print(strcat('img/verif/verif_N_',num2str(N)), '-dpng');
    close 2;

end

errArray
display( strcat( 'Wybrany model: N= ', num2str(minErrVerifyN), '; errVerif= ', num2str(minErrVerify) ) );
