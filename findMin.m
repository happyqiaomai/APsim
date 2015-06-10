a = 60;
b = 60;
increment = 5; % increment of APs, if only one set should be 1
m_set = 25:increment:25;
sumRsuqare = zeros(size(m_set));
sumRtriangle = zeros(size(m_set));
for m = m_set
    %m = 45; % number of AP
    %APs = genAPrand(a, b, m);
    APs = genAPsquare(a, b, m);
    
    figure;
    plot(APs(:,1) , APs(:,2),'.') %plot AP locations
    
    RSS = genRSS(APs, a, b); %generate RSS value of every pos
    R = genR(APs, a, b); %generate reliability value of every pos
    figure;
    surf(0:0.1:a, 0:0.1:b, R);
    shading interp
    figure;
    surf(0:0.1:a, 0:0.1:b, RSS);
    shading flat
    sumRsuqare(1,m/increment) = sum(sum(R(25:1:175,25:1:175)));
    APs = genAPtriangle(a, b, m);
    %APs = [2 2; 11 11;  15 06];
    
    figure;
    plot(APs(:,1) , APs(:,2),'.') %plot AP locations

    RSS = genRSS(APs, a, b); %generate RSS value of every pos
    R = genR(APs, a, b); %generate reliability value of every pos
    % APs
    % R
    sumRtriangle(1,m/increment) = sum(sum(R(25:1:175,25:1:175)));
    figure;
    surf(0:0.1:a, 0:0.1:b, R);
    shading interp
    figure;
    surf(0:0.1:a, 0:0.1:b, RSS);
    shading flat
end
% 
% plot(m_set,sumRsuqare*10);
% hold on;
% plot(m_set,sumRtriangle*10,'m');

