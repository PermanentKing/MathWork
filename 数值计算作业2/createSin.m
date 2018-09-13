function [x,t] = createSin()
%UNTITLED35 此处显示有关此函数的摘要
%   此处显示详细说明

f1=50;%信号频率Hz
f2=150;%信号频率Hz
f3=200;%信号频率Hz
fs=2048;%采样频率Hz
N=1024;%采样点数
t=(0:N-1)/fs;%采样时间s
x1=sin(2*pi*f1*t);%信号采样值
x2=sin(2*pi*f2*t);%信号采样值
x3=sin(2*pi*f3*t);%信号采样值
x=x1+x2+x3;
plot(t,x,'.')
end

