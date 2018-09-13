function [x,XA]=GaussXQByOrder(A,b)
%��˹˳����Ԫ��
N = size(A);
n = N(1);
for i=1:(n-1)
    for j=(i+1):n
        if(A(i,i)==0)
            disp('�Խ�Ԫ��Ϊ0��');            %��ֹ�Խ�Ԫ��Ϊ0
            return;
        end
        l = A(j,i);
        m = A(i,i);
        A(j,1:n)=A(j,1:n)-l*A(i,1:n)/m;   %��Ԫ����
        b(j)=b(j)-l*b(i)/m;
    end
end
x=SolveUpTriangle(A,b);                      %ͨ�õ���������ϵ���������Է�����ĺ���
XA = A;
disp(XA)
%��Ԫ���ϵ������
function x=SolveUpTriangle(A,b)
N=size(A);
n=N(1);
for i=n:-1:1
    if(i<n)
        s=A(i,(i+1):n)*x((i+1):n,1);
    else
        s=0;
    end
    x(i,1)=(b(i)-s)/A(i,i);
end
