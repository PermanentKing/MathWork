function [] = test2()
%UNTITLED36 此处显示有关此函数的摘要
%   此处显示详细说明
x=1:10;
y1=frontEuler();
y2=backEuler();
y3=trapzd();
y4=improEuler();
y5=sqrt(1+2*(x*0.1));
    
plot(x,y1,x,y2,x,y3,x,y4,x,y5);
legend('front','back','trapzd','impro','real-sqrt');
end

