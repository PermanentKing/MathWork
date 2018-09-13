function [ y ] = triple( x,x1,y1,x2,y2,x3,y3,x4,y4 )
%UNTITLED15 此处显示有关此函数的摘要
%   此处显示详细说明
xt = [x1,x2,x3,x4];
yt = [y1,y2,y3,y4];
lt = [0,0,0,0];
y = 0;
for n=1:4
    upt = 1;
    downt = 1;
    for i =1:4
        if(i==n)
            continue
        else
           upt = upt*(x-xt(i));
           downt = downt*(xt(n)-xt(i));
        end
    end
    lt(n) = upt/downt;
end
for j=1:4
    y = y + yt(j)*lt(j);
end
end

