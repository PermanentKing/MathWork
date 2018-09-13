function [x,n] = guaseidel(A,b,x0,eps,M)
xt = A\b;


if nargin == 3
    eps = 1.0e-6;
    M = 10000;
elseif nargin == 4
    M = 10000;
elseif nargin <3
    disp('���������������3��');
    return;
end

global step2
step2 = zeros(1, M);
global tempf2
tempf2 = zeros(1, M);

D = diag(diag(A));%��A�ĶԽǾ���
L = -tril(A,-1);%��A�������Ǿ���,�����Խ���
U = -triu(A,1);%��A�������Ǿ���
G = (D-L)\U;
f = (D-L)\b;
x = G*x0+f;
n=1;  %��������
tempf2(n) = norm(xt-x);
while norm(x-x0)>=eps
    x0 = x;
    x = G*x0+f;
    n = n+1;
    tempf2(n) = norm(xt-x);
    if(n>=M)
        disp('Warning:��������̫��,���ܲ�����');
        return;
    end
end
disp(n)
