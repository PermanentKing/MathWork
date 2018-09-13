function [x, XA] = EMCP(A,b)
[n,n] = size(A);
x = zeros(n,1);
Aug = [A,b]; %增广矩阵
for k = 1:n-1
    [piv,r] = max(abs(Aug(k:n,k))); %找列主元所在子矩阵的行r
    r = r + k - 1; % 列主元所在大矩阵的行
    if r>k
        temp=Aug(k,:);
        Aug(k,:)=Aug(r,:);
        Aug(r,:)=temp;
    end
    if Aug(k,k)==0, error('对角元出现0'), end
    % 把增广矩阵消元成为上三角
    for p = k+1:n
        Aug(p,:)=Aug(p,:)-Aug(k,:)*Aug(p,k)/Aug(k,k);
    end
end
XA = Aug;
% 解上三角方程组
A = Aug(:,1:n); b = Aug(:,n+1);
x(n) = b(n)/A(n,n);
for k = n-1:-1:1
    x(k)=b(k);
    for p=n:-1:k+1
        x(k) = x(k)-A(k,p)*x(p);
    end
    x(k)=x(k)/A(k,k);
end
