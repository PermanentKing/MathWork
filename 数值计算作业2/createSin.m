function [x,t] = createSin()
%UNTITLED35 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

f1=50;%�ź�Ƶ��Hz
f2=150;%�ź�Ƶ��Hz
f3=200;%�ź�Ƶ��Hz
fs=2048;%����Ƶ��Hz
N=1024;%��������
t=(0:N-1)/fs;%����ʱ��s
x1=sin(2*pi*f1*t);%�źŲ���ֵ
x2=sin(2*pi*f2*t);%�źŲ���ֵ
x3=sin(2*pi*f3*t);%�źŲ���ֵ
x=x1+x2+x3;
plot(t,x,'.')
end

