% 1-3 uzduotis
load("sunspot.txt")
% 4 uzduotis
figure(1)
plot(sunspot(:,1), sunspot(:,2),'r-*')
xlabel("Metai")
ylabel("Demes")
title ("Saules demiu aktyvumo uz 1700-2014 metus grafikas")
% 5 uzduotis
L = length(sunspot)    % duomen? kiekis
P = [sunspot(1:L-6,2)'; % n = 6
    sunspot(2:L-5,2)';
    sunspot(3:L-4,2)';
    sunspot(4:L-3,2)'; 
    sunspot(5:L-2,2)'; 
    sunspot(6:L-1,2)'];
T = sunspot(7:L,2)';
%duomenu isvedimas i console
disp('Matricos P dydis')
size(P)
disp('Matricos P elementai')
P
disp('Matricos T dydis')
size(T)
disp('Matricos T elementai')
T
% 7 uzduotis
Pu = P(:, 1:200);
Tu = T(:, 1:200);
disp('Matricos Pu dydis')
size(Pu)
disp('Matrica Pu')
Pu
disp('Matricos Tu dydis')
size(Tu)
disp('Matrica Tu')
Tu
% 8 uzduotis
% sukuriam neurona ir apskaiciuojam jo svoriu reiksmes tiesioginiu metodu
%net = newlind(Pu, Tu);
% 15 uzduotis
S = 1
lr = 0.0000001;
% 16 uzduotis
net = newlin(Pu,S,0,lr)
% 17 uzduotis
net.trainParam.goal = 100; 
net.trainParam.epochs = 1000;
% 18 uzduotis
net = train(net, Pu, Tu)
disp('neurono svorio koeficientai:' )
disp(net.IW{1}) 
disp(net.b{1})
%svoriu reiksmiu priskyrimas
w1 = net.IW{1}(1) 
w2 = net.IW{1}(2) 
b = net.b{1} 
% 10 uzduotis
% neurono veikimo imitacija
Tsu = sim(net,Pu)
figure(3)
hold on;
grid on;
plot(sunspot(7:206, 1), Tu, 'r-o');
plot(sunspot(7:206, 1), Tsu, 'b-o');
xlabel('Metai');
ylabel('Demes');
legend('Tikrosios reiksmes', 'Prognozuojamos reiksmes');
title('Prognozavimo kokybes patikrinimas, prognozuojant 1702-1901 metais');
% 11 uzduotis
% neurono veikimo imitacija
Ts = sim(net, P)
figure(4)
hold on;
grid on;
plot(sunspot(7:315, 1), T, 'r-o')
plot(sunspot(7:315, 1), Ts, 'b-o')
xlabel('Metai');
ylabel('Demes');
legend('Tikrosios reiksmes', 'Prognozuojamos reiksmes');
title('Prognozavimo kokybes patikrinimas, prognozuojant 1702-2014 metais');
% 12 uzduotis
e = (T-Ts)'
figure(5)
grid on;
plot(sunspot(7:315), e, 'b-o')
xlabel('Metai');
ylabel('Tikrosios ir prognozuojamos prognozes skirtumas');
title('Prognozes klaidos grafikass');
% 13 uzduotis 
figure(6);
hist(e);
xlabel('Prognozes klaidos reiksme');
ylabel('Daznis');
title('Prognozes klaidu histograma');
% 14 uzduotis
disp('Vidutines kvadratines prognozes klaidos reiksme')
mse_reiksme = mse(e)
clear()
% 19 uzduotis
% Klausimai:
% 1. Ka pavaizduoja diagrama,  kuri vaizduojama mokymosi proceso metu?
% Diagrama pavaizduoja dirbtinio neurono modeli
% 2. Ar mokymosi procesas yra konverguojantis? Jeigu ne, pamastyti kas gali b?ti priezastimi ir pakeisti atitinkama parametra. 
% Nekonveguojantis, galbut pavyzdziu kiekio pakeitimas???
% 3. Kokios yra naujos neurono svoriu koeficientu reiksm?s ? 
% Naujos gautos reiksmes yra toliau 0 negu senos
% 4. Kokia yra neurono darbo kokybes ivercio – vidutinis kvadratinis nuokrypis – reiksme ?
% 357.2350




