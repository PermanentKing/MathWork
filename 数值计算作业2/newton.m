function [ y ] = newton()
%UNTITLED20 此处显示有关此函数的摘要
%   此处显示详细说明
e=1e-6;
xk1 = 11;
xk2 = 10;
step = 1;
time=[];
pre=[];
start=clock;

while(xk1-xk2>e&&step<30)
    if(step~=1)
        xk1 = xk2;
    end
    xk2 = xk1 - (xk1^2-115)/(2*xk1);
    now=clock;
    time(step)=datenum(now)-datenum(start);
    pre(step)=abs(sqrt(115)-xk2);
    step = step + 1;
end
now=clock;
time(step)=datenum(now)-datenum(start);
pre(step)=abs(sqrt(115)-xk2);
st=1:step;
figure(1)
plot(time,pre);
xlabel('时间');
hold on
figure(2)
plot(st,pre);
xlabel('步数');
hold on
y = xk2
end

