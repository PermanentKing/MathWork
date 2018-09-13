function [x,steps] = gongetidu(A,b,x0,eps,M)
r0 = b - A*x0;
p0 = r0;
if nargin == 3
    eps = 1.0e-6;
    M = 10000;
end
steps = 0;

xt = A\b;
global tempf4
tempf4 = zeros(1, M);

while 1
    if abs(p0) < eps
        break;
    end
    if(steps>=M)
        disp('Warning: ��������̫�࣬���ܲ�������');
        return;
    end
    steps = steps + 1;
    a0 = r0'*r0/(p0'*A*p0);%����õ����Դ�һ����
    x1 = x0 + a0*p0;

    r1 = r0 -a0*A*p0;

    b0 = r1'*r1/(r0'*r0);
    %�����r'* r��Ȼ������ܻ����õ����������ڼ���������û�б�Ҫ������±�����
    %������ˣ��ڴ��ϵĿ�����������
    p1 = r1 + b0*p0;

    %ֻ���õ�ǰ����������������Խ�ʡ�ڴ濪�������������һ�㣬�������ظ��ǵ�û��
    %�ı�����

    x0 = x1;
    r0 = r1;
    p0 = p1;
    
    tempf4(steps) = norm(xt-x0);

end
x = x0;
disp(steps)
end
