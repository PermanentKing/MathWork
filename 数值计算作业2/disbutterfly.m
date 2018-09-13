function [y,z] = disbutterfly(x)
    N=length(x);
    n=0:N/2-1;
    w=exp(-2*1i*pi/N).^n;
    x1=x(n+1);
    x2=x(n+1+N/2);
    y=x1+x2;
    z=(x1-x2).*w;
end
