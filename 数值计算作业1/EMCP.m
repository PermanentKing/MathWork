function [x, XA] = EMCP(A,b)
[n,n] = size(A);
x = zeros(n,1);
Aug = [A,b]; %�������
for k = 1:n-1
    [piv,r] = max(abs(Aug(k:n,k))); %������Ԫ�����Ӿ������r
    r = r + k - 1; % ����Ԫ���ڴ�������
    if r>k
        temp=Aug(k,:);
        Aug(k,:)=Aug(r,:);
        Aug(r,:)=temp;
    end
    if Aug(k,k)==0, error('�Խ�Ԫ����0'), end
    % �����������Ԫ��Ϊ������
    for p = k+1:n
        Aug(p,:)=Aug(p,:)-Aug(k,:)*Aug(p,k)/Aug(k,k);
    end
end
XA = Aug;
% �������Ƿ�����
A = Aug(:,1:n); b = Aug(:,n+1);
x(n) = b(n)/A(n,n);
for k = n-1:-1:1
    x(k)=b(k);
    for p=n:-1:k+1
        x(k) = x(k)-A(k,p)*x(p);
    end
    x(k)=x(k)/A(k,k);
end
