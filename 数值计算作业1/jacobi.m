function [x,n] = jacobi(A,b,x0,eps,M)


if nargin ==3
    eps = 1.0e-6;
    M = 100;
elseif nargin<3
    disp('输入参数数目不足3个');
    return
elseif nargin==4
    M = 100;
end

xt = A\b;
global tempf1
tempf1 = zeros(1, M);

D = diag(diag(A));%求A的对角矩阵
L = -tril(A,-1);%求A的下三角矩阵
U = -triu(A,1);%求A的上三角矩阵
B = D\(L+U);
f = D\b;
x = B*x0+f;
n = 1;%迭代次数
step1(n) = n;
tempf1(n) = norm(xt-x, 2);
while norm(x-x0)>=eps
    x0 = x;
    x = B*x0+f;
    n = n+1;
    step1(n) = n;
    tempf1(n) = norm(xt-x, 2);
    if(n>=M)
        disp('Warning:迭代次数太多,可能不收敛!')
        return;
    end
end
disp(n);
%disp(step)
%disp(tempf)
%plot(step, tempf);


