function [ APs ] = state2APs( state,a,b )
%STATE2APS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

R = reshape(state, a*10+1, b*10+1);

[row, col] = find( R ~= 0 ); 

APs = [row'/10 - 0.1; col'/10 - 0.1];

end

