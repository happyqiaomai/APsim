a = 60;
b = 60;
m = 4;
%APs = [20 20; 20 40; 20+10*3^(1/2) 30];
APs = genAPsquare(a, b, m);
    
figure;
plot(APs(:,1) , APs(:,2),'.') %plot AP locations

RSS = genRSS(APs, a, b); %generate RSS value of every pos
R = genR(APs, a, b); %generate reliability value of every pos
figure;
surf(0:0.1:a, 0:0.1:b, R);
title('Realiability of each point');
shading interp
figure;
surf(0:0.1:a, 0:0.1:b, RSS);
title('RSS of each point');
shading flat