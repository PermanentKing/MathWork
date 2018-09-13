function [ y ] = trapzd()
%UNTITLED28 此处显示有关此函数的摘要
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
    yn2 = yn1 + h * f(x,yn1);
    done = 0;
    while ~done
        yt = yn1 + 0.5*h*(f(x,yn1)+f(x+h,yn2));
        done = (abs(yt-yn2)<1e-6);
        yn2 = yt;
    end
    x = x + h;
    yn1 = yn2;
    y(n)=yn2;
end
end

