function [ y ] = improEuler()
%UNTITLED27 此处显示有关此函数的摘要
%   此处显示详细说明
function t = f( x,y )
    t = y - ((2*x)/y);
end
h=0.1;
yn1 = 1;
yn2 = 0;
x = 0;
y=[];
for n=1:10
    yt1 = yn1 + h*f(x,yn1);
    yt2 = yn1 + h*f(x+h,yt1);
    yn2 = 0.5*(yt1+yt2);
    yn1 = yn2;
    y(n)=yn2;
    x = x+h;
end
end

