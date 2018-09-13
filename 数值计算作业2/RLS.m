function [ y ] = RLS()
%UNTITLED29 此处显示有关此函数的摘要
%   此处显示详细说明
A=normrnd(0,1,10000,10);
b=normrnd(0,1,10000,1);
m=10000;
n=10;
a = zeros(n,1);
AT = A(1:n,:);
bt = b(1:n);
a = (AT'*AT)^-1*AT'*bt;
P = (AT'*AT)^-1;
k = n;
pre=[];
result = A\b;

while(k<m)
    k = k+1;
    am = a;
    f = A(k,:);
    f = f';
    P = P-(P*f*f'*P)./(1+f'*P*f);
    a = am + P*f*(b(k)-f'*am);
    pre(k-n)=norm((a-result),2);
end
step=1:m-n;
plot(step,pre);
ylabel('收敛精度');
xlabel('迭代步数');
y = a;
end

