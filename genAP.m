function [ APs ] = genAP( a, b, m )
%GENAP generate AP locations APs
%   a: stands for x-length
%   b: stands for y-length
%   m: stands for the number of APs

APs = zeros(m, 2);
n = round(m^(1/2));
% for i = 1:1:m
%     APs(i, 1) = rem(i,n) * (a/n) + (a/n/2) ;
%     APs(i, 2) = rem( round(i/n) * (b/n) + (b/n/2), b);
%     APs

% for i = 1:1:m
%     APs(i, 1) = roundn(rand*a, -1);
%     APs(i, 2) = roundn(rand*b, -1);
% end
num = (a*10 + 1) * (b* 10 + 1);
state = ones(1, num);
e = ones(1, num);

for counter=1:1:10000
        empty=0;
        full=0;
        if dot(state,e)==num
               full=1;
        end
        if dot(state,e)==0
               empty=1;
        end
        
        addOrRemove=fix(rand()+0.5);%0 is to remove while 1 is to add
        
        while (addOrRemove==0 && empty==1)||(addOrRemove==1 && full==1)
                addOrRemove=fix(rand()+0.5);
        end
        
        if addOrRemove==1
               E=sum(sum(genR(state2APs(state, a, b), a, b)));
               T=dot(e,state);
              
               if  rand()<exp(-E/T)
                   add=fix(rand()*num)+1;
                   while state(add)~=0
                       add=fix(rand()*num)+1;
                   end
                   state(add)=1;
               end
        end
              
        if addOrRemove==0
            remove=fix(rand()*num)+1;
            while state(remove)~=1
                remove=fix(rand()*num)+1;
            end
            state(remove)=0;
            sumR = sum(sum(genR(state2APs(state, a, b), a, b)));
            if sumR < 1.3837e-05
                state(remove)=1;
            end
        end
end

APs = state2APs(state, a, b);

end

