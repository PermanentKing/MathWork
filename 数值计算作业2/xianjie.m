function [ y ] = xianjie()
%UNTITLED22 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
e=1e-6;
xk1 = 11;
xk2 = 10.9;
xk3 = 0;
step = 1;
time=[];
pre=[];
start=clock;

while(xk2-xk3>e&&step<20)
    if(step~=1)
        xk1 = xk2;
        xk2 = xk3;
    end
    xk3 = xk2 - ((xk2^2-115)/((xk2^2-115)-(xk1^2-115)))*(xk2-xk1);
    now=clock;
    time(step)=datenum(now)-datenum(start);
    pre(step)=abs(sqrt(115)-xk3);
    step = step+1;
end
now=clock;
time(step)=datenum(now)-datenum(start);
pre(step)=abs(sqrt(115)-xk3);
st=1:step;
figure(1)
plot(time,pre);
xlabel('ʱ��');
hold on
figure(2)
plot(st,pre);
xlabel('����');
hold on
y = xk3;
    

end

