function [ y ] = txing()
%UNTITLED23 此处显示有关此函数的摘要
%   此处显示详细说明
%采样点数目为5,9,17,33
a=0;
b=1;
n=[5,9,17,33];
y=[];

function t = f(x)
    if(x==0)
        t = 1;
    else
        t = sin(x)/x;
    end
end

for j=1:4
h=(b-a)/n(j);
sum=0;
for k=1:n(j)-1
    sum=sum+f(a+k*h);
end
y(j) = (f(a)+2*sum+f(b))*h/2;
%y = vpa(a,6)
end
end

