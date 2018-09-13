function [ y ] = binary()
%UNTITLED19 此处显示有关此函数的摘要
%   此处显示详细说明
a=10;
b=11;
e=1e-6;
time=[];
pre=[];
start=clock;
step = 1;
while(b-a)>e
    if(((b+a)/2)^2 >=115)
        b = (b+a)/2;
    else
        a = (b+a)/2;
    end
    now=clock;
    time(step)=datenum(now)-datenum(start);
    pre(step)=abs(sqrt(115)-(b+a)/2);
    step=step+1;
end
now=clock;
time(step)=datenum(now)-datenum(start);
pre(step)=abs(sqrt(115)-(b+a)/2);
st=1:step;
y = (b+a)/2
figure(1)
plot(time,pre);
xlabel('时间');
hold on
figure(2)
plot(st,pre);
xlabel('步数');
hold on

end

