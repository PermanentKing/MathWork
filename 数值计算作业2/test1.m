function [] = test1()
%UNTITLED18 此处显示有关此函数的摘要
%   此处显示详细说明
format long
x=0.35;
x1=0.32;
x2=0.34;
x3=0.36;
x4=0.38;
y1=0.314567;
y2=0.333487;
y3=0.352274;
y4=0.370920;

ans1 = mylinear(x)
ans2 = quadratic(x,x1,y1,x2,y2,x3,y3)
ans3 = triple(x,x1,y1,x2,y2,x3,y3,x4,y4)

end

