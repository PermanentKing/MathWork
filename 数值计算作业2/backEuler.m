function [ y ] = backEuler()
%UNTITLED26 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
function t = f( x,y )
    t = y - ((2*x)/y);
end
h=0.1;
%y0 = 1
yn1 = 1;
yn2 = 0;
yt = 0;
x = 0;
y=[];
for n=1:10
    yt = yn1 + h*f(x,yn1);
    %������y(n+1)
    x = x+h;
    done = 0;
    while  ~done
        yn2 = yn1 + h * f(x,yt);
        done = (abs(yn2-yt)<1e-6);
        yt = yn2;
    end
    yn1 = yn2;
    y(n)=yn2;
    
end
end

