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
        disp('Warning: 迭代次数太多，可能不收敛！');
        return;
    end
    steps = steps + 1;
    a0 = r0'*r0/(p0'*A*p0);%多次用到可以存一步。
    x1 = x0 + a0*p0;

    r1 = r0 -a0*A*p0;

    b0 = r1'*r1/(r0'*r0);
    %这里的r'* r虽然后面可能还会用到，但是由于计算量不大，没有必要再设个新变量将
    %其存下了，内存上的开销划不来。
    p1 = r1 + b0*p0;

    %只是用到前后两层的向量，所以节省内存开销，计算完后面一层，可以往回覆盖掉没用
    %的变量。

    x0 = x1;
    r0 = r1;
    p0 = p1;
    
    tempf4(steps) = norm(xt-x0);

end
x = x0;
disp(steps)
end
