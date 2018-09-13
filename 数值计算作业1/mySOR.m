function [x,n]=mySOR(A,b,x0,w,eps,M)
if nargin==4
    eps= 1.0e-6;
    M  = 10000;
elseif nargin<4
    disp('error')
    return
elseif nargin ==5
    M  = 10000;
end  
if(w<=0 || w>=2)
    disp('error')
    return;
end

xt = A\b;
global tempf3
tempf3 = zeros(1, M);

D=diag(diag(A));    %求A的对角矩阵
L=-tril(A,-1);      %求A的下三角阵
U=-triu(A,1);       %求A的上三角阵
B=(D-w*L)\((1-w)*D+w*U);
f=w*((D-w*L)\b);
x=B*x0+f;
n=1;                  %迭代次数
tempf3(n) = norm(xt-x);
while norm(x-x0)>=eps
    x0=x;
    x =B*x0+f;
    n=n+1;
    tempf3(n) = norm(xt-x);
    if(n>=M)
        disp('Warning: 迭代次数太多，可能不收敛！');
        return;
    end
end
disp(n)

