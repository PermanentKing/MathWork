function [ y ] = simpson( a,b,n )
%UNTITLED24 此处显示有关此函数的摘要
%   此处显示详细说明

function t = f(x)
    if(x==0)
        t = 1;
    else
        t = sin(x)/x;
    end
end
a=0;
b=1;
n=[5,9,17,33];
y=[];

for k=1:4
h = (b-a)/n(k);
sum1 = 0;
sum2 = 0;
for i = 0:n(k)-1
    sum1 = sum1 + f(a+(i+1/2).*h);
end
for j = 1:n(k)-1
    sum2 = sum2 + f(a+j.*h);
end
y(k) = h/6*(f(a)+4*sum1+2*sum2+f(b));
end

end

