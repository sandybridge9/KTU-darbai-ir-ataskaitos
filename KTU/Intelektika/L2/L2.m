% 1-3 uzduotis
load("sunspot.txt")
% 4 uzduotis
figure(1)
plot(sunspot(:,1), sunspot(:,2),'r-*')
xlabel("Metai")
ylabel("Demes")
title ("Saules demiu aktyvumo uz 1700-2014 metus grafikas")
% 5 uzduotis
L = length(sunspot);    % duomen? kiekis
P = [sunspot(1:L-2,2)'; % ?vesties duomen?
    sunspot(2:L-1,2)']; % matrica
T = sunspot(3:L,2)';    % i?vesties duomen? vektorius
%duomenu isvedimas i console
disp('Matricos P dydis')
size(P)
disp('Matricos P elementai')
P
disp('Matricos T dydis')
size(T)
disp('Matricos T elementai')
T
% 6 uzduotis
figure(2)
plot3(P(1,:), P(2,:), T, 'bo')
xlabel('Demes n-2 metais');
ylabel('Demes n-1 metais');
zlabel('Demes  n  metais');
title("Matricu P ir T duomenys")
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
net = newlind(Pu, Tu);
% 9 uzduotis
disp('neurono svorio koeficientai:' )
disp(net.IW{1}) 
disp(net.b{1})
%priskiriam svoriu reiksmes pagalbiniam kintamiesiems
w1 = net.IW{1}(1) 
w2 = net.IW{1}(2) 
b = net.b{1} 
% 10 uzduotis
% neurono veikimo imitacija
Tsu = sim(net,Pu)
figure(3)
hold on;
grid on;
plot(sunspot(3:202, 1), Tu, 'r-o');
plot(sunspot(3:202, 1), Tsu, 'b-o');
xlabel('Metai');
ylabel('Demes');
legend('Tikrosios reiksmes', 'Prognozuojamos reiksmes');
title('Prognozavimo kokybes patikrinimas, prognozuojant 1702-1901 metais');
% 11 uzduotis
% neurono veikimo imitacija
Ts = sim(net,P)
figure(4)
hold on;
grid on;
plot(sunspot(3:315, 1), T, 'r-o')
plot(sunspot(3:315, 1), Ts, 'b-o')
xlabel('Metai');
ylabel('Demes');
legend('Tikrosios reiksmes', 'Prognozuojamos reiksmes');
title('Prognozavimo kokybes patikrinimas, prognozuojant 1702-2014 metais');
% 12 uzduotis
e = (T-Ts)';
figure(5)
grid on;
plot(sunspot(3:315), e, 'b-o')
xlabel('Metai');
ylabel('Tikrosios ir prognozuojamos prognozes skirtumas');
title('Prognozes klaidu grafikas');
% 13 uzduotis
figure(6);
hist(e);
xlabel('Prognozes klaidos reiksme');
ylabel('Daznis');
title('Prognozes klaidu histograma');
% 14 uzduotis
disp('Vidutin?s kvadratin?s prognoz?s klaidos reik?m?')
mse_reiksme = mse(e)
clear()