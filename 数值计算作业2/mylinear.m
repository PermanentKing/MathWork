function [ y ] = mylinear( x )
%UNTITLED13 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

x1 = 0.34;
x2 = 0.36;
y1 = 0.333487;
y2 = 0.352274;
l1 = (x-x2)/(x1-x2);
l2 = (x-x1)/(x2-x1);
y = y1*l1+y2*l2;
end

