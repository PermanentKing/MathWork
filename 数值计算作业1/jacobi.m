function [x,n] = jacobi(A,b,x0,eps,M)


if nargin ==3
    eps = 1.0e-6;
    M = 100;
elseif nargin<3
    disp('���������Ŀ����3��');
    return
elseif nargin==4
    M = 100;
end

xt = A\b;
global tempf1
tempf1 = zeros(1, M);

D = diag(diag(A));%��A�ĶԽǾ���
L = -tril(A,-1);%��A�������Ǿ���
U = -triu(A,1);%��A�������Ǿ���
B = D\(L+U);
f = D\b;
x = B*x0+f;
n = 1;%��������
step1(n) = n;
tempf1(n) = norm(xt-x, 2);
while norm(x-x0)>=eps
    x0 = x;
    x = B*x0+f;
    n = n+1;
    step1(n) = n;
    tempf1(n) = norm(xt-x, 2);
    if(n>=M)
        disp('Warning:��������̫��,���ܲ�����!')
        return;
    end
end
disp(n);
%disp(step)
%disp(tempf)
%plot(step, tempf);


