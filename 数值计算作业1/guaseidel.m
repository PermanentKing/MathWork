function [x,n] = guaseidel(A,b,x0,eps,M)
xt = A\b;


if nargin == 3
    eps = 1.0e-6;
    M = 10000;
elseif nargin == 4
    M = 10000;
elseif nargin <3
    disp('输入参数个数不足3个');
    return;
end

global step2
step2 = zeros(1, M);
global tempf2
tempf2 = zeros(1, M);

D = diag(diag(A));%求A的对角矩阵
L = -tril(A,-1);%求A的下三角矩阵,不带对角线
U = -triu(A,1);%求A的上三角矩阵
G = (D-L)\U;
f = (D-L)\b;
x = G*x0+f;
n=1;  %迭代次数
tempf2(n) = norm(xt-x);
while norm(x-x0)>=eps
    x0 = x;
    x = G*x0+f;
    n = n+1;
    tempf2(n) = norm(xt-x);
    if(n>=M)
        disp('Warning:迭代次数太多,可能不收敛');
        return;
    end
end
disp(n)
