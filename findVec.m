a = 20;
b = 20;
m = 3;
APs = genAPsquare(a, b, m);

% plot(APs(:,1) , APs(:,2),'*') %plot AP locations
% for i = 1:1:m   
%     text(APs(i,1) , APs(i,2)+0.3,num2str(i));
% end
%hold on;
x = a/2 + roundn(rand*a/4, -1); % generate a user randomly
y = b/2 + roundn(rand*b/4, -1);
%plot(x,y,'square');
alpha = 0.01;
sigma = 1;
Z = zeros(1, m);
for j = 1:1:m    
    r = ((x - APs(j, 1))^2 + (y - APs(j, 2))^2)^(1/2);
    p = alpha^4*exp(-2*alpha*r) / (sigma^2);
    phi = atan((x - APs(j, 1)+0.000000000001)/ (y - APs(j, 2)));
    Z(1, j) = p * exp (2*1i*phi);
end
%figure;

plotZ(Z);
for i = 1:1:m   
    text(real(Z(i)), imag(Z(i)),num2str(i));
end

count = 0; %the number of deleted Z

for i = 1:1:m
    for j = 1:1:m
        for k = 1:1:m
            if checkDelete(Z(k),Z(i),Z(j))==1 %in the triangle
%                 if k == 32
%                     Z(i)
%                     Z(j)
%                     Z(k)
%                     figure;
%                     plot(real(Z(i)), imag(Z(i)),'*');
%                     hold on;
%                     plot(real(Z(j)), imag(Z(j)),'square');
%                     hold on;
%                     plot(real(Z(k)), imag(Z(k)),'-');
%                     hold on;
%                 end
                Z(k) = 0;
                
                count = count + 1;
%                 k = k - 1; 
%                 m = m - 1;
            end
        end
    end
end
figure;
plot(real(Z), imag(Z),'.');
for i = 1:1:m   
    text(real(Z(i)), imag(Z(i)),num2str(i));
end

disp(m-count);
figure;
plot(APs(:,1) , APs(:,2),'*') %plot AP locations
hold on;
for i = 1:1:m   
    if Z(i) ~= 0
        plot(APs(i,1) , APs(i,2),'square'); %AP that appear at convex hull
        hold on;
    end
    text(APs(i,1) , APs(i,2)+0.3, [num2str(i),':',num2str(abs(Z(i)))]);
end
hold on;
plot(x,y,'square');
 
