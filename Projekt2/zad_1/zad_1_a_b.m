clear
dataReaded = sortrows(dlmread('../danestat43.txt'));
dataLength = length( dataReaded );

hashIndex = randperm( length( dataReaded ) );

dataLearn = sortrows(dataReaded(hashIndex<=(dataLength/2),:));
dataVerif = sortrows(dataReaded(hashIndex>(dataLength/2),:));

clear hashIndex

figure(1)
plot( dataReaded(:,1), dataReaded(:,2), '.');
title('Dane statyczne');
grid on; box on;
xlabel('Sygna� wej�ciowy u');
ylabel('Sygna� wyj�ciowy y');
print('img/Dane_statyczne', '-dpng');
figure(2)
plot( dataLearn(:,1), dataLearn(:,2), '.');
title('Zbi�r ucz�cy');
grid on; box on;
xlabel('Sygna� wej�ciowy u');
ylabel('Sygna� wyj�ciowy y');
print('img/Zbior_uczacy', '-dpng');
figure(3)
plot( dataVerif(:,1), dataVerif(:,2), '.');
title('Zbi�r weryfikuj�cy');
grid on; box on;
xlabel('Sygna� wej�ciowy u');
ylabel('Sygna� wyj�ciowy y');
print('img/Zbior_weryfikujacy', '-dpng');