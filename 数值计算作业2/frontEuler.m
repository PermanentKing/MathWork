function [ y ] = frontEuler()
%UNTITLED25 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%y = (1+2x)^0.5
h=0.1;
function t = f( x,y )
    t = y - ((2*x)/y);
end
yn1 = 1;
yn2 = 0;
y=[];
x = 0;
for n=1:10
    yn2 = yn1 + h*f(x,yn1);
    yn1 = yn2;
    y(n)=yn2;
    x = x + h;
end
end

