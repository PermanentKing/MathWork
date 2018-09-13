function [] = useFFT()
%UNTITLED31 此处显示有关此函数的摘要
%   此处显示详细说明
N=1024;
fs=2048;
k=0:N-1;
k=k*fs/N-1;
%a=[1,2,3,4,5,6,7,8];
[a,t]=createSin();
X=fft(a)/(N*2);
%X=fftshift(X);
X1=myfft(a)/(N*2);
X0=fft(a)-myfft(a);
subplot(4,1,1);
%stem(a);
plot(k,a);
title('序列');
subplot(4,1,2);
%stem(X);
X = abs(X);
plot(k,X);
title('fft');
subplot(4,1,3);
%stem(X1);
X1 = abs(X1);
plot(k,X1);
title('myfft');
subplot(4,1,4);
%stem(X0);
X0 = abs(X0);
plot(k,X0);
title('fft-myfft');
end

